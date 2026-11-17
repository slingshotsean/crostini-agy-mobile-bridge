export TELL_DRIVE_FILE="${TELL_DRIVE_FILE:-$HOME/GoogleDrive/LATEST_TERMINAL_TELEMETRY.txt}"
export TELL_RING_FILE="${TELL_RING_FILE:-$HOME/.telemetry_ring.log}"
tell() {
  mkdir -p "$(dirname "$TELL_DRIVE_FILE")"
  {
    echo "=== CYCLE ($(date -Iseconds)) | PWD: $(pwd) ==="
    [ -n "$1" ] && { echo "CMD: $*"; eval "$@" 2>&1; }
  } >> "$TELL_RING_FILE"
  tail -n 200 "$TELL_RING_FILE" > "${TELL_RING_FILE}.tmp" && mv "${TELL_RING_FILE}.tmp" "$TELL_RING_FILE"
  cat "$TELL_RING_FILE" > "$TELL_DRIVE_FILE"
  sync
  echo "Rolling telemetry synced -> $TELL_DRIVE_FILE"
}
