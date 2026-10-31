# A-Raspberry-Pi-Theme

A Raspberry Pi themed Batocera/ES theme

![Preview of the animated background](docs/preview.jpg)

**Raspberry Circuit** is a simple animated EmulationStation theme in Raspberry Pi colours (raspberry red and leaf green). It's available in two versions as Batocera and ES-DE use different theme engines and can't share a single theme.xml.


## Features

- Animated background: a 30 second seamless loop made from a photo of Raspberry Pi boards. Each board floats on its own over pure black with soft coloured edge glows and light sweeps.
- Console pictures for around 200 systems, displayed in the system carousel and in the header of each game list.
- Raspberry Pi logo in the header (pulsing in Batocera, bobbing in ES-DE)
- RetroAchievements (only for Batocera). A gold trophy and your username in the main screen header when you're logged in, a trophy in the game list header for systems that support achievements and a trophy icon in the menu.
- Batocera: the panels and game images fade in.
- ES-DE: fade transitions between screens, with a choice of raspberry or leaf green as the accent colour.
- Game list with description, rating, release date and screenshot/video preview, plus a simple grid view (Batocera) and themed menus.
- The help prompts sit on their own row at the bottom so nothing overlaps.

## What's in this repo

| Folder | For | Install to |
|---|---|---|
| `rpi-berry-theme/` | **Batocera** | `/userdata/themes/` |
| `rpi-berry-theme-es-de/` | **ES-DE** (desktop / AppImage) | `~/ES-DE/themes/` |

Both use the same artwork. Each folder has its own README.txt.

## Install

### ES-DE
1. Copy rpi-berry-theme-es-de into ~/ES-DE/themes/ (for older versions: ~/.emulationstation/themes/)
2. Restart ES-DE and then go to Menu → UI Settings → Theme set → Raspberry Circuit.
3. Optional: pick a colour scheme (raspberry / leaf) and theme transitions all from the same menu.

To preview from an AppImage with error output:

```bash
chmod +x ES-DE*.AppImage
./ES-DE*.AppImage --debug --resolution 1280 720
```

ES-DE is very strict about theme files in that one incorrect tag will prevent the theme from loading. The error will be logged in the terminal and in ~/ES-DE/logs/es_log.txt. In debug mode **Ctrl+R** will reload the theme after you've edited theme.xml (changes to capabilities.xml require a restart).

### Batocera
1. Copy rpi-berry-theme into /userdata/themes/. On the network share this is \\BATOCERA\share\themes\.
2. On the console: START → User Interface → Theme Set → rpi-berry-theme.
3. If it looks wrong then have a look in /userdata/system/logs/es_launch_stdout.log

## RetroAchievements

Only the Batocera version has this. ES-DE has no RetroAchievements at all (RetroAchievements are handled within RetroArch) so there's nothing for an ES-DE theme to display.

In Batocera you log in under START → Game Settings → RetroAchievements. The theme then displays your username alongside a trophy on the main screen. It's using the Batocera theme conditions of `if="${global.cheevos}"` (you're logged in) and `if="${system.cheevos}"` (the system supports achievements). I wasn't able to test these on a device so if the trophy doesn't show up then please open an issue with your Batocera version.

## Customising

theme.xml is commented and written for the beginner. pos and size are screen fractions and colours are 6-digit hex (no #).

- Console picture: drop a PNG file named exactly as the system into art/systems/ (e.g. snes.png). A system with no picture will just show its name as text.
- Animation speed (Batocera): change the `duration="..."` values (these are in milliseconds).
- Colours: Raspberry is C51A4A, leaf green is 75A928 and the trophy gold is E8B923.
- Check for overlaps after editing: run `python3 tools/check_layout.py rpi-berry-theme/theme.xml rpi-berry-theme-es-de/theme.xml`. This will list any two on screen elements whose boxes overlap (panels behind text are ignored).
- Move the carousel: change the y values of the carousel, carousel_band/carouselBand and the 'games available' pill.

## Performance

The background is a 720p H.264 video (approx 6MB) which is quite fine on a Pi 4/5 and PCs. It may stutter on a Pi 3 or older. If it does then simply delete the <video name="bg_video"> blocks (Batocera) or the <video name="backgroundVideo"> block (ES-DE) from theme.xml. The still image art/background.jpg is then used in that case.

## Credits and licences

- Console pictures: [ES-DE-System-Icon-Set](https://github.com/Zoidburg13/ES-DE-System-Icon-Set) by Zoidburg13 (CC0)
- **Fonts:** DejaVu Sans and DejaVu Sans Mono. Both have a free license.
- Trophy icon and background animation: made with code, not AI generated art.
- Raspberry Pi logo: a trademark of Raspberry Pi Ltd. Used here for a personal/fan-made theme. Please check their brand guidelines before redistributing.
- All console logos in the icon set are the property of their respective owners.
- Background photo: supplied by the repo owner. Original source and licence are not recorded here so please replace with your own if you intend to distribute the theme widely.

This project has no affiliation or endorsement from Raspberry Pi Ltd, Batocera, RetroAchievements or ES-DE.
