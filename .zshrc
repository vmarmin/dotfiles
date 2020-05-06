# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:~/.local/bin
# Add perl path
export PATH=$PATH:/usr/local/lib/x86_64-linux-gnu/perl/5.26.1/
# Add GO path
export PATH=$PATH:/home/valentin/go/bin
export PATH="$HOME/.cargo/bin:$PATH"

# Python startup
export PYTHONSTARTUP=~/.pythonrc

# Path to your oh-my-zsh installation.
if [ "$(uname 2> /dev/null)" = "Darwin" ]; then
    export ZSH="/Users/valentin/.oh-my-zsh"
    source $(brew --prefix)/etc/profile.d/z.sh
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    plugins=(
        git
        zsh-autosuggestions
        zsh-syntax-highlighting
    )
    # Start tmux
    if [ "$TMUX" = "" ]; then tmux new-session -A -s main; fi
elif [ "$(uname 2> /dev/null)" = "Linux" ]; then
    export ZSH="/home/valentin/.oh-my-zsh"
    plugins=(
        git
        zsh-autosuggestions
        zsh-syntax-highlighting
        k
	zsh-z
    )
fi

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# source ~/.fonts/*.sh

# Typewritten
# git clone https://github.com/reobin/typewritten.git $ZSH_CUSTOM/themes/typewritten
# ln -s "$ZSH_CUSTOM/themes/typewritten/typewritten.zsh-theme" "$ZSH_CUSTOM/themes/typewritten.zsh-theme"
ZSH_THEME='typewritten'
TYPEWRITTEN_PROMPT_LAYOUT='singleline'
TYPEWRITTEN_SYMBOL='>'
TYPEWRITTEN_CURSOR='block'

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias l='ls -lah'
alias vi='nvim'
alias v='nvim'
alias vim='nvim'
alias tcpdump='sudo tcpdump'
alias lrt='ls -lrt'
alias ge='gedit'
alias ws='cd ~/workspace && pwd'
alias shutter='shutter -s'
alias getstackmanremote='sudo sshfs -o allow_other valentin@10.10.0.25:/home/stackman/Stackman /mnt/rem-stackman'
alias yank='yank-cli'
alias pip-upgrade="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"
alias chrome='google-chrome'
alias diff='colordiff'
alias ssh-config='vi ~/.ssh/config'
alias github='/opt/GitHub\ Desktop/github-desktop'
alias randwp="feh --bg-fill --randomize /home/valentin/Pictures/wallpapers"
alias i3config='vi ~/.i3/config'

# Dotfiles management
dotfiles_repo=/home/valentin/Documents/workspace/dotfiles
alias config='git --git-dir=$dotfiles_repo --work-tree=$HOME'

ydl () {
    youtube-dl --extract-audio --no-playlist --audio-format mp3 $1
}

ydlp () {
    youtube-dl --extract-audio --audio-format mp3 $1
}

say () {
    echo "$@" | festival --tts
}

eval $(thefuck --alias)

neofetch
echo ""
fortune -s

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

PATH="/home/valentin/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/valentin/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/valentin/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/valentin/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/valentin/perl5"; export PERL_MM_OPT;
