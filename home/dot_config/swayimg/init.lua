-- General config
swayimg.set_mode("viewer") -- mode at startup
swayimg.enable_antialiasing(true) -- anti-aliasing
swayimg.enable_decoration(true) -- window title/buttons/borders
swayimg.enable_overlay(false) -- window overlay mode
swayimg.enable_exif_orientation(true) -- image orientation by EXIF
swayimg.set_dnd_button("MouseRight") -- drag-and-drop mouse button

-- Image list configuration
swayimg.imagelist.set_order("numeric") -- list order
swayimg.imagelist.enable_reverse(false) -- reverse order
swayimg.imagelist.enable_recursive(false) -- recursive directory reading
swayimg.imagelist.enable_adjacent(false) -- add adjacent files from same dir
swayimg.imagelist.enable_fsmon(true) -- enable file system monitoring

-- Text overlay configuration
swayimg.text.set_font("monospace") -- font name
swayimg.text.set_size(24) -- font size in pixels
swayimg.text.set_spacing(0) -- line spacing
swayimg.text.set_padding(10) -- padding from window edge
swayimg.text.set_foreground(0xffcccccc) -- foreground text color
swayimg.text.set_background(0x00000000) -- text background color
swayimg.text.set_shadow(0x0d000000) -- text shadow color
swayimg.text.set_timeout(5) -- layer hide timeout
swayimg.text.set_status_timeout(3) -- status message hide timeout

-- Image viewer mode
swayimg.viewer.set_default_scale("optimal") -- default image scale
swayimg.viewer.set_default_position("center") -- default image position
swayimg.viewer.set_drag_button("MouseLeft") -- mouse button to drag image
swayimg.viewer.set_window_background(0xff000000) -- window background color
swayimg.viewer.set_image_chessboard(20, 0xff333333, 0xff4c4c4c) -- chessboard
swayimg.viewer.enable_centering(true) -- enable automatic centering
swayimg.viewer.enable_loop(true) -- enable image list loop mode
swayimg.viewer.limit_preload(1) -- number of images to preload
swayimg.viewer.limit_history(1) -- number of the history cache
swayimg.viewer.set_mark_color(0xff808080) -- mark icon color
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

-- Key and mouse bindings in viewer mode 

