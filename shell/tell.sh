export TELL_DRIVE_FILE="${TELL_DRIVE_FILE:-$HOME/GoogleDrive/LATEST_TERMINAL_TELEMETRY.txt}"
tell() {
  local out="$TELL_DRIVE_FILE"
  mkdir -p "$(dirname "$out")"
  {
    echo "=== CROSTINI MOBILE TELEMETRY ($(date -Iseconds)) ==="
    git log -n 3 --oneline 2>/dev/null || true
    [ -n "$1" ] && { echo ""; eval "$@" 2>&1; }
  } > "$out"
  sync
  echo "Telemetry synced -> $out"
}
