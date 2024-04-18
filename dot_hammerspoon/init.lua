local hyper = { "cmd", "alt", "ctrl", "shift" }
hs.hotkey.bind(hyper, "0", function()
  hs.reload()
end)
hs.notify.new({title="Hammerspoon", informativeText="Config loaded"}):send()

hs.hotkey.bind(hyper, "k", function()
  local win = hs.window.focusedWindow();
  if not win then return end
win:moveToScreen(win:screen():next())
end)

local applicationHotkeys = {
  a = 'Google Chrome',
  t = 'iTerm',
  s = 'Visual Studio Code',
  m = 'Spotify',
  x = 'TextEdit',
  i = 'Safari',
  w = 'Studio 3T',
  d = 'Slack',
  p = 'Messages',
  h = 'Charles',
  q = 'Workspaces',
  o = 'Discord',
  z = 'zoom.us.app'
}

for key, app in pairs(applicationHotkeys) do
  hs.hotkey.bind(hyper, key, function()
    hs.application.launchOrFocus(app)
  end)
end

-- local spaces = require("hs._asm.undocumented.spaces")
-- -- move current window to the space sp
-- function MoveWindowToSpace(sp)
--     local win = hs.window.focusedWindow()      -- current window
--     local uuid = win:screen():spacesUUID()     -- uuid for current screen
--     local spaceID = spaces.layout()[uuid][sp]  -- internal index for sp
--     spaces.moveWindowToSpace(win:id(), spaceID) -- move window to new space
--     spaces.changeToSpace(spaceID)              -- follow window to new space
-- end
-- hs.hotkey.bind(hyper, '1', function() MoveWindowToSpace(1) end)
