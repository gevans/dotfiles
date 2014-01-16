# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi

if $(gdircolors &>/dev/null)
then
  eval `gdircolors $ZSH/system/dircolors-solarized/dircolors.ansi-dark`
fi

if $(ggrep &>/dev/null)
then
  alias grep="ggrep --color"
fi
