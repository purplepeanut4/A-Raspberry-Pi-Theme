import sys, re, itertools
import xml.etree.ElementTree as ET
SW, SH = 1280, 720
DECOR = re.compile(r"(bg|background|panel|band|line|edge|headerbar|header_bar|infobar|info_bar|still|backgroundvideo|bg_video|menu)", re.I)
def nums(s): return [float(x) for x in s.split()]
def rects(path):
    root = ET.parse(path).getroot()
    out = {}
    for view in root.iter("view"):
        for el in view:
            if not isinstance(el.tag, str): continue
            name = el.get("name") or el.tag
            pos = el.findtext("pos"); 
            if not pos: continue
            x, y = nums(pos)[:2]
            ox, oy = nums(el.findtext("origin") or "0 0")[:2]
            size = el.findtext("size"); mx = el.findtext("maxSize")
            if el.tag == "helpsystem": w, h = 0.47, 0.045          # estimated: 6 entries at this font size
            elif size: w, h = nums(size)[:2]
            elif mx:
                a, b = nums(mx)[:2]
                side = min(a*SW, b*SH); w, h = side/SW, side/SH   # square-ish image
                if el.tag == "video": w, h = a, b
            else: continue
            if el.tag == "carousel" or el.tag == "textlist": pass
            x0, y0 = x - ox*w, y - oy*h
            for vn in [v.strip() for v in view.get("name").split(",")]:
                out.setdefault(vn, []).append((name, el.tag, x0, y0, x0+w, y0+h))
    return out
def check(path):
    print("==", path); bad = 0
    for view, els in rects(path).items():
        content = [e for e in els if not DECOR.search(e[0])]
        for a, b in itertools.combinations(content, 2):
            if {a[0], b[0]} in ({"md_image", "md_video"},): continue   # video replaces the picture
            ix = min(a[4], b[4]) - max(a[2], b[2]); iy = min(a[5], b[5]) - max(a[3], b[3])
            if ix > 0.002 and iy > 0.002:
                bad += 1; print(f"  [{view}] OVERLAP {a[0]} ({a[2]:.3f},{a[3]:.3f})-({a[4]:.3f},{a[5]:.3f})  x  {b[0]} ({b[2]:.3f},{b[3]:.3f})-({b[4]:.3f},{b[5]:.3f})")
        for e in els:
            if e[4] > 1.001 or e[5] > 1.001 or e[2] < -0.001 or e[3] < -0.001:
                if not DECOR.search(e[0]): print(f"  [{view}] OFF-SCREEN {e[0]} {e[2]:.3f},{e[3]:.3f} -> {e[4]:.3f},{e[5]:.3f}")
    print("  overlaps:", bad)
for p in sys.argv[1:]: check(p)
