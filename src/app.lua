-- Core App Class
App = Object:extend("App")

function App:new()
end

function App:preswap(filename)
  SceneManager:emit("preswap", filename)
end

function App:postswap(filename)
  SceneManager:emit("postswap", filename)
end

function App:load()
  SceneManager:enter(MainScene)
end

function App:update(dt)
  SceneManager:emit("update", dt)
end

function App:draw_world()
  SceneManager:emit("draw_world")
end
function App:draw_ui()
  SceneManager:emit("draw_ui")
end
