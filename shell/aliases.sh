# ls alias
alias ls="ls -F -G"

# Pyenv alias
alias pya="pyenv activate"

alias cl="printf '\33c\e[3J'"

alias enable-zscaler="open -a /Applications/Zscaler/Zscaler.app --hide; sudo find /Library/LaunchDaemons -name '*zscaler*' -exec launchctl load {} \;"
alias disable-zscaler="find /Library/LaunchAgents -name '*zscaler*' -exec launchctl unload {} \;;sudo find /Library/LaunchDaemons -name '*zscaler*' -exec launchctl unload {} \;;find /Library/LaunchAgents -name '*snapcomms*' -exec launchctl unload {} \;;sudo find /Library/LaunchDaemons -name '*snap*' -exec launchctl unload {} \;"

alias nr="npm run"

# Git aliases
source ~/.shell/git_aliases.sh

# Docker aliases
source ~/.shell/docker_aliases.sh

# Node aliases
source ~/.shell/node_aliases.sh

# MongoDB aliases
source ~/.shell/mongodb_aliases.sh

# PostgreSQL aliases
source ~/.shell/postgresql_aliases.sh
