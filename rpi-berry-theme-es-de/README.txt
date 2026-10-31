RASPBERRY CIRCUIT - ES-DE edition
=================================
INSTALL
 1. Copy this folder ("rpi-berry-theme-es-de") into  ~/ES-DE/themes/
    (older ES-DE versions: ~/.emulationstation/themes/)
 2. Restart ES-DE, then Menu > UI Settings > Theme set > Raspberry Circuit
 3. Optional: "Theme color scheme" (raspberry / leaf) and
    "Theme transitions" (berry fade)

TEST IT WITH DEBUG OUTPUT (AppImage):
    chmod +x ES-DE*.AppImage
    ./ES-DE*.AppImage --debug --resolution 1280 720
 This opens a window and prints theme errors in the terminal.
 Log file: ~/ES-DE/logs/es_log.txt
 In debug mode Ctrl+R reloads the theme after you edit theme.xml
 (changes to capabilities.xml need a restart).

ANIMATIONS
 - Looping animated photo background (see BACKGROUND below)
 - Bobbing berry GIF and blinking PWR/ACT LED GIF
 - Fade transitions between the system and game list screens

NOTES
 - System names show as text. To use logos, drop SVG files named after the
   system into art/systems/  (e.g. art/systems/snes.svg).
 - ES-DE is strict: one wrong tag name stops the theme loading. The error
   in the log says which line.

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
