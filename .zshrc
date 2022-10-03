# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set lang
export LANG="en_US.UTF-8"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:~/.local/bin
# Add perl path
export PATH=$PATH:/usr/local/lib/x86_64-linux-gnu/perl/5.26.1/
# Clangd
export PATH=$PATH:/usr/local/opt/llvm/bin

# Python startup
export PYTHONSTARTUP=~/.pythonrc

# Path to your oh-my-zsh installation.
OS=$(uname 2> /dev/null)
if [ $OS = "Darwin" ]; then
    echo 'macos settings'
    export ZSH="/Users/valentin/.oh-my-zsh"
    source $(brew --prefix)/etc/profile.d/z.sh
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    plugins=(
        git
        zsh-autosuggestions
        zsh-syntax-highlighting
    )
elif [ $OS = "Linux" ]; then
    echo 'linux settings'
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
# ZSH_THEME='typewritten'
# if [ $OS = 'Darwin' ]; then; LAYOUT='singleline'; else; LAYOUT='multiline'; fi
# TYPEWRITTEN_PROMPT_LAYOUT=$LAYOUT
# TYPEWRITTEN_SYMBOL='$'
# TYPEWRITTEN_CURSOR='block'

# # spaceship
# if [[ ! -a $ZSH_CUSTOM/themes/spaceship.zsh-theme ]]; then
#   git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
#   ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
# fi
# ZSH_THEME="spaceship"

# powerlevel10k
# get source if not there
if [[ ! -a ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k ]]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
fi
ZSH_THEME='powerlevel10k/powerlevel10k'

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
if type exa > /dev/null; then
    ls_cmd="exa"
    newest="-soldest"
else
    ls_cmd="ls"
    newest="-t"
fi
alias ls='$ls_cmd'
alias l='$ls_cmd -lah'
alias lrt='$ls_cmd -lar $newest'
alias vi='nvim'
alias v='nvim'
alias vim='nvim'
alias tcpdump='sudo tcpdump'
alias ge='gedit'
alias ws='cd ~/workspace && pwd'
alias shutter='shutter -s'
alias yank='yank-cli'
alias pip-upgrade="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"
alias chrome='google-chrome'
alias diff='colordiff'
alias ssh-config='vi ~/.ssh/config'
alias github='/opt/GitHub\ Desktop/github-desktop'
alias randwp="feh --bg-fill --randomize /home/valentin/Pictures/wallpapers"
alias i3config='vi ~/.config/i3/config'
alias tm='tmux new-session -A -s main'
alias xt='export TERM=xterm-256color'

# Dotfiles management
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# tmux-256color issues
alias ssh='TERM=xterm-256color ssh'
alias htop='TERM=xterm-256color htop'
alias glances='TERM=xterm-256color glances'

pip-dev () {
    src_venv
    pip install -U neovim pynvim rope jedi flake8 isort yapf python-language-server
}

ydl () {
    youtube-dl --extract-audio --no-playlist --audio-format mp3 $1
}

ydlp () {
    youtube-dl --extract-audio --audio-format mp3 $1
}

say () {
    echo "$@" | festival --tts
}

src_venv () {
    if [[ -d venv ]]; then
        echo 'sourcing venv'
        source venv/bin/activate
    elif [[ -d env ]]; then
        echo 'sourcing env'
        source env/bin/activate
    fi
}

ide () {
    # Start tmux
    tm
    # Split panes
    tmux split-window -v -p 23
    tmux split-window -h -p 50
    # Reselect top pane
    tmux select-pane -U
    # Source venv if present
    src_venv
    # Start editor
    nvim
}

echo ''
neofetch
echo ''
fortune -s
# Source venv if present
src_venv

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"
export FZF_DEFAULT_COMMAND="fd --hidden --exclude .git --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
if [ $OS = "Linux" ]; then
    source /usr/share/fzf/key-bindings.zsh
    source /usr/share/fzf/completion.zsh
fi

PATH="/home/valentin/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/valentin/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/valentin/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/valentin/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/valentin/perl5"; export PERL_MM_OPT;

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# end
