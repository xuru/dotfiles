#!/usr/bin/env bash

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Launchpad.app" # Default app
dockutil --no-restart --add "/Applications/Google Chrome.app" # Cask
dockutil --no-restart --add "/Applications/Mail.app" # Default app
dockutil --no-restart --add "/Applications/Calendar.app" # Default app
dockutil --no-restart --add "/Applications/Reminders.app" # Default app
dockutil --no-restart --add "/Applications/Notes.app" # Default app
dockutil --no-restart --add "/Applications/Messages.app" # Default app
dockutil --no-restart --add "/Applications/Textual.app" # Cask
dockutil --no-restart --add "/Applications/Slack.app" # MAS
dockutil --no-restart --add "/Applications/iTerm.app" # Cask
dockutil --no-restart --add "/Applications/System Preferences.app" # Default app

killall Dock
