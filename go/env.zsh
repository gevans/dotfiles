# Expects Go to be installed through Homebrew
GOPATH="$HOME/Code/go"
GOROOT="$(greadlink -f $(brew --prefix go))/libexec"
PATH="$GOROOT/bin:$PATH"

export GOROOT GOPATH
