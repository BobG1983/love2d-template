require "scenes.scene"

-- Core Game Class
MainScene = Scene:extend("MainScene")

function MainScene:new() Log.trace("Creating MainScene") end
function MainScene:enter(previous, ...)
  Log.trace("Entering MainScene from: " .. tostring(previous))
end
function MainScene:leave(next, ...)
  Log.trace("Leaving MainScene to: " .. tostring(next))
end
function MainScene:update(dt) end
function MainScene:draw() love.graphics.print("Hello Main Scene") end
