# Language environment
export LANG=en_US.UTF-8

# pyenv settings
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then
    eval "$(pyenv virtualenv-init -)";
fi

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
