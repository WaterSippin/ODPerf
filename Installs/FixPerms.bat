@echo off

%discord_path% = %USERPROFILE%\AppData\Local\Discord\app-*\modules

set "discord_path=%USERPROFILE%\AppData\Local\Discord\app-*\modules"

echo Deleting Discord Modules...

Rem Cloudsync syncs files across devices
del %discord_path%\discord_cloudsync*
Rem erlpack compresses data
del %discord_path%\discord_erlpack*
Rem Krisp is a noise cancelling software
del %discord_path%\discord_krisp*
Rem GameUtils is a module that allows Discord to detect games
del %discord_path%\discord_game_utils*
Rem rpc is rich presence
del %discord_path%\discord_rpc*
Rem spellcheck is spellcheck lol
del %discord_path%\discord_spellcheck*
Rem Discord overlay is the overlay that shows up when you press shift + `
del %discord_path%\discord_overlay*
Rem Dispatch is a module that allows Discord to communicate with the browser
del %discord_path%\discord_dispatch*
cls
echo Discord Modules Deleted!





pause