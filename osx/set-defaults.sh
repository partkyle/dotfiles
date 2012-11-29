# Sets reasonable OS X defaults.
#
# Or, in other words, set shit how I like in OS X.
#
# The original idea (and a couple settings) were grabbed from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.osx
#
# Run ./set-defaults.sh and you'll be good to go.

# Disable press-and-hold for keys in favor of key repeat
defaults write -g ApplePressAndHoldEnabled -bool false

# Use AirDrop over every interface. srsly this should be a default.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Always open everything in Finder's list view. This is important.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Show the ~/Library folder
chflags nohidden ~/Library

# Use the 2D dock
defaults write com.apple.dock no-glass -boolean YES

# use the "suck" minimze effect
defaults write com.apple.dock mineffect -string suck

# Show scrollbars only when scrolling (not sure if this one works)
defaults write -g AppleShowScrollBars -string WhenScrolling

# Add the double click minize behavior
defaults write -g AppleMiniaturizeOnDoubleClick -int 1

# Key repeat settings
defaults write -g InitialKeyRepeat -int 25
defaults write -g KeyRepeat -int 2

# Enable "Natural" mouse scrolling
# this one broke my shit!
# defaults write -g com.apple.swipescrolldirection -int 0

# Use function keys like normal (I play games too Apple!)
defaults write -g com.apple.keyboard.fnState -int 1

# disable the dashboard
defaults write com.apple.dashboard mcx-disabled -boolean YES
