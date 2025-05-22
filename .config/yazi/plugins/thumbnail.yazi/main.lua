local get_target_directory = ya.sync(function()
	local tab = cx.active
	local target_dir = nil

	-- Case 1: A directory is currently hovered
	if tab.current.hovered and tab.current.hovered.is_dir then
		target_dir = tostring(tab.current.hovered.url)
	-- Case 2: A file is hovered, or nothing specific is hovered (so use the current pane's directory)
	else
		target_dir = tostring(tab.current.cwd)
	end

	return target_dir
end)

return {
	entry = function()
		ya.mgr_emit("escape", { visual = true }) -- Deselects if in visual mode

		local dir_to_open = get_target_directory()

		local status, err = Command("swayimg"):arg("--gallery"):arg(dir_to_open):spawn():wait()

		if not status or not status.success then
			ya.notify({
				title = "Sway image gallery",
				content = string.format("Failed : %s", status and status.code or err),
				level = "error",
				timeout = 5,
			})
		end
	end,
}
