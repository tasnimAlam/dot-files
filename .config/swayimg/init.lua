-- General config
swayimg.mode = "viewer" -- mode at startup
swayimg.antialiasing = true -- anti-aliasing
swayimg.decoration = true -- window title/buttons/borders
swayimg.overlay = false -- window overlay mode
swayimg.exif_orientation = true -- image orientation by EXIF
swayimg.dnd_button = "MouseRight" -- drag-and-drop mouse button

-- Image list configuration
swayimg.imagelist.order = "numeric" -- list order
swayimg.imagelist.reverse = false -- reverse order
swayimg.imagelist.recursive = false -- recursive directory reading
swayimg.imagelist.adjacent = false -- add adjacent files from same dir
swayimg.imagelist.fsmon = true -- enable file system monitoring

-- Text overlay configuration
swayimg.text.font = "monospace" -- font name
swayimg.text.size = 24 -- font size in pixels
swayimg.text.spacing = 0 -- line spacing
swayimg.text.padding = 10 -- padding from window edge
swayimg.text.color = 0xffcccccc -- foreground text color
swayimg.text.background = 0x00000000 -- text background color
swayimg.text.shadow = 0x0d000000 -- text shadow color
swayimg.text.timeout = 5 -- layer hide timeout
swayimg.text.status_timeout = 3 -- status message hide timeout

-- Image viewer mode
swayimg.viewer.default_scale = "optimal" -- default image scale
swayimg.viewer.default_position = "center" -- default image position
swayimg.viewer.drag_button = "MouseLeft" -- mouse button to drag image
swayimg.viewer.set_window_background(0xff000000) -- window background color
swayimg.viewer.set_image_chessboard(20, 0xff333333, 0xff4c4c4c) -- chessboard
swayimg.viewer.autocenter = true -- enable automatic centering
swayimg.viewer.loop = true -- enable image list loop mode
swayimg.viewer.preload = 1 -- number of images to preload
swayimg.viewer.history = 1 -- number of the history cache
swayimg.viewer.mark_color = 0xff808080 -- mark icon color
swayimg.viewer.set_text("topleft", { -- top left text block scheme
	"File: {name}",
	"Format: {format}",
	"File size: {sizehr}",
	"File time: {time}",
	"EXIF date: {meta.Exif.Photo.DateTimeOriginal}",
	"EXIF camera: {meta.Exif.Image.Model}",
})
swayimg.viewer.set_text("topright", { -- top right text block scheme
	"Image: {list.index} of {list.total}",
	"Frame: {frame.index} of {frame.total}",
	"Size: {frame.width}x{frame.height}",
})
swayimg.viewer.set_text("bottomleft", { -- bottom left text block scheme
	"Scale: {scale}",
})

-- Shared helpers
--
-- ponytail: one pending_delete shared by all modes. Switching modes with a
-- delete pending leaves it armed; clear it from on_image_change if that bites.
local pending_delete = nil -- array of paths awaiting confirmation

-- paths of every marked entry in the image list
local function marked_paths()
	local paths = {}
	for _, entry in ipairs(swayimg.imagelist.get()) do
		if entry.mark then
			table.insert(paths, entry.path)
		end
	end
	return paths
end

local function request_delete(paths, label)
	if not paths or #paths == 0 then
		swayimg.text.status = "Nothing to delete"
		return
	end
	pending_delete = paths
	swayimg.text.status = "Delete " .. label .. "? (Enter/n)"
end

-- single image, guarded against get_image() returning nil
local function request_delete_current(image)
	if not image then
		return
	end
	request_delete({ image.path }, image.path)
end

-- returns true if a pending delete was consumed
local function confirm_delete()
	if not pending_delete then
		return false
	end
	for _, path in ipairs(pending_delete) do
		os.remove(path)
	end
	swayimg.imagelist.remove(pending_delete)
	swayimg.text.status = "Deleted " .. #pending_delete .. " file(s)"
	pending_delete = nil
	return true
end

-- returns true if a pending delete was consumed
local function cancel_delete()
	if not pending_delete then
		return false
	end
	swayimg.text.status = "Cancelled"
	pending_delete = nil
	return true
end

local function copy_image_to_clipboard(path)
	os.execute(string.format(
		"convert %q png:- | wl-copy --type image/png &",
		path
	))
	swayimg.text.status = "Copied: " .. path
end

-- Key and mouse bindings in viewer mode 

