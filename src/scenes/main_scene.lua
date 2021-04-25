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
function MainScene:draw_world()
  love.graphics.print("Hello Main Scene World", 10, 10)
end
function MainScene:draw_ui() love.graphics.print("Hello Main Scene UI", 10, 110) end
