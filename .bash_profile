PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/opt/node@8/bin:$PATH"
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/11/bin/"

export ORACLE_SYSTEM_PASSWORD='vagrant'

# function _update_ps1() {
#     PS1=$(powerline-shell $?)
# }

# if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
#     PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
# fi

eval "$(starship init bash)"

# alias date="gdate"
# SILVER=(status:black:white dir:blue:black git:green:black cmdtime:magenta:black)
# export SILVER_SHELL=$0 # bash, zsh, or fish
# eval "$(silver init)"

alias clamav='freshclam && clamscan -r --bell -i /'

alias ls='exa -la'
alias cat='bat'
alias top="sudo htop"
alias help='tldr'
alias kill_rs='pkill -F tmp/pids/server.pid'
alias be='bundle exec'

alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gf="git status -u --porcelain | awk '{ if (\$1 != \"D\") print \$NF}'"
alias ghist='git log --pretty=format:"%C(yellow)%h %Cblue%>(10)%ad %C(green)%<(20)%aN %C(reset)%<(72)%s %C(red)%<(40)%d" --date=short'

alias got='git '
alias get='git '

alias RubyMineFormatter='/Users/cdhagmann/Library/Application\ Support/JetBrains/Toolbox/apps/RubyMine/ch-0/*/RubyMine.app/Contents/bin/format.sh -s ~/.codeStyleConfig.xml '

eval "$(rbenv init -)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [[ -f "$(brew --prefix)/opt/mcfly/mcfly.bash" ]]; then
    source "$(brew --prefix)/opt/mcfly/mcfly.bash"
fi

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

title() {
    echo -e "\033]0;${1:?please specify a title}\007"
}

mkcdir() {
    mkdir -p $1
    cd $1
}

psearch() {
    ps aux | rg $1 | rg -v rg
}

pksearch() {
    kill $(psearch $1 | awk '{print $2}')
}

gfresh() {
    gb -D checkout-temp
    go $1
    gb -m checkout-temp
    go develop
    git pull
    go -b $1
    git checkout checkout-temp $(git diff --name-only -r $1 checkout-temp --diff-filter=ARMU | xargs)
    rm $(git diff $1 checkout-temp --name-only --diff-filter=D)
}

fullpath() {
    echo "$(
        cd "$(dirname "$1")"
        pwd -P
    )/$(basename "$1")"
}

erb_formatter() {
    if [ $# -eq 0 ]; then
        RubyMineFormatter $(gf | rg erb | xargs -L1 realpath | xargs)
    else
        RubyMineFormatter $(realpath $1)
    fi
}

rb_formatter() {
    if [ $# -eq 0 ]; then
        rubocop --auto-correct $(gf | rg rb | xargs)
    else
        rubocop --auto-correct $1
    fi
}

cp_example() {
    for f in $(fd -I -e .example); do
        newName="$(dirname $f)/$(basename $f .example)"
        cp -v $f $newName
    done
}

alias preview="fzf --preview 'bat --color \"always\" {}'"
# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"
export FZF_CTRL_R_OPTS='--sort --exact --history-size=50000'
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export HISTSIZE=2000
export PATH="/usr/local/sbin:$PATH"
export APP_HOST="localhost"
export APP_PORT="5432"
export EDITOR="code --wait"

export PATH_MAFFT="/usr/local/bin/mafft"
export PATH_FASTTREE="/usr/local/bin/fasttree"
export POSTGRES_USER="cdhagmann"
export POSTGRES_PASS=""
export PATH="/usr/local/opt/qt@5.5/bin:$PATH"
alias ld='lazydocker'
