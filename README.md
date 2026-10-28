# PersonalSite

**Live site: https://mi-robotics.github.io/PersonalSite/**

Hand-written static site (HTML + CSS, no build step) hosted free on GitHub Pages.

## Layout

```
index.html            # all page content (projects, demos, video pop-up script)
css/style.css         # styling
assets/papers/        # PDFs (papers, CV)
assets/videos/        # short compressed demo clips
assets/images/        # portrait, thumbnails, video posters
scripts/compress-video.sh
.nojekyll             # tells Pages to serve files as-is
```

## Preview locally

```
python3 -m http.server 8000
```
then open http://localhost:8000.

## Adding a project

1. Put the PDF in `assets/papers/` and a thumbnail in `assets/images/`.
2. Optional video: `scripts/compress-video.sh raw.mp4 my-project` (or link a YouTube URL).
3. Copy an `<article class="project">` block in `index.html`, newest first, and renumber the labels.
   A link with `data-lightbox` (to an .mp4 or a YouTube URL) opens in the pop-up player.

## Adding a demo

Copy an `<article class="demo">` block in the Demos section of `index.html`.

## Video rules of thumb

- GitHub hard limit: 100 MB per file; keep the whole repo under ~1 GB.
- Committed clips: short loops, ideally < 10–20 MB (use the script).
- Talks / long videos: upload to YouTube (unlisted is fine) and embed an `<iframe>`.
- Git keeps every version forever — avoid repeatedly re-committing big files.

## Deploy

Push to `main`. The `.github/workflows/pages.yml` workflow deploys the site in about a minute
(Pages setting: Settings → Pages → Source → GitHub Actions).
