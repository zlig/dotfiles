# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# System path
export CUDA_HOME=/usr/local/cuda
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64
export PATH=$PATH:$CUDA_HOME/bin
export GRADLE_HOME=/opt/gradle/
export PATH=${GRADLE_HOME}/bin:${PATH}

# Bash settings
export HISTCONTROL=ignoredups
export HISTSIZE=999999
export EDITOR=/usr/bin/vim
export LD_LIBRARY_PATH="/usr/local/lib:/usr/local/lib64"
export GREP_COLOR="7"
export PROMPT_DIRTRIM=3
# export GREP_COLOR="1;34"
# export GREP_COLOR='1;32'
 
# Some applications read the EDITOR variable to determine your favourite text
# editor. :-)
export EDITOR=/usr/bin/vim
 
# Commonly required global variables
export PATH=${WORK}/bin:${PATH}
 
# Displays prompt in color
# -------------------------------------
# Bash Color Chart:
# Black       0;30     Dark Gray     1;30
# Blue        0;34     Light Blue    1;34
# Green       0;32     Light Green   1;32
# Cyan        0;36     Light Cyan    1;36
# Red         0;31     Light Red     1;31
# Purple      0;35     Light Purple  1;35
# Brown       0;33     Yellow        1;33
# Light Gray  0;37     White         1;37
# -------------------------------------
PS1='\[\e[1;31m\]\u@\h: \w>\[\e[0m\] '
alias short-prompt="PS1='\[\e]0;\w\a\]\[\e[1;31m\]\u@\h \[\e[39m\]\w\[\e[0m\] $\n' PROMPT_DIRTRIM=0"

# Terminator Window Title
export PROMPT_COMMAND='echo -en "\033]0;$(kubectl config current-context 2> /dev/null || true)\a"'

# Directories colors when running ls
LS_COLORS=$LS_COLORS:'di=0;34:'
export LS_COLORS

# User specific aliases and functions
alias sudo='sudo -E'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
 
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."
alias ........="cd ../../../../../../.."
alias :q="true" 

alias l='ls -l'
alias ls='ls -F --color=always'
alias ll='ls -l'
alias la='ls -la'
alias lh='ls -lah'
alias vi='vim -O'
alias vim='vim -O'
alias :qa='echo "_o<  quack!"'
alias :wq='echo "_o<  quack!"'
alias :wqa='echo "_o<  quack!"'
 
alias build='make all > ../build.log 2> ../warning.log'
 
alias grep='grep -I -n --colour=auto --exclude *.svn*'
alias grepi='grep -I -i -n --colour=auto'
alias grepa='grep -inRU --colour=auto'
alias grepr='grep -I -r -n --colour=auto'       # recursive version of grep
alias grerp='grepr'
alias egrep='egrep --colour=auto'               # egrep in colors (i.e. grep with regex)
alias grepe='egrep'                             # egrep in colors (i.e. grep with regex)
alias ge='egrep'                                # shorthand for egrep
alias gr='grepr'                                # shorthand for grepr
alias gi='grepi'                                # shorthand for grepi
 
alias dus='du -sckx * | sort -nr | head -n 20'
 
alias findf='find . -type f -iname '
alias f='findf '
alias finddup="find . -type f -exec md5sum '{}' ';' | sort | uniq --all-repeated=separate -w 24 "
alias findlargest='find . -type f -exec du {} \; 2>/dev/null | sort -n | tail -n 10 | xargs -n 1 du -h 2>/dev/null '
 
# Version control tools
alias svn-remove-untracked='svn status | grep \? | awk '"'"'{print $2}'"'"' | xargs rm -rvf'
alias svn-diff='svn diff . | vim -R -'
alias svn-status='svn-colors status '
alias svn-log='svn-colors log -v | less -R -'
alias diffs='svn diff . | vim -R -'             # shows current code changes in color in VI (allows to split window and edit straight away) - using SVN
alias giffs='git diff . | vim -R -'             # shows current code changes in color in VI (allows to split window and edit straight away) - using GIT
 
# shows all GIT branch ordered from latest to oldest changes with last commit time
alias git-branches='for ref in $(git for-each-ref --sort=-committerdate --format="%(refname)" refs/heads/ refs/remotes ); do git log -n1 $ref --pretty=format:"%Cgreen%cr%Creset %C(yellow)%d%Creset %C(bold blue)<%an>%Creset %h %Cred%s%Creset %n" | cat ; done | awk '"'! a["'$0'"]++'"
 
# Pulls updates in every sub-directories to the current one
alias git-pulls="find $CWD -maxdepth 1 -type d -exec bash -c \"[[ -d '{}/.git' ]]; echo '### {} ###' && git --git-dir={}/.git --work-tree={} pull ;\" \;"

alias reload_bashrc="source ~/.bashrc"

# Search
function pdfgrep() {
    local PATTERN="$*"
    find . -iname '*.pdf' -type f -exec bash -c 'pdftotext "{}" - | grep --with-filename --color=always --label="{}" "'"$PATTERN"'" ' \;
}
function search() {
    local PATTERN="$*"
    ag -li "$PATTERN"
    find . -iname '*.pdf' -type f -exec bash -c 'pdftotext "{}" - | grep -i --with-filename --color=always --label="{}" "'"$PATTERN"'" ' \;
}
function cearch() {
    local PATTERN="$*"
    ag -l "$PATTERN"
    find . -iname '*.pdf' -type f -exec bash -c 'pdftotext "{}" - | grep --with-filename --color=always --label="{}" "'"$PATTERN"'" ' \;
}
alias pdfsearch="pdfgrep"

# Common Tips
alias k="kubectl"
alias ic="ibmcloud"
alias hla="helm list --all-namespaces"
alias gp-all="oc get pods --all-namespaces"
alias gp-bad="oc get pods --all-namespaces | \grep -v Running | \grep -v Completed"
