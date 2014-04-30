if [ -d "/usr/local/go" ]; then
  GOROOT="/usr/local/go"
  GOPATH="$HOME/Code/go"

  export GOROOT GOPATH
fi
