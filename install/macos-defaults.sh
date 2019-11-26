#!/usr/bin/env bash
# vim: set ts=4 sw=4 tw=80 syntax=bash
set +e

# Adapted from https://mths.be/macos
# https://github.com/mathiasbynens/dotfiles/blob/master/.macos

# Of note:
#    https://github.com/herrbischoff/awesome-macos-command-line

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

function defaults_write {
    echo "  defaults write $1 $2 $3 $4 $5 $6"
    defaults write $1 $2 $3 $4 $5 $6
}

function print {
    printf "\033[32mSetting $1 prefs\033[39m\n"
}

function osx_debug {
    defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
    defaults write com.apple.DiskUtility advanced-image-options -bool true
    defaults write com.apple.Safari IncludeDebugMenu -bool true
    defaults write com.apple.addressbook ABShowDebugMenu -bool true
    defaults write com.apple.iCal IncludeDebugMenu -bool true
}

function osx_disk {
    sudo pmset -a sms 0  # sudden motion sensor off for SSD
    sudo pmset -a hibernatemode 0  # no ram to disk backup for sleep
    sudo rm -f /var/vm/sleepimage
    sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.dynamic_pager.plist
}

function osx_dock {
    print "dock"
    defaults_write com.apple.dock magnification -bool true
    defaults_write com.apple.dock largesize -int 64
    defaults_write com.apple.dock tilesize -int 32

    defaults_write com.apple.dock show-process-indicators -bool true
    defaults_write com.apple.dock launchanim -bool false
    defaults_write com.apple.dock mouse-over-hilte-stack -bool true
    defaults_write com.apple.dock autohide -bool true
    defaults_write com.apple.dock autohide-delay -float 0
    defaults_write com.apple.dock autohide-time-modifier -float 0.25
    defaults_write com.apple.dock dashboard-in-overlay -bool true
    defaults_write com.apple.dock expose-animation-duration -float 0.1
    defaults_write com.apple.dock minimize-to-application -bool true
    defaults_write com.apple.dock orientation -string $1
    defaults_write com.apple.dock showhidden -bool true
}

function osx_finder {
    print "finder"
    chflags nohidden ~/Library
    defaults_write com.apple.desktopservices DSDontWriteNetworkStores -bool true # no .DS_Store on network volumes
    defaults_write com.apple.finder AppleShowAllExtensions -bool true
    #defaults write com.apple.finder AppleShowAllFiles -bool true
    defaults_write com.apple.finder FXPreferredViewStyle -string "Nlsv"
    defaults_write com.apple.finder FXPreferredGroupBy -string "Kind"
    defaults_write com.apple.finder NewWindowTargetPath -string "file://Users/$USER/"
    defaults_write com.apple.finder QLEnableTextSelection -bool true
    defaults_write -g ShowStatusBar -bool true # finder: show status bar
    defaults_write NSGlobalDomain AppleShowAllExtensions -bool true  # Show all filename extensions in Finder

    # Allow quitting Finder via ⌘ + Q; doing so will also hide desktop icons
    defaults_write com.apple.finder QuitMenuItem -bool true

    # Automatically open a new Finder window when a volume is mounted
    defaults_write com.apple.frameworks.diskimages auto-open-ro-root -bool true
    defaults_write com.apple.frameworks.diskimages auto-open-rw-root -bool true

    # Disable disk image verification
    defaults_write com.apple.frameworks.diskimages skip-verify -bool true
    defaults_write com.apple.frameworks.diskimages skip-verify-locked -bool true
    defaults_write com.apple.frameworks.diskimages skip-verify-remote -bool true

    # Display full POSIX path as Finder window title
    defaults_write com.apple.finder _FXShowPosixPathInTitle -bool true

    # Disable the warning when changing a file extension
    defaults_write com.apple.finder FXEnableExtensionChangeWarning -bool false

    # Show item info below desktop icons
    /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

    defaults_write com.apple.finder WarnOnEmptyTrash -bool false
    defaults_write com.apple.finder EmptyTrashSecurely -bool false  # Empty Trash securely by default
}