-- bind Escape or q key for exit
swayimg.viewer.on_key("Escape", function()
	swayimg.exit()
end)
swayimg.viewer.on_key("q", function()
	swayimg.exit()
end)
-- bind p key for previous file
swayimg.viewer.on_key("p", function()
	swayimg.viewer.switch_image("prev")
end)
-- bind n key for next file
swayimg.viewer.on_key("n", function()
	swayimg.viewer.switch_image("next")
end)
-- bind the left arrow key to move the image to the left by 1/10 of the application window size
swayimg.viewer.on_key("Left", function()
	local wnd = swayimg.get_window_size()
	local pos = swayimg.viewer.get_position()
	swayimg.viewer.set_abs_position(math.floor(pos.x + wnd.width / 10), pos.y)
end)
-- bind mouse vertical scroll button with pressed Ctrl to zoom in the image at mouse pointer coordinates
swayimg.viewer.on_mouse("Ctrl-ScrollUp", function()
	local pos = swayimg.get_mouse_pos()
	local scale = swayimg.viewer.get_scale()
	scale = scale + scale / 10
	swayimg.viewer.set_abs_scale(scale, pos.x, pos.y)
end)
-- bind r to rotate image right (90 degrees clockwise)
swayimg.viewer.on_key("r", function()
	swayimg.viewer.rotate(90)
end)
-- bind Shift+j to zoom in by 10%
swayimg.viewer.on_key("Shift+j", function()
	local scale = swayimg.viewer.get_scale()
	swayimg.viewer.set_abs_scale(scale + scale / 10)
end)
-- bind Shift+k to zoom out by 10%
swayimg.viewer.on_key("Shift+k", function()
	local scale = swayimg.viewer.get_scale()
	swayimg.viewer.set_abs_scale(scale - scale / 10)
end)
-- bind d to step image down by 20px
swayimg.viewer.on_key("d", function()
	local pos = swayimg.viewer.get_position()
	swayimg.viewer.set_abs_position(pos.x, pos.y - 20)
end)
-- bind e to step image up by 20px
swayimg.viewer.on_key("e", function()
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

-- Slide show mode, same config as for viewer mode with the following defaults:
swayimg.slideshow.set_timeout(5) -- timeout to switch image
swayimg.slideshow.set_default_scale("fit") -- default image scale
swayimg.slideshow.set_window_background("auto") -- window background mode
swayimg.slideshow.limit_history(0) -- number of the history cache
swayimg.slideshow.set_text("topleft", { "{name}" }) -- top left text block scheme

-- Gallery mode
swayimg.gallery.set_aspect("fill") -- thumbnail aspect ratio
swayimg.gallery.set_thumb_size(200) -- thumbnail size in pixels
swayimg.gallery.set_padding_size(5) -- padding between thumbnails
swayimg.gallery.set_border_size(5) -- border size for selected thumbnail
swayimg.gallery.set_border_color(0xffaaaaaa) -- border color for selected thumbnail
swayimg.gallery.set_selected_scale(1.15) -- scale for selected thumbnail
swayimg.gallery.set_selected_color(0xff404040) -- background color for selected thumbnail
swayimg.gallery.set_unselected_color(0xff202020) -- background color for unselected thumbnail
swayimg.gallery.set_window_color(0xff000000) -- window background color
swayimg.gallery.limit_cache(100) -- number of thumbnails stored in memory
swayimg.gallery.enable_preload(false) -- preloading invisible thumbnails
swayimg.gallery.enable_pstore(false) -- enable persistent storage for thumbnails
swayimg.gallery.set_text("topleft", { -- top left text block scheme
	"File: {name}",
})
swayimg.gallery.set_text("topright", { -- top right text block scheme
	"{list.index} of {list.total}",
})

-- Key and mouse bindings in gallery mode 

-- bind the j key to select thumbnail on the down side
swayimg.gallery.on_key("j", function()
	swayimg.gallery.switch_image("down")
end)
-- bind the k key to select thumbnail on the up side
swayimg.gallery.on_key("k", function()
	swayimg.gallery.switch_image("up")
end)
-- bind the h key to select thumbnail on the left side
swayimg.gallery.on_key("h", function()
	swayimg.gallery.switch_image("left")
end)
-- bind the l key to select thumbnail on the right side
swayimg.gallery.on_key("l", function()
	swayimg.gallery.switch_image("right")
end)
-- bind the g key to go to first image
swayimg.gallery.on_key("g", function()
	swayimg.gallery.switch_image("first")
end)
-- bind the Shift + g key to go to last image
swayimg.gallery.on_key("Shift+g", function()
	swayimg.gallery.switch_image("last")
end)
-- bind Ctrl+d to scroll thumbnails down (next page)
swayimg.gallery.on_key("Ctrl-d", function()
	swayimg.gallery.switch_image("pgdown")
end)
-- bind x to delete the current file (with y/n confirmation)
local pending_delete = nil
swayimg.gallery.on_key("x", function()
	local image = swayimg.gallery.get_image()
	pending_delete = image.path
	swayimg.text.set_status("Delete " .. image.path .. "? (Enter/n)")
end)
swayimg.gallery.on_key("Return", function()
	if pending_delete then
		os.remove(pending_delete)
		swayimg.imagelist.remove(pending_delete)
		swayimg.text.set_status("Deleted: " .. pending_delete)
		pending_delete = nil
	else
		swayimg.set_mode("viewer")
	end
end)
swayimg.gallery.on_key("n", function()
	if pending_delete then
		swayimg.text.set_status("Cancelled")
		pending_delete = nil
	end
end)
-- bind Ctrl+u to scroll thumbnails up (previous page)
swayimg.gallery.on_key("Ctrl-u", function()
	swayimg.gallery.switch_image("pgup")
end)

--
-- Other configuration examples
--

-- force set scale mode on window resize (useful for tiling compositors)
swayimg.on_window_resize(function()
	swayimg.viewer.set_fix_scale("optimal")
end)

-- bind the Delete key in slide show mode to delete the current file and display a status message
swayimg.slideshow.on_key("Delete", function()
	local image = swayimg.slideshow.get_image()
	os.remove(image.path)
	swayimg.text.set_status("File " .. image.path .. " removed")
end)

-- set a custom window title in gallery mode
swayimg.gallery.on_image_change(function()
	local image = swayimg.gallery.get_image()
	swayimg.set_title("Gallery: " .. image.path)
end)

-- print paths to all marked files by pressing Ctrl-p in gallery mode
swayimg.gallery.on_key("Ctrl-p", function()
	local entries = swayimg.imagelist.get()
	for _, entry in ipairs(entries) do
		if entry.mark then
			print(entry.path)
		end
	end
end)

local function copy_image_to_clipboard(path)
  os.execute(string.format(
    "convert %q png:- | wl-copy --type image/png &",
    path
  ))
  swayimg.text.set_status("Copied: " .. path)
end

swayimg.viewer.on_key("y", function()
  local image = swayimg.viewer.get_image()
  copy_image_to_clipboard(image.path)
end)

swayimg.gallery.on_key("y", function()
  local image = swayimg.gallery.get_image()
  copy_image_to_clipboard(image.path)
end)
