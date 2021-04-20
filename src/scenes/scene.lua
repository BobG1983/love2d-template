-- Core Scene Class
Scene = Object:extend()

function Scene:new() end
function Scene:enter(previous, ...) end
function Scene:leave(next, ...) end
function Scene:update(dt) end
function Scene:draw() end
