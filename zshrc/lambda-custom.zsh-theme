PROMPT='λ %~/ $(git_prompt_info)%{$reset_color%}'
NEWLINE=$'\n'
#PROMPT='λ %{$fg[yellow]%} [%D{%f/%m/%y} %D{%H:%M:%S}] %~/ $(git_prompt_info)%{$reset_color%}'
#TIMESTAMP = $'%{$fg[yellow]%}[%D{%f/%m/%y} %D{%T}]'
#PROMPT='$TIMESTAMP---${NEWLINE}'$PROMPT
PROMPT='%{$fg[yellow]%}[%D{%f/%m/%y} %D{%T}]${NEWLINE}'$PROMPT

#ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "

