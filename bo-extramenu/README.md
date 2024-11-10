# bo-extramenu

This extra menu is designed for vehicle customization in FiveM, allowing players to easily add or remove extras from vehicles. The menu utilizes ox_lib's built-in context menu functionality for smooth operation. Players can open the extra menu either via a command or an export, providing flexible access to vehicle modifications.

![App Screenshot](https://cdn.discordapp.com/attachments/1261468678717964358/1304959174039437342/image.png?ex=67314970&is=672ff7f0&hm=d848a9c666ebde1d95d41a555145df5b1f0d2d778fee0250344cdcbaad7ef03b&)
## Installation

Move the `bo-extramenu` folder into your server's `resources` directory. Ensure that `ox_lib` starts before `bo-extramenu` by adding the following to your `server.cfg`:

```
ensure ox_lib
ensure bo-extramenu
```

## Usage

You can open the extra menu by using a command. The command to open the menu can be configured in the `config.lua` file. You can also open the extra menu via export. 

```
exports['bo-extramenu-dev']:extramenuOpen()
```

## Dependencies

- ox_lib (https://github.com/overextended/ox_lib)