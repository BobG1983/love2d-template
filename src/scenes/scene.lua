-- Core Scene Class
Scene = Object:extend("Scene")

function Scene:new() Log.warn(tostring(self) .. " does not implement new()") end
function Scene:preswap(filename)
  Log.warn(tostring(self) .. " does not implement preswap(filename)")
end
function Scene:postswap(filename)
  Log.warn(tostring(self) .. " does not implement postswap(filename)")
end
function Scene:enter(previous, ...)
  Log.warn(tostring(self) .. " does not implement enter(previous, ...)")
end
function Scene:leave(next, ...)
  Log.warn(tostring(self) .. " does not implement leave(next, ...)")
end
function Scene:update(dt)
  Log.warn(tostring(self) .. " does not implement update(dt)")
end
function Scene:draw() Log.warn(tostring(self) .. " does not implement draw()") end
