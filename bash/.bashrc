# Avoid source loops by only processing this file once
if [[ ! "$BASHRC_LOADED" ]]; then
  [[ -f ~/.bash_profile ]] && source ~/.bash_profile
fi

export BASHRC_LOADED=1

# added by travis gem
[ -f /home/azzamsya/.travis/travis.sh ] && source /home/azzamsya/.travis/travis.sh
