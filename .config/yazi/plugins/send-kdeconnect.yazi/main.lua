-- Yazi plugin to send selected files using KDE Connect.
--
-- Dependencies:
--     - kdeconnect-cli (install via your distribution's package manager)
--
-- Configuration:
--     Add the following to your Yazi plugin configuration (~/.config/yazi/plugin.toml):
--
--     [plugins.kdeconnect]
--     name = "kdeconnect"
--     text = "Send with KDE Connect"
--     desc = "Send selected files using KDE Connect"
--     挂载点 = "selection"  -- "selection" for file selection, "boson" for preview
--     入口 = "main.lua"
--
--     -- (Optional) Add a keybinding in ~/.config/yazi/keymap.toml:
--     -- [keys.normal]
--     -- "s" = "plugin:kdeconnect" # Maps 's' to the plugin in normal mode
--
-- Usage:
--     1.  Select files in Yazi.
--     2.  Trigger the plugin (via command, keybinding, or context menu).
--     3.  A list of connected KDE Connect devices will be displayed.
--     4.  Select the device to send the files to.
--

local subprocess = require("yazi.utils.subprocess")
local log = require("yazi.utils.log")

local function get_connected_devices()
	---Retrieves a list of connected KDE Connect devices using `kdeconnect-cli`.
	---
	---@return string[] A list of device IDs.  Returns an empty list on error.
	local result = subprocess.run(
		{ "kdeconnect-cli", "--list-available-devices" },
		{ capture_output = true, text = true }
	)
	if not result.success then
		log.error("Error getting connected devices: " .. (result.stderr or result.error or "Unknown error"))
		return {}
	end

	local devices = {}
	for line in result.stdout:gmatch("[^\r\n]+") do
		if line:match("id:") then
			local device_id = line:match("id:%s*([^%s]+)")
			table.insert(devices, device_id)
		end
	end
	return devices
end

local function get_device_name(device_id)
	---Gets the name of a device, given its ID, using `kdeconnect-cli`.
	---
	---@param device_id string The ID of the device.
	---
	---@return string The name of the device, or "Unknown Device" on error.
	local result = subprocess.run(
		{ "kdeconnect-cli", "-d", device_id, "--show-name" },
		{ capture_output = true, text = true }
	)
	if not result.success then
		--  Attempt a ping, though it doesn't reliably return the name
		local ping_result = subprocess.run(
			{ "kdeconnect-cli", "-d", device_id, "--ping" },
			{ capture_output = true, text = true }
		)
		if ping_result.success then
			return "Unknown Device"
		else
			log.error("Error getting device name: " .. (result.stderr or result.error or "Unknown error"))
			return "Unknown Device"
		end
	end
	return result.stdout:match("^%s*(.-)%s*$") or "Unknown Device"
end

local function send_files(device_id, files)
	---Sends files to a specified device using `kdeconnect-cli`.
	---
	---@param device_id string The ID of the target device.
	---@param files string[] A list of file paths to send.
	local command = { "kdeconnect-cli", "-d", device_id, "--send" }
	for _, file in ipairs(files) do
		table.insert(command, file)
	end
	local result = subprocess.run(command) -- No output unless there's an error.

	if result.success then
		log.info("Successfully sent files to device: " .. device_id)
	else
		log.error("Failed to send files: " .. (result.stderr or result.error or "Unknown error"))
	end
end

local function main(ctx)
	---Main plugin function.  This is called by Yazi.
	---
	---@param ctx table The Yazi context object.
	if not ctx.selection or #ctx.selection == 0 then
		log.warn("No files selected.")
		return
	end

	local selected_files = {}
	for _, file in ipairs(ctx.selection) do
		table.insert(selected_files, file.path)
	end

	local devices = get_connected_devices()
	if not devices or #devices == 0 then
		log.warn("No connected KDE Connect devices found.")
		return
	end

	-- Display devices and let the user choose.
	print("Connected KDE Connect Devices:")
	for i, device_id in ipairs(devices) do
		local device_name = get_device_name(device_id)
		print(string.format("%d. %s (%s)", i, device_name, device_id))
	end

	io.write("Enter the number of the device to send to: ")
	local choice = tonumber(io.read())
	if choice and choice >= 1 and choice <= #devices then
		local selected_device = devices[choice]
		send_files(selected_device, selected_files)
	else
		log.error("Invalid device selection.")
	end
end

return { main = main }
