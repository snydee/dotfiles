source $HOME/.zshrc-oh-my-zsh-config
export PATH=$HOME/bin:$PATH
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
export WORKON_HOME=$HOME/.virtualenvs
mkdir -p $WORKON_HOME
. $HOME/.pyenv/versions/3.8.5/bin/virtualenvwrapper.sh


alias ll="ls -ltrha"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --history=$HOME/.fzf_history"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'