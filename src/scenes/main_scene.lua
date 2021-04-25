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
function MainScene:update(dt)
  if Input:released("quit") then love.event.quit() end
end
function MainScene:draw_world()
  love.graphics.print("Hello Main Scene World", 10, 10)
  love.graphics.print("This is effected by camera position", 10, 30)
end
function MainScene:draw_ui()
  love.graphics.print("Hello Main Scene UI", 10, 110)
  love.graphics.print("This is NOT effected by camera position", 10, 130)
end
