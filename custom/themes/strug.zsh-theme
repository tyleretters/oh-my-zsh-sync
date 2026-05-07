# terminal coloring
export CLICOLOR=1
export LSCOLORS=dxFxCxDxBxegedabagacad

local git_branch='$(git_prompt_info)%{$reset_color%}$(git_remote_status)'

PROMPT="%{%F{#F51700}%}╭─%n@%m %{$reset_color%}%{%F{#F51700}%}in %~ %{$reset_color%}${git_branch}
%{%F{#F51700}%}╰\$ %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{%B%F{#F51700}%}on "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%}%{%F{#F51700}%} ✘ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ✔ %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_DETAILED=true
ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_PREFIX="%{%F{#F51700}%}("
ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_SUFFIX="%{%F{#F51700}%})%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE=" +"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE_COLOR=%{%F{#F51700}%}

ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE=" -"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE_COLOR=%{%F{#F51700}%}

