#!/usr/bin/env zsh

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Google Chrome.app" --replacing 'Google Chrome'
dockutil --no-restart --add "/Applications/Calendar.app" --replacing 'Calendar'
dockutil --no-restart --add "/Applications/Quiver.app" --replacing 'Quiver'
dockutil --no-restart --add "/Applications/Notes.app" --replacing 'Notes'
dockutil --no-restart --add "/Applications/Messages.app" --replacing 'Messages'
dockutil --no-restart --add "/Applications/Textual.app" --replacing 'Textual'
dockutil --no-restart --add "/Applications/Slack.app" --replacing 'Slack'
dockutil --no-restart --add "/Applications/iTerm.app" --replacing 'iTerm'
dockutil --no-restart --add "/Applications/Spotify.app" --replacing 'Spotify'
dockutil --no-restart --add "/Applications/WorkFlowy.app" --replacing 'WorkFlowy'
dockutil --no-restart --add "/Applications/Postman.app" --replacing 'Postman'
dockutil --no-restart --add "/Applications/Visual Studio Code.app" --replacing 'Visual Studio Code'
dockutil --no-restart --add "/Applications/PyCharm.app" --replacing 'PyCharm'
dockutil --no-restart --add "/Applications/Sourcetree.app" --replacing 'Sourcetree'

dockutil --no-restart --add "${HOME}/Dropbox" --view list --display folder --replacing 'Dropbox'
dockutil --no-restart --add "/Applications" --view list --display folder --replacing 'Applications'
dockutil --no-restart --add "${HOME}/Documents" --view list --display folder --replacing 'Documents'
dockutil --no-restart --add "${HOME}/Downloads" --view list --display folder --replacing 'Downloads'

killall Dock
