# at the top of .zshrc, insert 
# zmodload zsh/zprof
# This will enable the built in profiling.

# =============================================================================
#                                   Variables
# =============================================================================
# Common ENV variables
export TERM="xterm-256color"
export SHELL="/bin/zsh"
export EDITOR="vim"

# Fix Locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# History
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE

#export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'

# color formatting for man pages
export LESS_TERMCAP_mb=$'\e[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;36m'     # begin blink
export LESS_TERMCAP_so=$'\e[1;33;44m'  # begin reverse video
export LESS_TERMCAP_us=$'\e[1;37m'     # begin underline
export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'        # reset underline
export GROFF_NO_SGR=1                  # for konsole and gnome-terminal

export MANPAGER='less -s -M -R +Gg'

# Directory coloring
if [[ $OSTYPE = (darwin|freebsd)* ]]; then
#------------------------------------------------------------->#
	export CLICOLOR="YES" # Equivalent to passing -G to ls.
    export LSCOLORS="exgxdHdHcxaHaHhBhDeaec"
    export LS_OPTIONS='-G'
    export CLICOLOR=true
    export LSCOLORS='exfxcxdxbxGxDxabagacad'#
   [ -d "/opt/local/bin" ] && export PATH="/opt/local/bin:$PATH"
    Prefer GNU version, since it respects dircolors.
   if (( $+commands[gls] )); then
      alias ls='() { $(whence -p gls) -Ctr --file-type --color=auto $@ }'
   else
      alias ls='() { $(whence -p ls) -CFtr $@ }'
   fi
fi

if [[ $OSTYPE = (linux)* ]]; then
    export LS_OPTIONS='--color=auto'
fi

#------------------------------------------------------------->#
# Common aliases
alias rm="rm -v"
alias cp="cp -v"
alias mv="mv -v"
alias ls="clear && ls $LS_OPTIONS -hFtr"
alias ll="ls $LS_OPTIONS -lAhFtr"
alias ccat="pygmentize -O style=monokai -f 256 -g"
alias dig="dig +nocmd any +multiline +noall +answer"

disable -r time       # disable shell reserved word
alias time='time -p ' # -p for POSIX output

# =============================================================================
#                                   Plugins
# =============================================================================
# Check if zplug is installed

[ ! -d ~/.zplug ] && git clone https://github.com/zplug/zplug ~/.zplug
source ~/.zplug/init.zsh

# Load theme
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme, from:github, at:next, as:theme

# Enhanced cd
# zplug "b4b4r07/enhancd", use:init.sh

# # Supports oh-my-zsh plugins and the like
# if [[ $OSTYPE = (linux)* ]]; then
#     zplug "plugins/archlinux",     from:oh-my-zsh, if:"(( $+commands[pacman] ))"
#     zplug "plugins/dnf",           from:oh-my-zsh, if:"(( $+commands[dnf] ))"
#     zplug "plugins/mock",          from:oh-my-zsh, if:"(( $+commands[mock] ))"
# fi

# if [[ $OSTYPE = (darwin)* ]]; then
#     zplug "lib/clipboard",         from:oh-my-zsh
#     zplug "plugins/osx",           from:oh-my-zsh
#     zplug "plugins/brew",          from:oh-my-zsh, if:"(( $+commands[brew] ))"
#     zplug "plugins/macports",      from:oh-my-zsh, if:"(( $+commands[port] ))"
# fi

# zplug "plugins/git",               from:oh-my-zsh, if:"(( $+commands[git] ))"

# zplug "hlissner/zsh-autopair", defer:2
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
# zsh-syntax-highlighting must be loaded after executing compinit command
# and sourcing other plugins
# zplug "zsh-users/zsh-syntax-highlighting", defer:2

# =============================================================================
#                                   Options
# =============================================================================