function osx_general {
    print "general"
    defaults_write -g AppleScrollerPagingBehavior -int 1 # scroll bar: jump to clicked spot
    defaults_write -g NSTableViewDefaultSizeMode -int 1 # sidebar icon size: small
    defaults_write -g NSQuitAlwaysKeepsWindows -bool true # resume windows
    #defaults write -g NSDisableAutomaticTermination -bool true # sudden termination
    defaults_write -g AppleShowAllExtensions -bool true # show all extensions
    defaults_write -g ShowMountedServersOnDesktop -bool true # desktop: show servers
    defaults_write com.apple.dock showAppExposeGestureEnabled -bool true # trackpad: enable app expose

    # Show remaining battery time; hide percentage
    defaults_write com.apple.menuextra.battery ShowPercent -string "NO"
    defaults_write com.apple.menuextra.battery ShowTime -string "YES"

    sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName # more verbose clock icon
    sudo scutil --set ComputerName "xuru"
    sudo scutil --set HostName "xuru.mbp.local"
    sudo scutil --set LocalHostName "xuru"

    sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "xuru"
    defaults_write com.apple.screensaver askForPassword -int 1
    defaults_write com.apple.screensaver askForPasswordDelay -int 0
    defaults_write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false  # Disable auto-correct

    # Disable the “Are you sure you want to open this application?” dialog
    defaults_write com.apple.LaunchServices LSQuarantine -bool false

    # Enable AirDrop over Ethernet and on unsupported Macs running Lion
    defaults_write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

    #TODO checkout systemsetup
}

function osx_itunes {
    print "itunes"
    defaults_write com.apple.iTunes disableGeniusSidebar -bool true
    defaults_write com.apple.iTunes disablePing -bool true
    defaults_write com.apple.iTunes disablePingSidebar -bool true
    defaults_write com.apple.iTunes disableRadio -bool true
    defaults_write com.apple.iTunes show-store-link-arrows -bool false
}

function osx_keyboard {
    print "keyboard"
    defaults_write -g AppleKeyboardUIMode -int 3                # full keyboard access
    defaults_write -g ApplePressAndHoldEnabled -bool false      # favor key repeat
    defaults_write com.apple.BezelServices kDim -bool true      # keyboard illumination
    defaults_write com.apple.BezelServices kDimTime -int 300    # dim after 5 minutes
    defaults_write NSGlobalDomain KeyRepeat -int 0              # Set a blazingly fast keyboard repeat rate
}

function osx_noatime {
    print "noatime"
    sudo defaults write com.apple.loginwindow LoginHook $HOME/bin/remount_noatime
}

function osx_power {
    print "power"
    sudo pmset -b displaysleep 5
    sudo pmset -c displaysleep 20
    sudo pmset -c sleep 0
}

function osx_reset {
    print "refresh dock"
    find ~/Library/Application\ Support/Dock -name "*.db" -maxdepth 1 -delete
}

function osx_safari {
    print "safari"
    defaults_write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2 # thumbnails off
    defaults_write com.apple.Safari ProxiesInBookmarksBar "()"
}

function osx_security {
    print "security"
    # unneded daemons
    #sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.blued.plist                           # bluetooth
    #sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.IIDCAssistant.plist                   # iSight
    sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.nis.ypbind.plist                       # NIS
    sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.racoon.plist                           # VPN
    sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.RemoteDesktop.PrivilegeProxy.plist     # ARD
    sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.RFBEventHelper.plist                   # ARD
    #sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.UserNotificationCenter.plist          # User notifications
    sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.webdavfs_load_kext.plist               # WebDAV
    sudo launchctl unload -w /System/Library/LaunchDaemons/org.postfix.master.plist                         # email server
    #sudo launchctl unload -w /System/Library/LaunchAgents/com.apple.RemoteUI.plist                         # Remote Control

    # remove setuid and setgid
    sudo chmod ug-s /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/MacOS/ARDAgent      # Apple Remote Desktop
    sudo chmod ug-s /sbin/mount_nfs             # NFS
    sudo chmod ug-s /usr/bin/at                 # Job Scheduler
    sudo chmod ug-s /usr/bin/atq                # Job Scheduler
    sudo chmod ug-s /usr/bin/atrm               # Job Scheduler
    sudo chmod ug-s /usr/bin/chpass             # Change user info
    sudo chmod ug-s /usr/bin/crontab            # Job Scheduler
    sudo chmod ug-s /usr/bin/ipcs               # IPC statistics
    sudo chmod ug-s /usr/bin/newgrp             # Change Group
    sudo chmod ug-s /usr/bin/procmail           # Mail Processor
    sudo chmod ug-s /usr/bin/wall               # User Messaging
    sudo chmod ug-s /usr/bin/write              # User Messaging
    sudo chmod ug-s /bin/rcp                    # Remote Access (Insecure)
    sudo chmod ug-s /usr/bin/rlogin             # Remote Access (Insecure)
    sudo chmod ug-s /usr/bin/rsh                # Remote Access (Insecure)
    sudo chmod ug-s /usr/lib/sa/sadc            # System Activity Reporting
    sudo chmod ug-s /usr/sbin/traceroute        # Trace Network
    sudo chmod ug-s /usr/sbin/traceroute6       # Trace Network
    sudo pmset -a destroyfvkeyonstandby 1       # clear file vault key on sleep
    security set-keychain-settings -l           # lock keychain on sleep
}

