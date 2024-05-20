local DEBUG = true
local USE_DEFAULT_KEYBINDS = true

-- Better Game Loop (fixed timestep & autobatching)
require "lib.autobatch"
local TICK_RATE = 1 / 60
local MAX_FRAME_SKIP = 25
function love.run()
  if love.load then
    ---@diagnostic disable-next-line: redundant-parameter, undefined-field
    love.load(love.arg.parseGameArguments(arg), arg)
  end

  if love.timer then
    love.timer.step()
  end

  local lag = 0.0

  return function()
    if love.event then
      love.event.pump()
      for name, a, b, c, d, e, f in love.event.poll() do
        if name == "quit" then
          ---@diagnostic disable-next-line: undefined-field
          if not love.quit or not love.quit() then
            return a or 0
          end
        end
        ---@diagnostic disable-next-line: undefined-field
        love.handlers[name](a, b, c, d, e, f)
      end
    end

    if love.timer then
      lag = math.min(lag + love.timer.step(), TICK_RATE * MAX_FRAME_SKIP)
    end

    while lag >= TICK_RATE do
      if love.update then
        love.update(TICK_RATE)
      end
      lag = lag - TICK_RATE
    end

    if love.graphics and love.graphics.isActive() then
      love.graphics.origin()
      love.graphics.clear(love.graphics.getBackgroundColor())

      if love.draw then
        love.draw()
      end
      love.graphics.present()
    end

    if love.timer then
      love.timer.sleep(0.001)
    end
  end
end

-- Logging
Log = require "lib.log"
Log.level = "trace"

-- Utility Libs
local camera = require "lib.camera"
ECS = require "lib.concord"
Object = require "lib.classic"
Timer = require "lib.tick"
Tween = require "lib.tween"
Splash = require "lib.splashy"
Serializer = require "lib.bitser"
SoundManager = require "lib.ripple"
Utils = require "lib.lume"
AssetLoader = require "lib.lily"
Physics = require "lib.windfield"
UI = require "lib.helium"
SceneManager = require "lib.roomy".new()
Anim = require "lib.anim8"
require "src.scenes.scene_list"

-- Static Resolution Setup
local push = require "lib.push"
local FIXED_WIDTH, FIXED_HEIGHT = 1920, 1080
local WINDOW_WIDTH, WINDOW_HEIGHT = 1920, 1080
push:setupScreen(
  FIXED_WIDTH,
  FIXED_HEIGHT,
  WINDOW_WIDTH,
  WINDOW_HEIGHT,
  { fullscreen = false, resizable = true, canvas = false }
)
function love.resize(w, h)
  return push:resize(w, h)
end

-- Input Handling
local boipushy = require "lib.boipushy"
local function setup_input_handling()
  Input = boipushy()
  if USE_DEFAULT_KEYBINDS then
    Input:bind("w", "up")
    Input:bind("s", "down")
    Input:bind("a", "left")
    Input:bind("d", "right")
    Input:bind("q", "quit")
    Input:bind("return", "confirm")
    Input:bind("escape", "cancel")
    Input:bind("mouse1", "left_click")
    Input:bind("mouse2", "right_click")
    Input:bind("mouse3", "middle_click")
  end
end

local function setup_font()
  love.graphics.setFont(love.graphics.newFont("res/fonts/visat.ttf", 20))
end

-- Setup App
require "src.app"
local app = App()

-- Hot Reloading
if DEBUG then
  local function preswap(filename)
    app:preswap(filename)
  end
  local function postswap(filename)
    app:postswap(filename)
  end
  Lurker = require "lib.lurker"
  Lurker.interval = 2
  Lurker.path = "."
  Lurker.preswap = preswap
  Lurker.postswap = postswap
end

-- Love Callbacks
function love.load()
  setup_font()
  setup_input_handling()
  Camera = camera()
  love.graphics.setDefaultFilter("nearest", "nearest")
  app:load()
end

function love.update(dt)
  if DEBUG then
    Lurker.update()
  end
  Camera:update(dt)
  Timer.update(dt)
  app:update(dt)
end

---@diagnostic disable-next-line: duplicate-set-field
function love.draw()
  push:start()
  Camera:attach()
  app:draw_world()
  Camera:detach()
  Camera:draw()
  app:draw_ui()
  push:finish()
end
