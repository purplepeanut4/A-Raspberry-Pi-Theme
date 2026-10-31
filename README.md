# A-Raspberry-Pi-Theme

A Raspberry Pi themed Batocera/ES theme

![Preview of the animated background](docs/preview.jpg)

**Raspberry Circuit** is an animated EmulationStation theme in Raspberry Pi colours (raspberry red and leaf green). It comes in two versions, because Batocera and ES-DE use different theme engines and can't share one `theme.xml`.

> **Status:** I haven't been able to test this on a real device yet. The XML is valid and the layouts follow the official theme docs, but expect small fixes. Issues and error logs are welcome.

## Features

- **Animated background.** A 10-second seamless loop built from a photo of Raspberry Pi boards. Each board floats on its own over an animated circuit layer, with travelling light pulses, soft edge glows and a light sweep.
- **Console pictures** for about 200 systems, shown in the system carousel and in each game list header.
- **Bobbing Raspberry Pi logo** and blinking PWR/ACT LEDs in the header.
- **Batocera:** storyboard animations. The header slides in, the panels slide and fade in, game images fade in, and the selected system pops.
- **ES-DE:** fade transitions between screens, and a choice of raspberry or leaf-green accent colours.
- Game list with description, rating, release date and screenshot/video preview, plus a simple grid view (Batocera) and themed menus.

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
3. Optional: pick a colour scheme (raspberry / leaf) and theme transitions in the same menu.

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

## Customising

`theme.xml` is commented and written for beginners. `pos` and `size` are fractions of the screen, and colours are 6-digit hex without the `#`.

- **Title:** search `theme.xml` for `BERRY BOX`.
- **Console picture:** drop a PNG named exactly like the system into `art/systems/` (for example `snes.png`). A system with no picture shows its name as text.
- **Animation speed (Batocera):** change the `duration="..."` values, which are in milliseconds.
- **Colours:** raspberry is `C51A4A` and leaf green is `75A928`.
- **Check for overlaps after editing:** run `python3 tools/check_layout.py rpi-berry-theme/theme.xml rpi-berry-theme-es-de/theme.xml`. It lists any two on-screen elements whose boxes overlap (panels behind text are ignored).
- **Move the carousel:** change the `y` values of the carousel, `carousel_band` / `carouselBand` and the two lines.

## Performance

The background is a 720p H.264 video, which is fine on a Pi 4/5 and PCs. On a Pi 3 or older it may stutter. If so, delete the `<video name="bg_video">` blocks (Batocera) or the `<video name="backgroundVideo">` block (ES-DE) from `theme.xml`. The still image `art/background.jpg` is used instead.

## Credits and licences

- **Console pictures:** [ES-DE-System-Icon-Set](https://github.com/Zoidburg13/ES-DE-System-Icon-Set) by Zoidburg13, released under CC0.
- **Fonts:** DejaVu Sans and DejaVu Sans Mono (free licence).
- **Circuit animation:** drawn with code, with no AI-generated art.
- **Raspberry Pi logo:** a trademark of Raspberry Pi Ltd. Used here for a personal, fan-made theme. Check their brand guidelines before redistributing.
- **Console logos** shown in the icon set belong to their respective owners.
- **Background photo:** supplied by the repo owner. Its original source and licence are not recorded here, so replace it if you plan to redistribute the theme widely.

This project isn't affiliated with or endorsed by Raspberry Pi Ltd, Batocera or ES-DE.
