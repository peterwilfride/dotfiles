# ALIASES
alias ls='exa'
alias ll='exa -la --icons'
alias la='exa -a'
alias lt='exa -T --icons'
alias ..='cd ..'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias yt-mp3='youtube-dl -x --audio-format mp3 --prefer-ffmpeg --output "~/Downloads/musicas/%(title)s.%(ext)s"'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -h'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less
alias vrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'