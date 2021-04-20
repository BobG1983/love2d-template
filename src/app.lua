require "scenes.main_scene"

-- Core App Class
App = Object:extend()

function App:new() end

function App:load()
  local main_scene = MainScene()
  SceneManager:enter(main_scene)
end

function App:update(dt) SceneManager:emit("update", dt) end

function App:draw() SceneManager:emit("draw") end
