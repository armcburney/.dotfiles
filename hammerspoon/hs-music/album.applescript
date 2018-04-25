--------------------------------------------------------------------------------
-- album.applescript
--
-- A script which writes the current song's album artwork to .jpg format from
-- raw bytes
--------------------------------------------------------------------------------

-- Get the raw bytes for the current track artwork
tell application "iTunes" to tell artwork 1 of current track
  set srcBytes to raw data
  set ext to ".jpg"
end tell

-- Write the bytes to a temporary file
set fileName to (((path to music folder) as text) & "album_artwork" & ext)
set outFile to open for access file fileName with write permission
set eof outFile to 0
write srcBytes to outFile
close access outFile
