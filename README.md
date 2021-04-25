# Bobs Love2D Template
A Love2D template so you don't have to reinvent the wheel every time you start a new project. Heavily targetted at PC development.  It might work for iOS or Android, but that is entirely incidental

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
  * With default bindings for up, down, left, right, confirm, cancel, left click, right click, and middle click
  * Editable or removable in _'love src/main.lua'_
* Tweening functions through the Tween global - via [Tween](https://github.com/BobG1983/tween.lua)
* Splash Screens through the Splash global - via [Splashy](https://github.com/BobG1983/splashy)
* Serialization/Deserialization through the Serializer global - via [Bitser](https://github.com/gvx/bitser)
* Scene Management through the SceneManager global - via [Roomy](https://github.com/tesselode/roomy)
* Sound Management through the SoundManager global - via [Ripple](https://github.com/tesselode/ripple)
* Hot Reloading of changed lua files - via [Lurker](https://github.com/rxi/lurker)
* Async asset loading through the AssetLoader global - via [Lily](https://github.com/MikuAuahDark/lily)
* A selection of lua utility functions through the Utils global - via [Lume](https://github.com/rxi/lume)

## Shoutouts
Many of these libraries were not developed by me but by various members of the Love2D community.  Where the library appears to have been abandoned or archived I've forked the repo and included the link to my personal fork.  In particular, thanks go out to rxi and a327ex who developed most of the above libraries.


## Issues
If you find any problems with this repo please file an issue here.  
If you find any problems with a specific library, please file it on the appropriate repo above.

## Getting Started
1. Install [Love2D](https://love2d.org/)
2. Clone this repo
3. Start adding game code to src/scenes/main_scene.lua
4. Call _'love src/main.lua'_ to run the game _(or press Alt+L in VS Code)_

## Other Recommendations

At minimum, I recommend using [Visual Studio Code](https://code.visualstudio.com/) with the Love 2D Support (pixelbyte-studios.pixelbyte-love2d) and Lua (sumneko.lua) extensions.  

I'd also recommend installing [LuaFormatter](https://github.com/Koihik/LuaFormatter) and the VS Code extension vscode-lua-format (koihik.vscode-lua-format), but be warned, getting LuaFormatter up and running on windows can be non-trivial, and it just provides auto code formatting, so you might not find it super valuable.

For more awesome libraries you might want to include in your project check out [Awesome Love2D](https://github.com/love2d-community/awesome-love2d#input)