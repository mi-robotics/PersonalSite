#!/usr/bin/env bash
# Compress a demo video for the site: H.264, max 1280px wide, no audio,
# web-optimised (moov atom first so it starts playing immediately).
# Also writes a poster frame JPEG to assets/images/.
#
# Usage: scripts/compress-video.sh input.mp4 [name]
#   -> assets/videos/<name>.mp4 and assets/images/<name>.jpg
set -euo pipefail

in="$1"
name="${2:-$(basename "${in%.*}")}"
root="$(cd "$(dirname "$0")/.." && pwd)"
out="$root/assets/videos/$name.mp4"
poster="$root/assets/images/$name.jpg"

ffmpeg -y -i "$in" \
  -c:v libx264 -crf 28 -preset slow -pix_fmt yuv420p \
  -vf "scale='min(1280,iw)':-2" \
  -an -movflags +faststart \
  "$out"

ffmpeg -y -loglevel error -i "$out" -frames:v 1 -q:v 3 "$poster"

size_mb=$(du -m "$out" | cut -f1)
echo "Wrote $out (${size_mb} MB) and $poster"
if [ "$size_mb" -gt 20 ]; then
  echo "Warning: over 20 MB. Consider trimming, raising -crf, or hosting on YouTube." >&2
fi
