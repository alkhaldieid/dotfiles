-- Scaffold: live ~/.hammerspoon/init.lua was not present when dotfiles were imported.
-- Provides the dwm-style scratchpad toggle used by AeroSpace bindings.

function toggleScratchpad()
  local app = hs.application.find("Terminal")
  if app and app:isFrontmost() then
    app:hide()
  elseif app then
    app:activate()
  else
    hs.application.launchOrFocus("Terminal")
  end
end

hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", function(files)
  for _, file in pairs(files) do
    if file:sub(-4) == ".lua" then hs.reload() end
  end
end):start()

hs.alert.show("Hammerspoon loaded")
