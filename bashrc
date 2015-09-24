if test -f ~/.rvm/scripts/rvm; then
[ "$(type -t rvm)" = "function" ] || source ~/.rvm/scripts/rvm
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

alias sislam='cd /home/usuario/sislam2_0; rvm use ree-1.8.7-2012.02; rvm gemset use sislam2;'
alias mead='cd /home/usuario/mead; rvm use ruby-2.2.1; rvm gemset use mead;'
alias meadp='cd /home/usuario/mead_project; rvm use ruby-2.2.2; rvm gemset use mead_project;'
