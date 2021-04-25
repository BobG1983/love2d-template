require "scenes.main_scene"

-- Core App Class
App = Object:extend("App")

function App:new() end

function App:preswap(filename) SceneManager:emit("preswap", filename) end

function App:postswap(filename) SceneManager:emit("postswap", filename) end

function App:load()
  local main_scene = MainScene()
  SceneManager:enter(main_scene)
end

function App:update(dt) SceneManager:emit("update", dt) end

function App:draw() SceneManager:emit("draw") end
