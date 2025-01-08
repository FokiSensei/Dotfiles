#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias grep='grep --color=auto'
alias ls='exa -al --color=always --group-directories-first --icons' # my preferred listing
alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons'  # long format
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
alias l.='exa -a | egrep "^\."'
alias mc='mc -b'

PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"
fastfetch
export EDITOR='nvim'
export OH_MY_NEOVIM=/home/alexc/.oh-my-neovim
export OH_MY_NEOVIM_EXTENSIONS="default"
source /home/alexc/.oh-my-neovim/tools/functions.sh
PATH="/bin:$PATH"
PATH="/home/alexc/.node_modules_global/bin:$PATH"
PATH="/home/alexc/.local/bin:$PATH"

eval "$(thefuck --alias)"
