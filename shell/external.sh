# Language environment
export LANG=en_US.UTF-8

# pyenv settings
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then
    eval "$(pyenv virtualenv-init -)";
fi
