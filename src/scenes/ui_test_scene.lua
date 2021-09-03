-- Core Game Class
UITestScene = Scene:extend("UITestScene")

function UITestScene:enter(previous, ...)
  Log.trace("Entering UITestScene from: " .. tostring(previous))
end

function UITestScene:leave(next, ...)
  Log.trace("Leaving UITestScene to: " .. tostring(next))
end

function UITestScene:update(dt)
  if Input:released("quit") then
    SceneManager:enter(MainScene)
  end
end

function UITestScene:draw_world()
end

function UITestScene:draw_ui()
  love.graphics.circle("fill", 100, 100, 10, 10)
end
