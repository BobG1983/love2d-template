-- Better Game Loop (fixed timestep & autobatching)
require "lib.autobatch"
local TICK_RATE = 1 / 60
local MAX_FRAME_SKIP = 25
function love.run()
  if love.load then love.load(love.arg.parseGameArguments(arg), arg) end

  -- We don't want the first frame's dt to include time taken by love.load.
  if love.timer then love.timer.step() end

  local lag = 0.0

  -- Main loop time.
  return function()
    -- Process events.
    if love.event then
      love.event.pump()
      for name, a, b, c, d, e, f in love.event.poll() do
        if name == "quit" then
          if not love.quit or not love.quit() then return a or 0 end
        end
        love.handlers[name](a, b, c, d, e, f)
      end
    end

    -- Cap number of Frames that can be skipped so lag doesn't accumulate
    if love.timer then
      lag = math.min(lag + love.timer.step(), TICK_RATE * MAX_FRAME_SKIP)
    end

    while lag >= TICK_RATE do
      if love.update then love.update(TICK_RATE) end
      lag = lag - TICK_RATE
    end

    if love.graphics and love.graphics.isActive() then
      love.graphics.origin()
      love.graphics.clear(love.graphics.getBackgroundColor())

      if love.draw then love.draw() end
      love.graphics.present()
    end

    -- Even though we limit tick rate and not frame rate, we might want to cap framerate at 1000 frame rate as mentioned https://love2d.org/forums/viewtopic.php?f=4&t=76998&p=198629&hilit=love.timer.sleep#p160881
    if love.timer then love.timer.sleep(0.001) end
  end
end

-- Logging
Log = require "lib.log"
Log.level = "debug"

-- Static Resolution Setup
local push = require "lib.push"
local FIXED_WIDTH, FIXED_HEIGHT = 1920, 1080
local WINDOW_WIDTH, WINDOW_HEIGHT = 1920, 1080
push:setupScreen(FIXED_WIDTH, FIXED_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT,
                 {fullscreen = false, resizable = true, canvas = false})
function love.resize(w, h) return push:resize(w, h) end

-- Input Handling
local boipushy = require "lib.boipushy"
local function setup_input_handling()
  Input = boipushy()
  Input:bind('w', 'up')
  Input:bind('s', 'down')
  Input:bind('a', 'left')
  Input:bind('d', 'right')
  Input:bind('return', 'confirm')
  Input:bind('escape', 'cancel')
  Input:bind('mouse1', 'left_click')
  Input:bind('mouse2', 'right_click')
  Input:bind('mouse3', 'middle_click')
end

-- Scene Management
local roomy = require "lib.roomy"
local function setup_scene_management() SceneManager = roomy.new() end

-- Utility Libs
local camera = require "lib.camera"
ECS = require "lib.concord"
Object = require "lib.classic"
Timer = require "lib.tick"
Tween = require "lib.tween"
Splash = require "lib.splashy"
Serial = require "lib.bitser"
SoundManager = require "lib.ripple"
Utils = require "lib.lume"

-- Love Callbacks
require "app"
local app = App()
function love.load()
  setup_input_handling()
  setup_scene_management()
  Camera = camera()
  love.graphics.setDefaultFilter('nearest', 'nearest')
  app:load()
end

function love.update(dt)
  Camera:update(dt)
  Timer.update(dt)
  app:update(dt)
end

function love.draw()
  push:start()
  Camera:attach()
  app:draw()
  Camera:detach()
  Camera:draw()
  push:finish()
end

-- Hot Reloading
local function preswap(filename) app:preswap(filename) end

local function postswap(filename) app:postswap(filename) end
local lurker = require "lib.lurker"
lurker.interval = 2
lurker.path = "./src"
lurker.preswap = preswap
lurker.postswap = postswap

-- TODO: Add the following
-- Asset Loading
-- Physics (Windfield)
-- GUI
-- CI using Boon

