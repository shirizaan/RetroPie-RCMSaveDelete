#!/usr/bin/env bash

romdir=$(dirname "$3")
romfile=$(basename "$3")

echo "romfile: $romfile" >&2

IFS=$'\n'

function deleteSaveFiles() {
  FILES=$(find $romdir -type f -name ${romfile%.*}.*)

  for f in $FILES; do
    if [[ $(basename "$f") != "$romfile" ]]; then
      echo "Deleting $f" >&2
      rm "$f"
    fi
  done

  dialog --title "Complete" --msgbox "Save files for $romfile have been deleted." 20 60 2>&1 >/dev/tty
  exit 0
}

function noChange() {
  dialog --title "Cancelled" --msgbox "No changes were made." 20 60 2>&1 >/dev/tty
  exit 0
}

dialog --defaultno --yesno \
 "Do you want to permanently delete the save files for $romfile?" \
 20 60 2>&1 >/dev/tty && deleteSaveFiles || noChange
