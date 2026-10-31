RASPBERRY CIRCUIT - BATOCERA edition
====================================
INSTALL
 1. Copy this folder ("rpi-berry-theme") into  /userdata/themes/
    (network share: \\BATOCERA\share\themes\)
 2. START > User Interface > Theme Set > rpi-berry-theme

ANIMATIONS
 - Looping circuit-board video background (art/background.mp4)
 - Berry pulses and sways, ACT LED blinks (storyboards in theme.xml)
 - Header slides in, list/media panels slide + fade in, game image
   fades in each time you pick a game, selected system "pops"

TWEAKS
 - Title: search theme.xml for BERRY BOX
 - Animation speed: change the duration="..." numbers (milliseconds)
 - Slow Pi / stutter: delete the <video name="bg_video"> blocks
 - Errors: /userdata/system/logs/es_launch_stdout.log

LOGO: art/berry.png is the official Raspberry Pi logo (a Raspberry Pi Trading
trademark). Fine for personal use; check their brand rules before sharing publicly.
In the ES-DE edition art/berry_bob.gif is the animated version of it.

BACKGROUND
 art/background.mp4 is built from your Raspberry Pi photo: each board floats
 independently over an animated circuit layer with travelling light pulses,
 soft glows and a light sweep. art/background.jpg is the still fallback.

CONSOLE PICTURES
 art/systems/<system>.png - about 200 systems (CC0 icon set by Zoidburg13,
 github.com/Zoidburg13/ES-DE-System-Icon-Set). A system without a picture
 shows its name as text. To add one, drop in a PNG named exactly like the
 system folder, e.g. art/systems/snes.png
