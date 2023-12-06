# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path to editor
export EDITOR='nvim'

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

unsetopt correct_all

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git rails rake zsh-autosuggestions web-search jsontools history thefuck)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

eval $(thefuck --alias)
# You can use whatever you want as an alias, like for Mondays:
eval $(thefuck --alias FUCK)

source ~/.beam-cli/alias
# source ~/.beam-cli/aliases.sh

# ssh-add ~/.ssh/id_rsa
# ssh-add ~/.ssh/id_rsa_bb_personal

autoload -U add-zsh-hook

beam-cli-init-mobile() {
    eval $(beam-cli --skip-checks mobile init)
    export FASTLANE_APPLE_ID='brandon.minner@beam.dental'
    export FASTLANE_PASSWORD='#JD456k,+Foeb}ubK2Sh'
}

function ecr_login {
  region="${1:-us-east-1}"
  account="${2:-932532311803}"
  aws ecr --region $region get-login-password | docker login --username AWS --password-stdin ${account}.dkr.ecr.$region.amazonaws.com
}

# Android SDK paths
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# JVM configuration
export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home"
export JVM_OPTS="-Xmx3200m"
export PATH="$JAVA_HOME/bin:$PATH"

# Auth Server
export BASE_DOMAIN=ephemeral-instance.qa.beam.tools rails s

source ~/.zsh_aliases

# Misc
#alias ls='colorls'
#alias vim='nvim'
#alias railsc='beam-cli eph exec mobile beam-api bundle exec rails c'
#alias km='kill $(lsof -t -i:8081) >/dev/null 2>&1 || true'
#alias android-metro-reconnect='adb reverse tcp:8081 tcp:8081'
#alias fixdisplays='displayplacer "id:F51FD2D5-7DF7-41EB-9A30-B6395AF25246 res:1920x1080 hz:240 color_depth:7 scaling:off origin:(0,0) degree:0" "id:0E99A0E6-7EB3-4007-AC29-45572CC9408F res:1080x1920 hz:144 color_depth:7 scaling:on origin:(1920,-409) degree:90"'
#alias dl='AWS_PROFILE=beam-tech-org-services aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 932532311803.dkr.ecr.us-east-1.amazonaws.com'
#
## Helpful navigation
#alias cdbrush='cd ~/repos/beam-brush-unified'
#alias cdauth='cd ~/repos/authentication-server'
#alias cdapi='cd ~/repos/beam-api'
#alias cdwork='cd ~/workspace'
#alias cdjs='cd ~/repos/js-frontend'
#alias cdbf='cd ~/repos/beam-frontend'
#alias cdobs='cd ~/workspace/My\ Vault'
#alias cdquotes='cd ~/repos/quotes-server'
#alias cdperks='cd ~/repos/perks-server'
#
## Git
#alias gco='git checkout'
#alias gcob='git checkout -b'
#alias grh='git reset --hard'
#
#
## CPU Temp
#alias temp='sudo powermetrics --samplers smc |grep -i "CPU die temperature"'

# BrowserStacks
bslist() {
   curl -u "brandonminner_pw1mKf:pha8hbtoCzQXcdJRsuTi" -X GET "https://api-cloud.browserstack.com/app-automate/recent_group_apps" | jq '. | sort_by(.uploaded_at) | reverse | sort_by(.custom_id)'
}

export PATH="$PATH:$HOME/Users/brandonminner/workspace/My\ Vault/bg2md.rb"

export AWS_DEAULT_PROFILE=beam-tech-org-services

unset GEM_PATH
unset GEM_HOME

unset BASE_DOMAIN


export NATIVE_MYSQL=1

# test
# export PNPM_HOME="/Users/brandonminner/Library/pnpm"
# export PATH="$PNPM_HOME:$PATH"
# asdf
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /Users/brandonminner/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# pnpm
export PNPM_HOME="/Users/brandonminner/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "/Users/brandonminner/.bun/_bun" ] && source "/Users/brandonminner/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

eval "$(rtx activate zsh)"
