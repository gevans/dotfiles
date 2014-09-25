if type "rmtrash" > /dev/null; then
  alias orig-rm='command rm'
  alias rm='rmtrash'
fi