setopt autocd                   # Allow changing directories without `cd`
setopt append_history           # Dont overwrite history
setopt auto_list
setopt auto_menu
setopt auto_pushd
setopt extended_history         # Also record time and duration of commands.
setopt hist_expire_dups_first   # Clear duplicates when trimming internal hist.
setopt hist_find_no_dups        # Dont display duplicates during searches.
setopt hist_ignore_dups         # Ignore consecutive duplicates.
setopt hist_ignore_all_dups     # Remember only one unique copy of the command.
setopt hist_reduce_blanks       # Remove superfluous blanks.
setopt hist_save_no_dups        # Omit older commands in favor of newer ones.
setopt hist_ignore_space        # Ignore commands that start with space.
setopt inc_append_history
setopt interactive_comments
setopt no_beep
setopt no_hist_beep
setopt no_list_beep
setopt magic_equal_subst
setopt notify
setopt print_eight_bit
setopt print_exit_value
setopt prompt_subst
setopt pushd_ignore_dups
setopt share_history            # Share history between multiple shells
setopt transient_rprompt

# bindkey -v

# Watching other users
#WATCHFMT="%n %a %l from %m at %t."
watch=(notme)         # Report login/logout events for everybody except ourself.
LOGCHECK=60           # Time (seconds) between checks for login/logout activity.
REPORTTIME=5          # Display usage statistics for commands running > 5 sec.

# Key timeout and character sequences
KEYTIMEOUT=2
WORDCHARS='*?_-[]~=./&;!#$%^(){}<>'
zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }

# =============================================================================
#                                Key Bindings
# =============================================================================

# Common CTRL bindings.
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^f" forward-word
bindkey "^b" backward-word
bindkey "^k" kill-line
bindkey "^d" delete-char
bindkey "^y" accept-and-hold
bindkey "^w" backward-kill-word
bindkey "^u" backward-kill-line
bindkey "^R" history-incremental-pattern-search-backward
bindkey "^F" history-incremental-pattern-search-forward

# Do not require a space when attempting to tab-complete.
bindkey "^i" expand-or-complete-prefix

# =============================================================================
#                                   Startup
# =============================================================================