-- bind Escape to go back to gallery (cancels a pending delete first); q exits
swayimg.viewer.on_key("Escape", function()
	if not cancel_delete() then
		swayimg.mode = "gallery"
	end
end)
swayimg.viewer.on_key("q", function()
	swayimg.exit()
end)
-- bind p key for previous file
swayimg.viewer.on_key("p", function()
	swayimg.viewer.open("prev")
end)
-- bind n key for next file (cancels a pending delete first)
swayimg.viewer.on_key("n", function()
	if not cancel_delete() then
		swayimg.viewer.open("next")
	end
end)
-- bind mouse vertical scroll button with pressed Ctrl to zoom in the image at mouse pointer coordinates
swayimg.viewer.on_mouse("Ctrl-ScrollUp", function()
	local pos = swayimg.get_mouse_pos()
	local scale = swayimg.viewer.scale
	scale = scale + scale / 10
	swayimg.viewer.set_abs_scale(scale, pos.x, pos.y)
end)
-- bind r to rotate image right (90 degrees clockwise)
swayimg.viewer.on_key("r", function()
	swayimg.viewer.rotate(90)
end)
-- bind Shift+j / Shift+k to next / previous file (+ and - zoom by default)
swayimg.viewer.on_key("Shift+j", function()
	swayimg.viewer.open("next")
end)
swayimg.viewer.on_key("Shift+k", function()
	swayimg.viewer.open("prev")
end)
-- bind g / Shift+g to first / last file
swayimg.viewer.on_key("g", function()
	swayimg.viewer.open("first")
end)
swayimg.viewer.on_key("Shift+g", function()
	swayimg.viewer.open("last")
end)
-- bind j to step image down by 20px
swayimg.viewer.on_key("j", function()
	local pos = swayimg.viewer.get_position()
	swayimg.viewer.set_abs_position(pos.x, pos.y - 20)
end)
-- bind k to step image up by 20px
swayimg.viewer.on_key("k", function()
	local pos = swayimg.viewer.get_position()
	swayimg.viewer.set_abs_position(pos.x, pos.y + 20)
end)
-- bind h to step image left by 20px
swayimg.viewer.on_key("h", function()
	local pos = swayimg.viewer.get_position()
	swayimg.viewer.set_abs_position(pos.x + 20, pos.y)
end)
-- bind l to step image right by 20px
swayimg.viewer.on_key("l", function()
	local pos = swayimg.viewer.get_position()
	swayimg.viewer.set_abs_position(pos.x - 20, pos.y)
end)
-- bind Ctrl-d / Ctrl-u to step the image by half the window height
swayimg.viewer.on_key("Ctrl-d", function()
	local wnd = swayimg.get_window_size()
	local pos = swayimg.viewer.get_position()
	swayimg.viewer.set_abs_position(pos.x, math.floor(pos.y - wnd.height / 2))
end)
swayimg.viewer.on_key("Ctrl-u", function()
	local wnd = swayimg.get_window_size()
	local pos = swayimg.viewer.get_position()
	swayimg.viewer.set_abs_position(pos.x, math.floor(pos.y + wnd.height / 2))
end)
-- bind x to delete the current file (with Enter/n confirmation)
swayimg.viewer.on_key("x", function()
	request_delete_current(swayimg.viewer.get_image())
end)
-- Return confirms a pending delete, otherwise switches to gallery (the default)
swayimg.viewer.on_key("Return", function()
	if not confirm_delete() then
		swayimg.mode = "gallery"
	end
end)

-- Slide show mode, same config as for viewer mode with the following defaults:
swayimg.slideshow.timeout = 5 -- timeout to switch image
swayimg.slideshow.default_scale = "fit" -- default image scale
swayimg.slideshow.set_window_background("auto") -- window background mode
swayimg.slideshow.history = 0 -- number of the history cache
swayimg.slideshow.set_text("topleft", { "{name}" }) -- top left text block scheme

-- Gallery mode
swayimg.gallery.aspect = "fill" -- thumbnail aspect ratio
swayimg.gallery.thumb_size = 200 -- thumbnail size in pixels
swayimg.gallery.padding_size = 5 -- padding between thumbnails
swayimg.gallery.border_size = 5 -- border size for selected thumbnail
swayimg.gallery.border_color = 0xffaaaaaa -- border color for selected thumbnail
swayimg.gallery.selected_scale = 1.15 -- scale for selected thumbnail
swayimg.gallery.selected_color = 0xff404040 -- background color for selected thumbnail
swayimg.gallery.unselected_color = 0xff202020 -- background color for unselected thumbnail
swayimg.gallery.window_color = 0xff000000 -- window background color
swayimg.gallery.cache = 100 -- number of thumbnails stored in memory
swayimg.gallery.preload = false -- preloading invisible thumbnails
swayimg.gallery.pstore = false -- enable persistent storage for thumbnails
swayimg.gallery.set_text("topleft", { -- top left text block scheme
	"File: {name}",
})
swayimg.gallery.set_text("topright", { -- top right text block scheme
	"{list.index} of {list.total}",
})

