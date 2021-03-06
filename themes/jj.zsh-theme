# jj.zsh-theme
#
# Author: Jason Jacobs
# URL: http://showli.st/
# Repo: https://github.com/rootedbox/oh-my-jsh
# 
# Created on:		June 19, 2012



if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# primary prompt
PROMPT='$FG[032]%~%D{/}%{$reset_color%}'
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'


# color vars
eval my_gray='$FG[237]'
eval my_orange='$FG[214]'
eval my_red='$FG[154]'

RPROMPT='$(git_prompt_info)$FG[075][%m $FG[105]%(!.#.)$FG[075]]%{$reset_color%}'

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075]["
ZSH_THEME_GIT_PROMPT_CLEAN=" $my_red✔%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" $my_orange✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075]]$FG[032]"
