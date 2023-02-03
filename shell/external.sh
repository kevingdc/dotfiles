# Language environment
export LANG=en_US.UTF-8

export AWS_DEFAULT_REGION=ap-southeast-1

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH="$PATH:$(yarn global bin)"

# Secrets
source ~/.secrets/secrets.sh