-- Key and mouse bindings in gallery mode 

-- bind q or Escape for exit
swayimg.gallery.on_key("q", function()
	swayimg.exit()
end)
swayimg.gallery.on_key("Escape", function()
	if not cancel_delete() then
		swayimg.exit()
	end
end)
-- bind the j key to select thumbnail on the down side
swayimg.gallery.on_key("j", function()
	swayimg.gallery.select("down")
end)
-- bind the k key to select thumbnail on the up side
swayimg.gallery.on_key("k", function()
	swayimg.gallery.select("up")
end)
-- bind the h key to select thumbnail on the left side
swayimg.gallery.on_key("h", function()
	swayimg.gallery.select("left")
end)
-- bind the l key to select thumbnail on the right side
swayimg.gallery.on_key("l", function()
	swayimg.gallery.select("right")
end)
-- bind the g key to go to first image
swayimg.gallery.on_key("g", function()
	swayimg.gallery.select("first")
end)
-- bind the Shift + g key to go to last image
swayimg.gallery.on_key("Shift+g", function()
	swayimg.gallery.select("last")
end)
-- bind Ctrl+d to scroll thumbnails down (next page)
swayimg.gallery.on_key("Ctrl-d", function()
	swayimg.gallery.select("pgdown")
end)
-- bind space to mark/unmark the selected image, then advance to the next one
-- (marks drive Shift+x and Ctrl-p below); select() is a no-op at the end of the list
swayimg.gallery.on_key("space", function()
	swayimg.gallery.mark_image()
	swayimg.gallery.select("right")
end)
-- bind x to delete the current file (with Enter/n confirmation)
swayimg.gallery.on_key("x", function()
	request_delete_current(swayimg.gallery.get_image())
end)
-- bind Shift+x to delete every marked file (with Enter/n confirmation)
swayimg.gallery.on_key("Shift+x", function()
	local paths = marked_paths()
	request_delete(paths, #paths .. " marked files")
end)
-- Return confirms a pending delete, otherwise switches to viewer
swayimg.gallery.on_key("Return", function()
	if not confirm_delete() then
		swayimg.mode = "viewer"
	end
end)
swayimg.gallery.on_key("n", function()
	cancel_delete()
end)
-- bind Ctrl+u to scroll thumbnails up (previous page)
swayimg.gallery.on_key("Ctrl-u", function()
	swayimg.gallery.select("pgup")
end)

--
-- Other configuration examples
--

-- force set scale mode on window resize (useful for tiling compositors)
swayimg.on_window_resize(function()
	if swayimg.mode == "viewer" then
		swayimg.viewer.set_fix_scale("optimal")
	end
end)

-- bind the Delete key in slide show mode to delete the current file (with Enter/n confirmation)
swayimg.slideshow.on_key("Delete", function()
	request_delete_current(swayimg.slideshow.get_image())
end)
swayimg.slideshow.on_key("Return", function()
	confirm_delete()
end)
swayimg.slideshow.on_key("n", function()
	cancel_delete()
end)
-- bind q or Escape for exit (Escape cancels a pending delete first)
swayimg.slideshow.on_key("q", function()
	swayimg.exit()
end)
swayimg.slideshow.on_key("Escape", function()
	if not cancel_delete() then
		swayimg.exit()
	end
end)

-- set a custom window title in gallery mode
swayimg.gallery.on_image_change(function()
	local image = swayimg.gallery.get_image()
	swayimg.title = "Gallery: " .. image.path
end)

-- print paths to all marked files by pressing Ctrl-p in gallery mode
swayimg.gallery.on_key("Ctrl-p", function()
	local paths = marked_paths()
	if #paths == 0 then
		swayimg.text.status = "No marked images"
		return
	end
	local text = table.concat(paths, "\n")
	-- swayimg's print() goes to stderr and is buffered, so it is invisible when
	-- launched from a compositor keybind; write explicitly and flush for the
	-- terminal case, and put the list on the clipboard for every other case.
	io.stderr:write(text, "\n")
	io.stderr:flush()
	local pipe = io.popen("wl-copy", "w")
	if pipe then
		pipe:write(text, "\n")
		pipe:close()
	end
	swayimg.text.status = "Copied " .. #paths .. " marked path(s) to clipboard"
end)

swayimg.viewer.on_key("y", function()
  local image = swayimg.viewer.get_image()
  copy_image_to_clipboard(image.path)
end)

swayimg.gallery.on_key("y", function()
  local image = swayimg.gallery.get_image()
  copy_image_to_clipboard(image.path)
end)
