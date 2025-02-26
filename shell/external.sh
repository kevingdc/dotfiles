# Language environment
export LANG=en_US.UTF-8

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# export PATH="$PATH:$(yarn global bin)"

if (( $+commands[pyenv] )); then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  export PYENV_VIRTUALENV_DISABLE_PROMPT=1
fi


# Secrets
if [ -f ~/.secrets/secrets.sh ]; then
  source ~/.secrets/secrets.sh
fi

if (( $+commands[direnv] )); then
  eval "$(direnv hook zsh)"
fi
