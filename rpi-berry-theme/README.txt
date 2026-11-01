RASPBERRY CIRCUIT - BATOCERA edition
====================================
INSTALL
 1. Copy this folder ("rpi-berry-theme") into  /userdata/themes/
    (network share: \\BATOCERA\share\themes\)
 2. START > User Interface > Theme Set > rpi-berry-theme

WHAT YOU GET
 - 30 second looping background: Raspberry Pi boards floating on pure black
 - Console picture for about 200 systems (art/systems/<system>.png)
 - Game lists: a different Raspberry Pi product behind each console, drifting slowly
 - Pulsing Raspberry Pi logo, panels and game images fade in
 - RETROACHIEVEMENTS: gold trophy + your username in the main screen header
   when you are logged in (START > Game Settings > RetroAchievements),
   a trophy in the game list header for systems that support achievements,
   and a trophy icon in the menu.

A DIFFERENT RASPBERRY PI PER CONSOLE
 Open a console and the game list background is a real Raspberry Pi product:
 Pi 400/500/500+ (retro computers), Pico/Zero boards (handhelds), and Pi 5,
 Pi 4, Compute Module 4/5 and CM5 IO board (everything else).
 The picture is art/bg/<system>.jpg. To change a console's Pi, replace that
 file with any other file from art/bg/. Photos: Raspberry Pi documentation
 (CC BY-SA 4.0), cut out and composited for this theme.

TWEAKS
 - Animation speed: change the duration="..." numbers (milliseconds)
 - Slow Pi / stutter: delete the <video name="bg_video"> block in theme.xml (main screen only)
 - RetroAchievements shows nothing? The theme uses the conditions
   if="${global.cheevos}" and if="${system.cheevos}". Tell me what you see.
 - Errors: /userdata/system/logs/es_launch_stdout.log

CREDITS
 Console pictures: ES-DE-System-Icon-Set by Zoidburg13 (CC0).
 Raspberry Pi logo: trademark of Raspberry Pi Ltd - personal use.
