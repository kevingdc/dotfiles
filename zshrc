# Settings
source ~/.zsh/settings.zsh

# External settings
source ~/.shell/external.sh

# Aliases
source ~/.shell/aliases.sh

# Custom prompt
source ~/.zsh/prompt.zsh

# Plugins
source ~/.zsh/plugins.zsh

# Completions
source ~/.zsh/completions.zsh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
