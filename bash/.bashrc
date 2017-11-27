# Avoid source loops by only processing this file once
if [[ ! "$BASHRC_LOADED" ]]; then
  [[ -f ~/.bash_profile ]] && source ~/.bash_profile
fi

export BASHRC_LOADED=1

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
