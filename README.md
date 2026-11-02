# A-Raspberry-Pi-Theme

A Raspberry Pi themed Batocera/ES theme

![Main screen: every Raspberry Pi floating together](docs/preview.jpg)

**Raspberry Circuit** is a simple, animated EmulationStation theme in Raspberry Pi colours. It comes in two versions, because Batocera and ES-DE use different theme engines and can't share one `theme.xml`.

> **Status:** I haven't been able to test this on a real device yet. The XML is valid and the layouts follow the official theme docs, but expect small fixes. Issues and error logs are welcome.

## Features

- **Main screen: all the Raspberry Pis.** A 30-second seamless loop with every product floating together on black: Pi 5, Pi 4, Pi 400, Pi 500, Pi 500+, Compute Module 4, Compute Module 5 (and its IO board), Pico 2, Pico W, Zero and Zero 2 W.
- **Every console page gets its own Pi.** Open a console and the game list sits in front of a different Raspberry Pi product (about 200 systems covered). In ES-DE you can make these animated too.
- **Console pictures** in the system carousel and each game list header.
- **RetroAchievements (Batocera only).** A gold trophy and your username on the main screen when you're logged in, a trophy for systems that support achievements, and a trophy menu icon.
- **Batocera:** the panels and game images fade in, and the console Pi drifts slowly.
- **ES-DE:** a **Theme variant** setting (animated main screen, animated console pages, or still), fade transitions, and a choice of raspberry or leaf-green accents.
- Game list with description, rating, release date and screenshot/video preview, plus themed menus.

![A console page: SNES gets the Raspberry Pi 4](docs/preview_console.jpg)

## What's in this repo

| Folder | For | Install to |
|---|---|---|
| `rpi-berry-theme/` | **Batocera** | `/userdata/themes/` |
| `rpi-berry-theme-es-de/` | **ES-DE** (desktop / AppImage) | `~/ES-DE/themes/` |

Both use the same artwork. Each folder has its own `README.txt`.

## Install

### ES-DE
1. Copy `rpi-berry-theme-es-de` into `~/ES-DE/themes/` (older versions: `~/.emulationstation/themes/`).
2. Restart ES-DE, then go to **Menu → UI Settings → Theme set → Raspberry Circuit**.
3. In the same menu, pick a **Theme variant**:
   - *Animated background (main screen)*: the default and lightest animated option.
   - *Animated background (also console pages)*: each console's Pi floats and glows as a video. Heavier.
   - *Still background*: no video at all. Use this if it lags.

To preview from an AppImage with error output:

```bash
chmod +x ES-DE*.AppImage
./ES-DE*.AppImage --debug --resolution 1280 720
```

ES-DE is strict about theme files: one wrong tag stops the theme loading. The error is printed in the terminal and in `~/ES-DE/logs/es_log.txt`. In debug mode **Ctrl+R** reloads the theme after you edit `theme.xml` (changes to `capabilities.xml` need a restart).

### Batocera
1. Copy `rpi-berry-theme` into `/userdata/themes/`. On the network share this is `\\BATOCERA\share\themes\`.
2. On the console: **START → User Interface → Theme Set → rpi-berry-theme**.
3. If something looks wrong, check `/userdata/system/logs/es_launch_stdout.log`.

## Which Pi is behind which console?

Each console is assigned one of the 12 products. The full list is in [`docs/console-pi-map.json`](docs/console-pi-map.json). To change one, copy a different picture over `art/bg/<system>.jpg` (for example `art/bg/snes.jpg`). In ES-DE's animated console pages, also point `bgv/<system>.xml` at another video in `art/products/`.

## RetroAchievements

Only the Batocera version has this. ES-DE has no RetroAchievements feature of its own (achievements are handled inside RetroArch), so there's nothing for an ES-DE theme to show.

In Batocera, log in under **START → Game Settings → RetroAchievements**. The theme then shows your username next to a trophy on the main screen. It uses Batocera's theme conditions `if="${global.cheevos}"` (logged in) and `if="${system.cheevos}"` (this system supports achievements). I couldn't test these on a device, so if the trophy doesn't appear, open an issue with your Batocera version.

## Customising

`theme.xml` is commented and written for beginners. `pos` and `size` are fractions of the screen, and colours are 6-digit hex without the `#`.

- **Console picture:** drop a PNG named exactly like the system into `art/systems/` (for example `snes.png`).
- **Animation speed (Batocera):** change the `duration="..."` values, which are in milliseconds.
- **Colours:** raspberry is `C51A4A`, leaf green is `75A928` and the trophy gold is `E8B923`.
- **Check for overlaps after editing:** run `python3 tools/check_layout.py rpi-berry-theme/theme.xml rpi-berry-theme-es-de/theme.xml`.
- **Move the carousel:** change the `y` values of the carousel, `carousel_band` / `carouselBand` and the "games available" pill.

## Performance

The main-screen background is a 960×540 H.264 video (about 2 MB). On a Pi 3 or older it may still stutter.

- **ES-DE:** choose *Still background* under **Theme variant**.
- **Batocera:** delete the `<video name="bg_video">` block in `theme.xml`. The still collage is used instead.

## Credits and licences

- **Product photos:** from the [Raspberry Pi documentation](https://github.com/raspberrypi/documentation), © Raspberry Pi Ltd. I cut them out and composed them myself. I haven't verified the licence for redistribution, so check it before sharing the theme widely.
- **Console pictures:** [ES-DE-System-Icon-Set](https://github.com/Zoidburg13/ES-DE-System-Icon-Set) by Zoidburg13, released under CC0.
- **Fonts:** DejaVu Sans and DejaVu Sans Mono (free licence).
- **Trophy icon:** made with code, with no AI-generated art.
- **Raspberry Pi logo:** a trademark of Raspberry Pi Ltd. Used here for a personal, fan-made theme. Check their brand guidelines before redistributing.
- **Console logos** shown in the icon set belong to their respective owners.

This project isn't affiliated with or endorsed by Raspberry Pi Ltd, Batocera, RetroAchievements or ES-DE.
