# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.dotfiles/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh


POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_COLOR_SCHEME=${POWERLEVEL9K_COLOR_SCHEME:-dark} 
POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir newline vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs battery load ssh public_ip time)
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="\u2570\ue1fd "

POWERLEVEL9K_OS_ICON_BACKGROUND="clear"
POWERLEVEL9K_OS_ICON_FOREGROUND="blue"
POWERLEVEL9K_TODO_BACKGROUND="clear"
POWERLEVEL9K_TODO_FOREGROUND="249"
POWERLEVEL9K_DIR_HOME_BACKGROUND="clear"
POWERLEVEL9K_DIR_HOME_FOREGROUND="blue"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="clear"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="blue"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="clear"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="blue"
POWERLEVEL9K_STATUS_OK_BACKGROUND="clear"
POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="clear"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"
POWERLEVEL9K_NVM_BACKGROUND="clear"
POWERLEVEL9K_NVM_FOREGROUND="249"
POWERLEVEL9K_NVM_VISUAL_IDENTIFIER_COLOR="green"
POWERLEVEL9K_AWS_BACKGROUND="clear"
POWERLEVEL9K_AWS_FOREGROUND="249"
POWERLEVEL9K_RVM_BACKGROUND="clear"
POWERLEVEL9K_RVM_FOREGROUND="249"
POWERLEVEL9K_RVM_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="clear"
POWERLEVEL9K_LOAD_WARNING_BACKGROUND="clear"
POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="clear"
POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND="249"
POWERLEVEL9K_LOAD_WARNING_FOREGROUND="249"
POWERLEVEL9K_LOAD_NORMAL_FOREGROUND="249"
POWERLEVEL9K_LOAD_CRITICAL_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_LOAD_WARNING_VISUAL_IDENTIFIER_COLOR="yellow"
POWERLEVEL9K_LOAD_NORMAL_VISUAL_IDENTIFIER_COLOR="green"
POWERLEVEL9K_RAM_BACKGROUND="clear"
POWERLEVEL9K_RAM_FOREGROUND="249"
POWERLEVEL9K_RAM_ELEMENTS=(ram_free)
POWERLEVEL9K_BATTERY_LOW_BACKGROUND="clear"
POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND="clear"
POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND="clear"
POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND="clear"
POWERLEVEL9K_BATTERY_LOW_FOREGROUND="249"
POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND="249"
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND="249"
POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND="249"
POWERLEVEL9K_BATTERY_LOW_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_BATTERY_CHARGING_VISUAL_IDENTIFIER_COLOR="yellow"
POWERLEVEL9K_BATTERY_CHARGED_VISUAL_IDENTIFIER_COLOR="green"
POWERLEVEL9K_BATTERY_DISCONNECTED_VISUAL_IDENTIFIER_COLOR="249"
POWERLEVEL9K_TIME_BACKGROUND="clear"
POWERLEVEL9K_TIME_FOREGROUND="249"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="clear"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="clear"
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='clear'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='green'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="yellow"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="yellow"
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="clear"
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="249"
POWERLEVEL9K_SSH_BACKGROUND="clear"
POWERLEVEL9K_SSH_FOREGROUND="blue"
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S} \UE12E"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=('status' 'os_icon' 'ssh' 'context' 'dir' 'newline' 'vcs')
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=('aws' 'nvm' 'load' 'ram_joined' 'battery' 'time')


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"
#ZSH_THEME="junkfood"

#ZSH_THEME="kphoen"
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-detect-os git aws node docker docker-compose npm tmux rvm zsh-dircolors-solarized zsh-autosuggestions osx)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

ENABLE_POWERLINE=0

export AWS_DEFAULT_PROFILE=default


# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

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

# BASE16_SHELL=$HOME/.config/base16-shell/
# [ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"


if [[ "$OSX" == "1" ]]
then
  export PATH=$PATH:$HOME/Library/Python/3.6/bin
  if [[ "$ENABLE_POWERLINE" == "1" ]]
  then
    source $HOME/Library/Python/3.6/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh
  fi
elif [[ "$LINUX" == "1" ]]
then
  if [[ "$ENABLE_POWERLINE" == "1" ]]
  then
    source $HOME/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
  fi
fi
