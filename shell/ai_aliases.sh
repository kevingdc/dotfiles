# AI aliases

# Start a new tmux session with 4 panes running Claude in the current directory.
# Layout: 2x2 grid (split horizontally then each half split vertically)
# Usage: claudet [session-name]
claudet() {
  local dir="$PWD"
  local name="${1:-claude-$(basename "$dir")}"

  if tmux has-session -t "$name" 2>/dev/null; then
    echo "Session '$name' already exists. Attaching..."
    tmux attach-session -t "$name"
  else
    tmux new-session -d -s "$name" -c "$dir" "claude"   # pane 1 (top-left)
    tmux split-window -h -c "$dir" "claude"  # pane 2 (top-right)
    tmux select-pane -t 0
    tmux split-window -v -c "$dir" "claude"  # pane 3 (bottom-left)
    tmux select-pane -t 2
    tmux split-window -v -c "$dir" "claude"  # pane 4 (bottom-right)
    tmux select-pane -t 0
    tmux attach-session -t "$name"
  fi
}

# Start a new tmux session with 4 panes running GitHub Copilot Chat in the current directory.
# Layout: 2x2 grid (split horizontally then each half split vertically)
# Usage: copilott [session-name]
copilott() {
  local dir="$PWD"
  local name="${1:-copilot-$(basename "$dir")}"

  if tmux has-session -t "$name" 2>/dev/null; then
    echo "Session '$name' already exists. Attaching..."
    tmux attach-session -t "$name"
  else
    tmux new-session -d -s "$name" -c "$dir" "copilot"   # pane 1 (top-left)
    tmux split-window -h -c "$dir" "copilot"  # pane 2 (top-right)
    tmux select-pane -t 0
    tmux split-window -v -c "$dir" "copilot"  # pane 3 (bottom-left)
    tmux select-pane -t 2
    tmux split-window -v -c "$dir" "copilot"  # pane 4 (bottom-right)
    tmux select-pane -t 0
    tmux attach-session -t "$name"
  fi
}

# Generate a commit message using Claude Code CLI, then commit and push.
# Stages all unstaged changes if nothing is staged.
# Usage: gac
function gac() {
  if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    echo "Error: Not in a git repository"
    return 1
  fi

  # Stage everything if nothing is staged
  if [[ -z "$(git diff --cached --name-only)" ]]; then
    echo "No staged changes found. Staging all changes..."
    git add -A
  fi

  local diff_stat diff_content
  diff_stat=$(git diff --cached --stat)
  diff_content=$(git diff --cached)

  if [[ -z "$diff_content" ]]; then
    echo "Nothing to commit."
    return 1
  fi

  # Truncate very large diffs to avoid context limits (~100k chars ≈ 25k tokens)
  if [[ ${#diff_content} -gt 100000 ]]; then
    diff_content="${diff_content:0:100000}
... [diff truncated]"
  fi

  local prompt
  prompt="Generate a git commit message for the following staged changes.

Commit message format rules:
- First line: <type>: <subject> (MUST be 50 characters or fewer total)
  Valid types: feat, fix, refactor, style, docs, test, perf, revert, build, ci, chore
- Blank line after the subject
- Optional body: explain WHY the change is being made (wrap lines at 72 chars)
- Optional footer: ticket links or references

Additional rules:
- Output ONLY the raw commit message text — no markdown, no code blocks, no explanation
- Use imperative mood (\"Add feature\" not \"Added feature\")
- Capitalize the subject line
- Do not end the subject line with a period

Staged changes:
${diff_stat}

${diff_content}"

  echo "Generating commit message with Claude..."
  local commit_msg stderr_file
  stderr_file=$(mktemp -t gac_err.XXXXXX)
  commit_msg=$(printf '%s' "$prompt" | claude -p 2>"$stderr_file")
  local exit_code=$?

  if [[ -z "$commit_msg" || $exit_code -ne 0 ]]; then
    echo "Error: Claude failed to generate a commit message"
    [[ -s "$stderr_file" ]] && cat "$stderr_file" >&2
    rm -f "$stderr_file"
    return 1
  fi
  rm -f "$stderr_file"

  echo ""
  echo "Generated commit message:"
  echo "───────────────────────────────────────"
  echo "$commit_msg"
  echo "───────────────────────────────────────"
  echo ""

  git commit -m "$commit_msg"
  git push
}
