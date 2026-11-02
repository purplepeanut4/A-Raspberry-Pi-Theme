RASPBERRY CIRCUIT - ES-DE edition
=================================
INSTALL
 1. Copy this folder ("rpi-berry-theme-es-de") into  ~/ES-DE/themes/
    (older ES-DE versions: ~/.emulationstation/themes/)
 2. Restart ES-DE, then Menu > UI Settings > Theme set > Raspberry Circuit
 3. Optional, same menu:
      Theme variant = Animated (main screen) / Animated (also console pages)
                      / Still background (fastest)
      Theme color scheme = raspberry / leaf
      Theme transitions = berry fade

TEST IT WITH DEBUG OUTPUT (AppImage):
    chmod +x ES-DE*.AppImage
    ./ES-DE*.AppImage --debug --resolution 1280 720
 Theme errors print in the terminal. Log: ~/ES-DE/logs/es_log.txt
 In debug mode Ctrl+R reloads the theme after you edit theme.xml
 (changes to capabilities.xml need a restart).

WHAT YOU GET
 - MAIN SCREEN: a 30 second looping background with ALL the Raspberry Pi
   products floating together (Pi 5, Pi 4, Pi 400, Pi 500, Pi 500+, CM4,
   CM5 + IO board, Pico 2, Pico W, Zero, Zero 2 W).
 - EACH CONSOLE PAGE: that console's own Raspberry Pi behind the game list
   (art/bg/<system>.jpg). With "Animated (also console pages)" it floats
   and glows as a video (art/products/<pi>.mp4).
 - Console picture for about 200 systems (art/systems/<system>.png)
 - Bobbing Raspberry Pi logo, fade transitions between screens

TWEAKS
 - Change the Pi behind a console: copy another picture over
   art/bg/<system>.jpg, and point bgv/<system>.xml at another video in
   art/products/ if you use the animated console pages.
 - If it lags, pick "Still background" in Theme variant.

RETROACHIEVEMENTS
 ES-DE has no RetroAchievements feature (it is handled inside RetroArch),
 so there is nothing for a theme to show. Use the Batocera edition for that.

CREDITS
 Console pictures: ES-DE-System-Icon-Set by Zoidburg13 (CC0).
 Product photos: Raspberry Pi documentation (github.com/raspberrypi/documentation),
 (c) Raspberry Pi Ltd. Raspberry Pi logo: trademark of Raspberry Pi Ltd.
 Personal use - check their rules before redistributing.
