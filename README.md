# Project Monster

## Features
* Rewritten love.run to use a fixed timestep as per Free the Physics from [Gaffer on Games](https://www.gafferongames.com/post/fix_your_timestep/) 
* Object Orientation through the Object global- via [Classic](https://github.com/BobG1983/classic)
* Logging through the Log global - via [Log.lua](https://github.com/BobG1983/log.lua)
  * By default set to output level "debug"
* Screen resolution indepedent rendering - via [Push](https://github.com/BobG1983/push)
  * Edittable in _'love src/main.lua'_, defaults to 1920x1080
* Camera effects through the Camera global - via [Stalker-X](https://github.com/BobG1983/STALKER-X)
* Autobatching of love.graphics.draw - via [Autobatch](https://github.com/BobG1983/autobatch)
* ECS through the ECS global - via [Concord](https://github.com/Tjakka5/Concord)
* Recurring/Delayed function calls through the Timer global - via [Tick](https://github.com/BobG1983/tick)
* Input handling through the Input global - via [Boipushy](https://github.com/BobG1983/boipushy)
  * With default bindings for up, down, left, right, quit, confirm, cancel, left click, right click, and middle click
  * Editable or removable in _'love src/main.lua'_
* Tweening functions through the Tween global - via [Tween](https://github.com/BobG1983/tween.lua)
* Splash Screens through the Splash global - via [Splashy](https://github.com/BobG1983/splashy)
* Serialization/Deserialization through the Serializer global - via [Bitser](https://github.com/gvx/bitser)
* Scene Management through the SceneManager global - via [Roomy](https://github.com/tesselode/roomy)
* Sound Management through the SoundManager global - via [Ripple](https://github.com/tesselode/ripple)
* Hot Reloading of changed lua files - via [Lurker](https://github.com/rxi/lurker)
* Async asset loading through the AssetLoader global - via [Lily](https://github.com/MikuAuahDark/lily)
* A simplified Box2D wrapped through the Physics global - via [Windfield](https://github.com/BobG1983/windfield)
* A selection of lua utility functions through the Utils global - via [Lume](https://github.com/rxi/lume)

## Getting Started
1. Install [Love2D](https://love2d.org/)
2. Clone this repo
3. Start adding game code to src/scenes/main_scene.lua
4. Call _'love src/main.lua'_ to run the game _(or press Alt+L in VS Code)_

## Other Recommendations

At minimum, I recommend using [Visual Studio Code](https://code.visualstudio.com/) with the Love 2D Support (pixelbyte-studios.pixelbyte-love2d) and Lua (sumneko.lua) extensions.  

I'd also recommend installing [LuaFormatter](https://github.com/Koihik/LuaFormatter) and the VS Code extension vscode-lua-format (koihik.vscode-lua-format). This involves installing the VS Build Tools, lua-for-windows, and using luarocks to install luacheck and luaformatter.