[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH"

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
    printf "Install plugins? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# if zplug check "zsh-users/zsh-syntax-highlighting"; then
#     typeset -gA ZSH_HIGHLIGHT_STYLES ZSH_HIGHLIGHT_PATTERNS
#     ZSH_HIGHLIGHT_STYLES[default]='none'
#     ZSH_HIGHLIGHT_STYLES[cursor]='fg=yellow'
#     ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=grey'
#     ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=yellow'
#     ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan'
#     ZSH_HIGHLIGHT_STYLES[builtin]='fg=green'
#     ZSH_HIGHLIGHT_STYLES[function]='fg=green'
#     ZSH_HIGHLIGHT_STYLES[command]='fg=green'
#     ZSH_HIGHLIGHT_STYLES[precommand]='fg=green'
#     ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=yellow'
#     ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=green'
#     ZSH_HIGHLIGHT_STYLES[path]='fg=grey'
#     ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=grey,underline'
#     ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=white'
#     ZSH_HIGHLIGHT_STYLES[path_approx]='fg=white'
#     ZSH_HIGHLIGHT_STYLES[globbing]='none'
#     ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=green'
#     ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=blue'
#     ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=blue'
#     ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='none'
#     ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=magenta'
#     ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=magenta'
#     ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=cyan'
#     ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=cyan'
#     ZSH_HIGHLIGHT_STYLES[redirection]='fg=magenta'
#     ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=cyan,bold'
#     ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=green,bold'
#     ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=magenta,bold'
#     ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=yellow,bold'
#     ZSH_HIGHLIGHT_STYLES[assign]='none'
#     ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')
#     ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor line)
# fi

if zplug check "zsh-users/zsh-autosuggestions"; then
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=88'
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=88'
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=88'
fi

if zplug check "bhilburn/powerlevel9k"; then
	DEFAULT_USER=$USER
    DEFAULT_FOREGROUND=8 DEFAULT_BACKGROUND=237 PROMPT_COLOR=237
    DEFAULT_COLOR="clear"
    P9K_STATUS_VERBOSE=true
    P9K_DIR_SHORTEN_LENGTH=1
    P9K_DIR_OMIT_FIRST_CHARACTER=false
    P9K_CONTEXT_ALWAYS_SHOW=true
    P9K_CONTEXT_ALWAYS_SHOW_USER=true
    P9K_LEFT_SUBSEGMENT_SEPARATOR_ICON="%F{232}\uE0BD%f "
    P9K_RIGHT_SUBSEGMENT_SEPARATOR_ICON="%F{232}\uE0BD%f "
    P9K_PROMPT_ON_NEWLINE=true
    P9K_RPROMPT_ON_NEWLINE=false
    P9K_STATUS_VERBOSE=true
    P9K_STATUS_CROSS=true
    P9K_PROMPT_ADD_NEWLINE=true
    P9K_MULTILINE_FIRST_PROMPT_PREFIX_ICON="%F{$PROMPT_COLOR}%f"
    # P9K_MULTILINE_LAST_PROMPT_PREFIX_ICON="%F{$PROMPT_COLOR}➜ %f"
    P9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir dir_writable vcs)
    P9K_RIGHT_PROMPT_ELEMENTS=()
    P9K_MODE='nerdfont-complete'
    P9K_VCS_GIT_GITHUB_ICON=""
    P9K_VCS_GIT_BITBUCKET_ICON=""
    P9K_VCS_GIT_GITLAB_ICON=""
    P9K_VCS_GIT_ICON=""
    P9K_VCS_CLEAN_BACKGROUND="$DEFAULT_BACKGROUND"
    P9K_VCS_MODIFIED_BACKGROUND="$DEFAULT_BACKGROUND"
    P9K_VCS_UNTRACKED_BACKGROUND="$DEFAULT_BACKGROUND"
    P9K_VCS_CLEAN_FOREGROUND="65"
    P9K_VCS_MODIFIED_FOREGROUND="172"
    P9K_VCS_UNTRACKED_FOREGROUND="088"
    P9K_DIR_HOME_BACKGROUND="$DEFAULT_BACKGROUND"
    P9K_DIR_HOME_SUBFOLDER_BACKGROUND="$DEFAULT_BACKGROUND"
    P9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="$DEFAULT_BACKGROUND"
    P9K_DIR_DEFAULT_BACKGROUND="$DEFAULT_BACKGROUND"
    P9K_DIR_ETC_BACKGROUND="$DEFAULT_BACKGROUND"
    P9K_DIR_NOT_WRITABLE_BACKGROUND="$DEFAULT_BACKGROUND"
    P9K_DIR_HOME_FOREGROUND="0"
    P9K_DIR_HOME_SUBFOLDER_FOREGROUND="0"
	P9K_DIR_DEFAULT_FOREGROUND="0"
    P9K_DIR_ETC_FOREGROUND="0"
    P9K_DIR_NOT_WRITABLE_FOREROUND="0"
    P9K_ROOT_INDICATOR_BACKGROUND="$DEFAULT_BACKGROUND"
    P9K_ROOT_INDICATOR_FOREGROUND="red"
    P9K_STATUS_OK_BACKGROUND="$DEFAULT_BACKGROUND"
    P9K_STATUS_ERROR_BACKGROUND="$DEFAULT_BACKGROUND"
    P9K_STATUS_OK_FOREGROUND="28"
    P9K_STATUS_ERROR_FOREGROUND="088"
    P9K_TIME_BACKGROUND="$DEFAULT_BACKGROUND"
    P9K_TIME_ICON="\uF017" # 
    P9K_TIME_FOREGROUND="183"
    P9K_COMMAND_EXECUTION_TIME_BACKGROUND="$DEFAULT_BACKGROUND"
    P9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
    P9K_COMMAND_EXECUTION_TIME_PRECISION=1
    P9K_BACKGROUND_JOBS_BACKGROUND="$DEFAULT_BACKGROUND"
    P9K_BACKGROUND_JOBS_FOREGROUND="123"
    P9K_USER_DEFAULT_BACKGROUND="$DEFAULT_BACKGROUND"
    P9K_USER_SUDO_BACKGROUND="$DEFAULT_BACKGROUND"
    P9K_USER_ROOT_BACKGROUND="$DEFAULT_BACKGROUND"
    P9K_USER_DEFAULT_ICON="\uF415" # 
    # P9K_USER_ROOT_ICON=$'\uFF03' # ＃
    P9K_USER_ROOT_ICON="\uF09C"
    P9K_CONTEXT_TEMPLATE="\uF109 %m"
    P9K_CONTEXT_DEFAULT_FOREGROUND="0"
    P9K_CONTEXT_DEFAULT_BACKGROUND="$DEFAULT_BACKGROUND"
    P9K_CONTEXT_SUDO_BACKGROUND="$DEFAULT_BACKGROUND"
    P9K_CONTEXT_SUDO_FOREGROUND="123"
    P9K_CONTEXT_REMOTE_BACKGROUND="$DEFAULT_BACKGROUND"
    P9K_CONTEXT_REMOTE_FOREGROUND="123"
    P9K_CONTEXT_REMOTE_SUDO_BACKGROUND="$DEFAULT_BACKGROUND"
    P9K_CONTEXT_REMOTE_SUDO_FOREGROUND="123"
    P9K_CONTEXT_ROOT_BACKGROUND="$DEFAULT_BACKGROUND"
    P9K_CONTEXT_ROOT_FOREGROUND="0"
    P9K_HOST_LOCAL_BACKGROUND="$DEFAULT_BACKGROUND"
    P9K_HOST_REMOTE_BACKGROUND="$DEFAULT_BACKGROUND"
    P9K_HOST_LOCAL_ICON=" \uF109 " # 
    P9K_HOST_REMOTE_ICON="\uF489 "  # 
    P9K_SSH_ICON="\uF489 "  # 
    P9K_SSH_BACKGROUND="$DEFAULT_BACKGROUND"
    P9K_SSH_FOREGROUND="212"
    P9K_OS_ICON_BACKGROUND="$DEFAULT_BACKGROUND"
    P9K_OS_ICON_FOREGROUND="0"
    
    #DEFAULT_COLOR=$DEFAULT_FOREGROUND
    #P9K_SHORTEN_STRATEGY="truncate_right"
    #P9K_CONTEXT_TEMPLATE="\uF109 %m"
    #P9K_LEFT_SUBSEGMENT_SEPARATOR_ICON="%F{$(( $DEFAULT_BACKGROUND - 2 ))}|%f"
    #P9K_RIGHT_SUBSEGMENT_SEPARATOR_ICON="%F{$(( $DEFAULT_BACKGROUND - 2 ))}|%f"
    #P9K_LEFT_SUBSEGMENT_SEPARATOR_ICON="%F{$DEFAULT_BACKGROUND}\ue0b0%f"
    #P9K_RIGHT_SUBSEGMENT_SEPARATOR_ICON="%F{$DEFAULT_BACKGROUND}\ue0b2%f"
    # P9K_RIGHT_SUBSEGMENT_SEPARATOR_ICON="%F{000}%f"
    # P9K_LEFT_SUBSEGMENT_SEPARATOR_ICON="%F{000}／%f" # 
    # P9K_RIGHT_SUBSEGMENT_SEPARATOR_ICON="%F{000}／%f" #
    # P9K_LEFT_SUBSEGMENT_SEPARATOR_ICON="%F{000}／%f" #
    # P9K_LEFT_SUBSEGMENT_SEPARATOR_ICON="%F{$(( $DEFAULT_BACKGROUND - 3 ))}／%f"
    # P9K_RIGHT_SUBSEGMENT_SEPARATOR_ICON="%F{$(( $DEFAULT_BACKGROUND - 3 ))}／%f"
    # P9K_LEFT_SUBSEGMENT_SEPARATOR_ICON="%F{$DEFAULT_FOREGROUND}\uE0B0%f"
    # P9K_RIGHT_SUBSEGMENT_SEPARATOR_ICON="%F{$DEFAULT_FOREGROUND}\uE0B3%f"
    # P9K_LEFT_SEGMENT_SEPARATOR_ICON="\uE0B4"
    # P9K_RIGHT_SEGMENT_SEPARATOR_ICON="\uE0B6"
    P9K_LEFT_SEGMENT_SEPARATOR_ICON="\uE0BC\u200A"
    P9K_RIGHT_SEGMENT_SEPARATOR_ICON="\u200A\uE0BA"
    #P9K_LEFT_SEGMENT_SEPARATOR_ICON="\uE0BC"
    #P9K_RIGHT_SEGMENT_SEPARATOR_ICON="\uE0BA"
    #P9K_LEFT_SEGMENT_SEPARATOR_ICON="%F{$DEFAULT_BACKGROUND}\uE0BC%f"
    #P9K_RIGHT_SEGMENT_SEPARATOR_ICON="%F{$DEFAULT_BACKGROUND}\uE0BA%f"
    #P9K_MULTILINE_LAST_PROMPT_PREFIX_ICON="%F{$PROMPT_COLOR}⇢ ➜  %f"
    P9K_MULTILINE_LAST_PROMPT_PREFIX_ICON="%F{$PROMPT_COLOR}⥂⎇⎇⥱  %f"
    # P9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir_writable dir vcs)
    # P9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time ssh)
    #P9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir_writable dir_joined vcs)
    #P9K_LEFT_PROMPT_ELEMENTS=(context dir_writable dir_joined vcs)
    #P9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator exec_time background_jobs time)
    #P9K_VCS_UNTRACKED_FOREGROUND="012"
    #P9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="red"
    #P9K_TIME_FORMAT="%D{%H:%M:%S \uf017}" #  Jun 15  09:32
    #P9K_TIME_BACKGROUND="$(( $DEFAULT_BACKGROUND - 2 ))"
    #P9K_USER_DEFAULT_FOREGROUND="cyan"
    #P9K_COMMAND_EXECUTION_TIME_FOREGROUND="183"
    #P9K_USER_SUDO_FOREGROUND="magenta"
    #P9K_USER_ROOT_FOREGROUND="red"
    #P9K_CONTEXT_TEMPLATE="\uF109 %m"
    #P9K_CONTEXT_DEFAULT_FOREGROUND="$DEFAULT_FOREGROUND"
    #P9K_CONTEXT_REMOTE_FOREGROUND="$DEFAULT_FOREGROUND"
    #P9K_CONTEXT_SUDO_FOREGROUND="$DEFAULT_FOREGROUND"
    #P9K_CONTEXT_REMOTE_SUDO_FOREGROUND="$DEFAULT_FOREGROUND"
    #P9K_CONTEXT_ROOT_FOREGROUND="$DEFAULT_FOREGROUND"
    #P9K_HOST_LOCAL_FOREGROUND="cyan"
    #P9K_HOST_REMOTE_FOREGROUND="magenta"
    #P9K_SSH_BACKGROUND="$(( $DEFAULT_BACKGROUND - 2 ))"
    #P9K_OS_ICON_BACKGROUND="$(( $DEFAULT_BACKGROUND - 2 ))"
    #P9K_SHOW_CHANGESET=true

fi

# Then, source plugins and add commands to $PATH
zplug load

# =============================================================================
#                                 Completions
# =============================================================================
zstyle ':completion:' completer _complete _match _approximate
zstyle ':completion:' group-name ''
#zstyle ':completion:' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:' use-cache true
zstyle ':completion:' verbose yes
zstyle ':completion::default' menu select=2
zstyle ':completion::descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:options' description 'yes'

# case-insensitive (uppercase from lowercase) completion
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# process completion
#zstyle ':completion:*:processes' command 'ps -au$USER'
#zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"

# zstyle
zstyle ':completion:*' completer _expand _complete _ignored _approximate
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '%U%F{yellow}%d%f%u'
#zstyle ':completion:*:*:git:*' script ~/.git-completion.sh

zstyle ':completion:*' rehash true
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''

# case-insensitive (all), partial-word and then substring completion
zstyle ":completion:*" matcher-list \
    "m:{a-zA-Z}={A-Za-z}" \
    "r:|[._-]=* r:|=*" \
    "l:|=* r:|=*"

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}"


[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# vim: ft=zsh sw=4 sts=4 et

# At the end of .zshrc insert 
# zprof
