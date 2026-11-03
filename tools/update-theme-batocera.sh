#!/bin/bash
# Raspberry Circuit - Batocera theme updater
# Downloads the newest version of the theme from GitHub, but only when it has changed.
# Run it by hand, from the Ports menu, or automatically at boot (see README).
REPO="${REPO:-purplepeanut4/A-Raspberry-Pi-Theme}"
BRANCH="${BRANCH:-main}"
THEME="rpi-berry-theme"
DEST="${THEME_DIR:-/userdata/themes}"

mkdir -p "$DEST"
python3 - "$REPO" "$BRANCH" "$THEME" "$DEST" <<'PY'
import sys, os, re, io, zipfile, shutil, tempfile, urllib.request
repo, branch, theme, dest = sys.argv[1:5]
UA = {"User-Agent": "rpi-circuit-theme-updater"}
def get(url):
    return urllib.request.urlopen(urllib.request.Request(url, headers=UA), timeout=90).read()

def current_version():
    # newest commit that touched the theme folder (public feed, no GitHub account or API limits)
    try:
        feed = get(f"https://github.com/{repo}/commits/{branch}/{theme}.atom").decode("utf-8", "replace")
        return re.search(r"Commit/([0-9a-f]{7,40})", feed).group(1)
    except Exception:
        # fallback: fingerprint of the download itself
        r = urllib.request.urlopen(urllib.request.Request(f"https://codeload.github.com/{repo}/zip/refs/heads/{branch}", headers=UA, method="HEAD"), timeout=60)
        return (r.headers.get("ETag") or "").strip('"')
try:
    sha = current_version()
    if not sha: raise RuntimeError("no version found")
except Exception as e:
    print("Could not check GitHub (no internet?):", e); sys.exit(1)

stamp = os.path.join(dest, "." + theme + ".version")
if os.path.isdir(os.path.join(dest, theme)) and os.path.exists(stamp) and open(stamp).read().strip() == sha:
    print("Raspberry Circuit is already up to date."); sys.exit(0)

print("Downloading the new version...")
try:
    z = zipfile.ZipFile(io.BytesIO(get(f"https://codeload.github.com/{repo}/zip/refs/heads/{branch}")))
except Exception as e:
    print("Download failed:", e); sys.exit(1)

tmp = tempfile.mkdtemp(prefix=".rpi-update-", dir=dest)
try:
    root = z.namelist()[0].split("/")[0]; prefix = f"{root}/{theme}/"
    for m in z.infolist():
        if not m.filename.startswith(prefix) or m.is_dir(): continue
        rel = os.path.normpath(m.filename[len(root)+1:])
        if rel.startswith("..") or os.path.isabs(rel): continue          # safety
        out = os.path.join(tmp, rel); os.makedirs(os.path.dirname(out), exist_ok=True)
        with z.open(m) as src, open(out, "wb") as dst: shutil.copyfileobj(src, dst)
    new = os.path.join(tmp, theme)
    if not os.path.exists(os.path.join(new, "theme.xml")): raise RuntimeError("download looks incomplete")
    live = os.path.join(dest, theme)
    if os.path.isdir(live): os.rename(live, live + ".old")
    os.rename(new, live); shutil.rmtree(live + ".old", ignore_errors=True)
    open(stamp, "w").write(sha)
    print("Updated! Restart EmulationStation to see it:  START > Quit > Restart EmulationStation")
except Exception as e:
    print("Update failed, your current theme was left alone:", e); sys.exit(1)
finally:
    shutil.rmtree(tmp, ignore_errors=True)
PY
