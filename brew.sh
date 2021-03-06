#!/usr/bin/env bash

# Install command-line tools using Homebrew.
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some macOS tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew cask install java # for java related app (maven, vault cli, etc)

# Install font tools.
#brew tap bramstein/webfonttools
#brew install sfnt2woff
#brew install sfnt2woff-zopfli
#brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
# brew install aircrack-ng
# brew install bfg
# brew install binutils
# brew install binwalk
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
# brew install fcrackzip
# brew install foremost
# brew install hashpump
# brew install hydra
# brew install john
# brew install knock
# brew install netpbm
# brew install nmap
# brew install pngcheck
# brew install socat
# brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
# brew install xpdf
# brew install xz

# Install other useful binaries.
#brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install imagemagick --with-webp
# brew install lua
# brew install lynx
# brew install p7zip
# brew install pigz
# brew install pv
# brew install rename
# brew install rhino
# brew install speedtest_cli
# brew install ssh-copy-id
#brew install testssl
#brew install tree
#brew install vbindiff
brew install webkit2png
#brew install zopfli

# Jeff Code
brew install imagemagick
brew install mackup
brew install mariadb
# brew install maven
# brew install node
brew install openssl
#brew install apr apr-util
#brew install homebrew/php/php71 --without-apache
#brew install homebrew/php/php71-imagick
#brew install homebrew/php/php71-mcrypt
brew install python
brew install sqlite
brew install youtube-dl
brew install composer
# brew install vault-cli
brew install zsh

apps=(
	android-file-transfer
	android-studio
    # gitup
    google-chrome
    imageoptim
    #microsoft-office
    keycastr
    sequel-pro
    sublime-text3
    sourcetree
    # sqlitebrowser
    the-unarchiver
    vlc
    whatsapp
    adobe-photoshop-cc
    adobe-photoshop-lightroom
    postman
    iterm2
    quicklook-json
    qlcolorcode
    betterzipql
    qlimagesize
    qlstephen
    quicklook-csv
)

brew cask install "${apps[@]}"

# Remove outdated versions from the cellar.
brew cleanup

#brew services start homebrew/php/php71
#brew services start mariadb
mysql_secure_installation
