RASPBERRY CIRCUIT - BATOCERA edition
====================================
INSTALL
 1. Copy this folder ("rpi-berry-theme") into  /userdata/themes/
    (network share: \\BATOCERA\share\themes\)
 2. START > User Interface > Theme Set > rpi-berry-theme

WHAT YOU GET
 - MAIN SCREEN: a 24 second looping background that fills the screen with ALL the Raspberry Pi
   products, repeated, sliding past and bobbing (Pi 5, Pi 4, Pi 400, Pi 500, Pi 500+, CM4,
   CM5 + IO board, Pico 2, Pico W, Zero, Zero 2 W).
 - EACH CONSOLE PAGE: that console's own Raspberry Pi behind the game list
   (art/bg/<system>.jpg), drifting slowly.
 - Console picture for about 200 systems (art/systems/<system>.png)
 - RetroAchievements trophy + your username (START > Game Settings >
   RetroAchievements), trophy in the menu.

TWEAKS
 - Change the Pi behind a console: copy any other picture over
   art/bg/<system>.jpg  (for example art/bg/snes.jpg)
 - Slow Pi / stutter: delete the <video name="bg_video"> block in theme.xml
   (the still collage is used instead)
 - Errors: /userdata/system/logs/es_launch_stdout.log

CREDITS
 Console pictures: ES-DE-System-Icon-Set by Zoidburg13 (CC0).
 Product photos: Raspberry Pi documentation (github.com/raspberrypi/documentation),
 (c) Raspberry Pi Ltd. Raspberry Pi logo: trademark of Raspberry Pi Ltd.
 Personal use - check their rules before redistributing.
