# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git composer)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Newline in prompt
PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}
\$ '

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias sourceconfig="source ~/.zshrc"

export B4SH_PATH=~/_src/b4sh
source $B4SH_PATH/all.sh

alias gb="git branch -av"
alias my="mysql -uroot -proot"
alias wr="cd ~/_work/card.com/webroot"
alias wrc="cd ~/_work/card.com/webroot-clean"
alias wrr="cd ~/_work/card.com/webroot-review"
alias app="cd ~/_work/cardapp"
alias jenks="cd ~/_work/jenkity_scripts/"

# Update search index
alias upsi="drush vset search_cron_limit 5000 && drush -v cron"

# When did we last get db's from dropbox?
alias lastbak="ls -l ~/Dropbox\ \(CARD.COM\)/card_db_backups | grep sanitize | cut -d ' ' -f 8-15"

alias sincelastdeploy="git fetch && git log origin/master..origin/chp-working  | grep 'pull request' && git log origin/master..origin/chp-working  | grep 1337"
alias isincelastdeploy="git diff origin/master..origin/chp-working --name-only | grep .install | xargs -I__INSTALL__ git diff origin/master..origin/chp-working __INSTALL__ | cat"
alias diffdeploy="git diff origin/master..origin/chp-working"

# Tail the debug file.
alias readdd="tail -f /tmp/drupal_debug.txt"
# Tail the debug file.
function wipedd {
  FILE=/tmp/drupal_debug.txt
  touch $FILE
  chmod 777 $FILE
  now=`date`
  echo "### START READ $now ###" > $FILE
}

# Sync card.com environments.
function cardsync {
  ~/_work/card.com/sync.sh $1
}

# =======
# = Git =
# =======

# Checkout remote branch to local.
function fetchbranch {
  git fetch && git checkout origin/$1 -b $1
}

# Git kaleidescope integration.
function gdk {
  git difftool -y -t Kaleidoscope $1
}

# ==========
# = Drupal =
# ==========

# Variable dump expression.
function vd {
  if [[ $2 != '' ]]; then
    var=$2
    da=$1
  else
    da=''
    var=$1
  fi

  drush $da ev "var_dump($var);"
}

# Login as superuser
function uliadmin {
  foo=`drush $1 uli --browser=0 19`
  echo $foo | pbcopy && echo $foo
}

# Login as normal user
function ulinormal {
  foo=`drush $1 uli --browser=0 42888`
  echo $foo | pbcopy && echo $foo
}

# =======
# = Etc =
# =======

alias serve="python -m SimpleHTTPServer 8000"
alias drupalcs="phpcs --standard=Drupal --extensions=php,module,inc,install,test,profile,theme"
