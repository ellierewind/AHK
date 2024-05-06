# AHK

Ellie's AHK Script!

[`Host.ahk`](Host.ahk) has all the main scripts you execute using keyboard keybinds.

[`UserCommands.ahk`](GUI/UserCommands.ahk) has the scripts you execute using the CapsLock menu.

[`Premiere - Right click timeline to move playhead.ahk`](Scripts/AutoStart/Premiere%20-%20Right%20click%20timeline%20to%20move%20playhead.ahk) is a standalone script.

[`General.ahk`](Settings/General.ahk) and [`GUI.ahk`](GUI/GUI.ahk) can be ignored. Please do not change or move anything in those files if you don't know what you're doing.


# Features

### CapsLock Menu

`CapsLock` becomes a Menu or GUI that allows you to run any normal AutoHotkey command or block of code by typing a name for the command you want to run.

Normal `CapsLock` functionality is preserved, and can be toggled by `Alt + CapsLock`.

This functionality was created by [plul](https://github.com/plul/Public-AutoHotKey-Scripts).


### Middle Mouse Button moves up a folder in Explorer

If you press the `Middle Mouse Button`, you'll move up a folder in Windows Files explorer. This also works on "Open In" or Context Explorer windows.

### Windows + MouseScroll - Volume Control

If you hold down the Windows Key and use the scroll wheel of your mouse, you'll be able to control the volume of your PC.

### Switch Virtual Desktops Easily

By using `Windows + Q` and `Windows + E`, you'll be able to switch through virtual desktops with ease.

### Use NumpadSubtract to Show Desktop

By pressing `NumpadSubtract`, you'll be able to hide or show open windows.

### Windows or Alt + Numpad Keys for Volume Control

Let's you control the volume of your PC by pressing `Windows or Alt + Numpad4/7/8` for Volume Up, Down, and Mute.

### Quickly Change Tab in Google Chrome

Using `F2` and `F3` lets you go to the previous or next tab.

### Toggle File Extensions and Hidden Files in File Explorer

Using `Windows + Y` toggles File Extensions in Windows Explorer. `Windows + H` toggles hidden files.

You can also use the `CapsLock` menu by typing "ext" for File Extensions and "hid" for Hidden Files.

### Easily Insert Date and Time

`Windows + W` will send the current date and time with the format YYYY-MM-DD - HH:MM:SS.

`Windows + Shift + W` sends the current date only.

### Replacing Insert Key as a Paste key

`Insert` will paste whatever you have in your clipboard.

### Disabling F1 Key in File Explorer and Google Chrome

Prevents you from opening the help center page accidentally.

### Easily Change Timezones

Using the `CapsLock` menu, you can type in `CST` for US Central Time. `PST` for US Pacific Time. `EST` for US Eastern Time.

### Premiere Pro  - Easy Presets

Easily add effects presets in Premiere Pro using the `preset()` function.

This functionality was created by [TaranVH](https://github.com/TaranVH/2nd-keyboard)

### Insanely Fast Auto Clicker

By pressing and holding down the hotkey, it will click as fast as your PC can handle. Up to 700 clicks per second.

### Additonal Minecraft Functions

Added `AutoCrafting`, `AutoEnchantBooks`, and `AutoRepairItem (Modded)`.

### Broken Keys Rebinding

As a personal use case, my current keyboard has the `; / :` key broken. I rebinded it to a different key, in this case, I used the `\` key. Since this is a personal use case, you can easily comment out or remove that in `Host.ahk` by finding `Royal Kludge Keyboard Broken Keys Reassign` section.

### Custom G604 Binds

Again, this is a personal use case, but I use the `F24` key as a modifier key similar to how we usually use  `Ctrl`, `Alt`, or `Shift`. I also use `F20` to bring up an [AutoHotPie](https://github.com/dumbeau/AutoHotPie) menu.

AutoHotPie can be very powerful. I even adapted the [`Premiere Pro - Easy Presets`](https://github.com/ellierewind/AHK#premiere-pro----easy-presets) function to work with AutoHotPie. You can use this standalone AHK script, [`AHP - preset().ahk`](https://github.com/ellierewind/AHK/blob/main/Scripts/AHP%20-%20preset().ahk), and run it as a file within AHP, and add the following arguments at the end of the file path: `"PRESETNAME" %PieOpenLocX% %PieOpenLocY%`. It should look something like [this](Scripts/AutoHotPie_preset()_Example.png).

Big shoutout to [Beau Gilles](https://github.com/dumbeau/AutoHotPie) since he helped me out with this script on the [AHP Discord](https://discord.gg/yszsupzR7d)!

# Installation

Download AHK here: https://github.com/AutoHotkey/AutoHotkey/releases/download/v2.0.12/AutoHotkey_2.0.12_setup.exe

Please note that this AHK script is using V1.1. But downloading AHK-v2 is still recommended since the script is still compatible.

Download the whole repo. Afterwards, place these files under "C:\Users\username\AppData\Roaming\AHK" or %appdata%

Add "Host.ahk" and "Premiere - Right click timeline to move playhead.ahk" to the startup folder.

Startup folder can be found here: "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp" or shell:startup

Once you run the script, it'll show a prompt for the first time you use it, and it'll ask you to download AHK v1.1.37.02. Click yes.

# Prerequisites

### preset()

 To make the `preset()` function to work, you MUST go into Adobe Premiere's Keyboard Shortcuts panel, find the following commands, and add these keyboard shortcut assignments to them:
 
 >Ctrl +               B  =      Application > Select Find Box

 >Ctrl + Alt + Shift + K =      Application > Shuttle Stop

 >Ctrl + Alt + Shift + 1 =      Application > Window > Project         (Default is Shift + 1) 
(This sets the focus onto a BIN) 

 >Ctrl + Alt + Shift + 3 =      Application > Window > Timeline        (Default is Shift + 3)

 >Ctrl + Alt + Shift + 4 =      Application > Window > Program Monitor (Default is Shift + 4)

 >Ctrl + Alt + Shift + 5 =      Application > Window > Effect Controls (Default is Shift + 5)

 >Ctrl + Alt + Shift + 7 =      Application > Window > Effects         (Default is Shift + 7)
 

 Alternatively, you can add your pre-made keyboard shortcuts to Adobe Premiere.

### Minecraft Functions

 To make these functions to work, you MUST check if it works within Minecraft. If it doesn't seem to work, you need to change the screen coordinates on the functions I've written in [`Functions.ahk`](Settings/Functions.ahk).

 You can use `WindowSpy` to get the screen coordinates you need for each line. `WindowSpy` should be available to use once you install AutoHotKey.

# Credits

https://github.com/dumbeau/AutoHotPie

https://github.com/plul/Public-AutoHotKey-Scripts

https://github.com/TaranVH/2nd-keyboard