# ALIASES

# list files and directories
alias ls='exa'
alias ll='exa -la --icons'
alias la='exa -a'
alias lt='exa -T --icons'
alias ltd='exa -T -D --icons'
alias lt1='exa -T -L 1 --icons'
alias lt2='exa -T -L 2 --icons'
alias ltd1='exa -T -D -L 1 --icons'
alias ltd2='exa -T -D -L 2 --icons'


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

# vimrc and bashrc
alias vrc='vim ~/.vimrc'
alias brc='vim ~/.bashrc'
alias sbrc='source ~/.bashrc'
