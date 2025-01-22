# bo-extramenu

This extramenu is designed for vehicle customization in FiveM, allowing players to easily add or remove extras from vehicles. The menu utilizes ox_lib's built-in context menu functionality for smooth operation. Players can open the extramenu either via a command or an export, providing flexible access to vehicle modifications.

![image](upload://l7owTwcfN60MNYZM5uwXJBf8xKG.png)
## Installation

Move the `bo-extramenu` folder into your server's `resources` directory. Ensure that `ox_lib` starts before `bo-extramenu` by adding the following to your `server.cfg`:

```
ensure ox_lib
ensure bo-extramenu
```

## Usage

You can open the extra menu by using a command. The command to open the menu can be configured in the `config.lua` file. You can also open the extramenu via export. 

```
exports['bo-extramenu']:extramenuOpen()
```

## Dependencies

- ox_lib (https://github.com/overextended/ox_lib)

## Support

If you’d like to support my work, you can do so here: https://ko-fi.com/bloope18

To see all my updates, you can join here: https://discord.gg/RxCVG3gPff
You can also get support with the script if you run into any issues!
