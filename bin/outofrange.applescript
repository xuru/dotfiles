--tell application "iTunes" to pause
--again, this is optional, but if iTunes is playing, you might want to pause it;
delete '--'

tell application "System Events"
tell security preferences
set require password to wake to true
end tell
end tell

-- start screensaver (which locks the screen)
activate application "ScreenSaverEngine"
