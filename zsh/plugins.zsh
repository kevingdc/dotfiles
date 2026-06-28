# Fast Syntax Highlighting
source ~/.zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Mise
eval "$(mise activate zsh)"
export MISE_POETRY_VENV_AUTO=1

# Atuin
echo 'eval "$(atuin init zsh)"' >> ~/.zshrc
