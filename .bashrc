# .bashrc file

# https://gist.github.com/specious/8244801
# Fancy two-line prompt with git integration
#

parse_git_dirty () {
  [[ $(git status 2> /dev/null | tail -1) != "nothing to commit, working tree clean" ]] && echo "*"
}

parse_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

show_git_prompt () {
  git branch 2>/dev/null 1>&2 && echo -e "-( \e[34;1m$(parse_git_branch)\e[34;1m )"
}

if [[ -n $(type -t git) ]] ; then
  PS1="\$(show_git_prompt)"
else
  PS1=
fi

PS1="
\[\e[34;1m\]┌─[`vcgencmd measure_temp | cut -d = -f 2` ➔ \u@\h]
\[\e[34;1m\]├─[\[\e[39;1m\]\w\[\e[34;1m\]]$PS1
\[\e[34;1m\]└:\[\e[0m\]"

PROMPT_DIRTRIM=1
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
