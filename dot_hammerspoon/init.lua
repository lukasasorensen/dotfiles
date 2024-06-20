hs.loadSpoon("KSheet")

local hyper = { "cmd", "alt", "ctrl", "shift" }
local meh = { "alt", "ctrl", "shift" }
hs.hotkey.bind(hyper, "0", function()
	hs.reload()
end)
hs.notify.new({ title = "Hammerspoon", informativeText = "Config loaded" }):send()

local applicationHotkeys = {
	a = "Google Chrome",
	t = "iTerm",
	s = "Visual Studio Code",
	m = "Spotify",
	x = "TextEdit",
	i = "Safari",
	w = "Studio 3T",
	d = "Slack",
	p = "Messages",
	h = "Charles",
	q = "Workspaces",
	o = "Discord",
	z = "zoom.us.app",
}

for key, app in pairs(applicationHotkeys) do
	hs.hotkey.bind(hyper, key, function()
		hs.application.launchOrFocus(app)
	end)
end

hs.hotkey.bind(hyper, "k", function()
	spoon.KSheet:toggle()
end)

-- Open Images in modals

-- Function to show the image in a popup
--local function showImagePopup(imagePath)
--	local img = hs.image.imageFromPath(imagePath)
--	if img then
--		hs.alert.show(img, 3) -- Display the image for 3 seconds
--	else
--		hs.alert.show("Image not found at " .. imagePath)
--	end
--end

-- Define a function to show the image with a border
local function showImagePopup(imagePath)
	-- Get the screen frame
	local screenFrame = hs.screen.mainScreen():frame()

	-- Define the image size and border size
	local imageSize = hs.geometry.size(1080, 720) -- Adjust the size as needed
	local borderWidth = 10 -- Adjust the border width as needed

	-- Calculate the center position
	local imageFrame =
		hs.geometry.rect((screenFrame.w - imageSize.w) / 2, (screenFrame.h - imageSize.h) / 2, imageSize.w, imageSize.h)

	-- Calculate the frame for the border
	local borderFrame = hs.geometry.rect(
		imageFrame.x - borderWidth,
		imageFrame.y - borderWidth,
		imageFrame.w + 2 * borderWidth,
		imageFrame.h + 2 * borderWidth
	)

	-- Create the drawing object for the border
	local border = hs.drawing.rectangle(borderFrame)
	border:setStrokeColor({ ["red"] = 1, ["green"] = 1, ["blue"] = 1, ["alpha"] = 1 }) -- Adjust color as needed
	border:setFill(true)
	border:setFillColor({ ["red"] = 0, ["green"] = 0, ["blue"] = 0, ["alpha"] = 1 })
	border:setStrokeWidth(borderWidth)
	border:show()

	-- Create the drawing object for the image
	local image = hs.drawing.image(imageFrame, imagePath)
	image:show()

	-- Create a modal to capture keys for hiding the image and border
	local imageModal = hs.hotkey.modal.new()

	-- Function to hide the image and border
	local function hideImage()
		image:delete()
		border:delete()
	end

	-- Bind the escape key to hide the image and border and exit the modal
	imageModal:bind("", "escape", function()
		hideImage()
		imageModal:exit()
	end)

	-- Bind the return key to hide the image and border and exit the modal
	imageModal:bind("", "return", function()
		hideImage()
		imageModal:exit()
	end)

	-- Enter the modal to capture keys
	imageModal:enter()
end

-- ERGO DOC ZSA LAYOUT PICS
local zsaBase0Path = "~/.hammerspoon/images/ERGO_LAYOUT_BASE_0.png"
local zsaSymbolsPath = "~/.hammerspoon/images/ERGO_LAYOUT_1_SYMBOLS.png"
local zsaMediaPath = "~/.hammerspoon/images/ERGO_LAYOUT_2_MEDIA.png"
local zsaTmuxPath = "~/.hammerspoon/images/ERGO_LAYOUT_4_TMUX.png"
local zsaMacPath = "~/.hammerspoon/images/ERGO_LAYOUT_6_MAC.png"

hs.hotkey.bind(meh, "0", function()
	showImagePopup(zsaBase0Path)
end)

hs.hotkey.bind(meh, "1", function()
	showImagePopup(zsaSymbolsPath)
end)

hs.hotkey.bind(meh, "2", function()
	showImagePopup(zsaMediaPath)
end)

hs.hotkey.bind(meh, "3", function()
	showImagePopup(zsaTmuxPath)
end)

hs.hotkey.bind(meh, "4", function()
	showImagePopup(zsaMacPath)
end)