function osx_visuals {
    print "visuals"
    defaults_write -g NSNavPanelExpandedStateForSaveMode -bool true # expand save panel
    defaults_write -g PMPrintingExpandedStateForPrint -bool true # expand print panel
    defaults_write com.apple.screencapture disable-shadow -bool true
    defaults_write enable-spring-load-actions-on-all-items -bool true
    defaults_write NSGlobalDomain AppleFontSmoothing -int 2  # Enable subpixel font rendering on non-Apple LCDs
    defaults_write NSGlobalDomain AppleShowScrollBars -string "Always"  # Always show scrollbars
    defaults_write NSGlobalDomain AppleEnableMenuBarTransparency -bool false  # Disable menu bar transparency
}

function osx_trackpad {
    print "trackpad"
    defaults_write com.apple.driver.AppleMultitouchTrackpad TrackpadThreeFingerDrag -int 0
    defaults_write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -int 0

    # Enable tap to click (Trackpad)
    defaults_write com.apple.driver.AppleMultitouchTrackpad Clicking -bool true
    defaults_write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

    # Map bottom right Trackpad corner to right-click
    defaults_write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
    defaults_write com.apple.driver.AppleBluetoothMultitouch.trackpad USBMouseStopsTrackpad -bool true
    defaults_write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
}

function osx_mail {
    print "mail.app"
    # Disable send and reply animations in Mail.app
    defaults write com.apple.Mail DisableReplyAnimations -bool true
    defaults write com.apple.Mail DisableSendAnimations -bool true
}

function osx_timemachine {
    print "timemachine"
    # Disable local Time Machine backups
    hash tmutil &> /dev/null && sudo tmutil disablelocal
}

osx_disk
osx_dock "right"
osx_finder
osx_general
osx_itunes
osx_keyboard
osx_noatime
osx_power
osx_safari
osx_security
osx_visuals
osx_trackpad
osx_mail
osx_timemachine
osx_reset

# setup some default filetype application associations

{ cat <<eof
    cx.c3.theunarchiver:gz
    cx.c3.theunarchiver:rar
    cx.c3.theunarchiver:tar
    cx.c3.theunarchiver:zip
    org.vim.MacVim:css
    org.vim.MacVim:js
    org.vim.MacVim:rst
    org.vim.MacVim:markdown
    org.vim.MacVim:md
    org.vim.MacVim:mdwn
    org.vim.MacVim:mediawiki
    org.vim.MacVim:sh
    org.vim.MacVim:text
    org.vim.MacVim:txt
    org.vim.MacVim:xml
    org.vim.MacVim:py
    org.vim.MacVim:conf
    org.vim.MacVim:bash
    org.vim.MacVim:json
    org.vim.MacVim:yml
    org.vim.MacVim:yaml
    org.vim.MacVim:cfg
    org.vim.MacVim:ini
eof
} | grep . |
while IFS=$':' read bundle_id extension ; do
  # Grep to see if Bundle ID exists, sending stdout to /dev/null
  /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -dump | grep $bundle_id > /dev/null
  # Save exit status (0=success & 1=failure)
  status=$?
  # If exit status failed, notify me & exit; if not, change default app for extension
  if test $status -eq 1 ; then
    echo "$bundle_id doesn't exist! Fix the script!"
  else
    echo -e "\nChanging $extension so it opens with $bundle_id"
    duti -s $bundle_id .$extension all
  fi
done

# Kill affected applications
for app in Safari Finder Dock Mail SystemUIServer; do killall "$app" >/dev/null 2>&1; done
