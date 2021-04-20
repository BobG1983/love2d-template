require "scenes.scene"

-- Core Game Class
MainScene = Scene:extend()

function MainScene:new() end
function MainScene:enter(previous, ...) end
function MainScene:leave(next, ...) end
function MainScene:update(dt) end
function MainScene:draw() love.graphics.print("Hello Main Scene") end
