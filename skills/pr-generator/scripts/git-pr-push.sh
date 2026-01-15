#!/bin/zsh

# Script: git-pr-push.zsh
# Description: Wrapper for gh CLI to create a PR using ZSH
# Usage: ./git-pr-push.zsh "PR Title" "PR Body"

# Ensure strict error handling
set -e

TITLE="$1"
BODY="$2"

# 1. Check if 'gh' (GitHub CLI) is installed
if ! command -v gh &> /dev/null; then
    print -P "%F{red}Error: GitHub CLI (gh) is not installed.%f"
    print "Please install it via 'brew install gh' or your package manager."
    exit 1
fi

# 2. Check if arguments are provided
if [[ -z "$TITLE" || -z "$BODY" ]]; then
    print -P "%F{red}Error: Missing arguments.%f"
    print "Usage: ./git-pr-push.zsh \"Title\" \"Body\""
    exit 1
fi

print -P "%F{blue}🚀 Initializing PR Creation...%f"
print "Title: $TITLE"
print "--------------------------------"

# 3. Create the PR using gh CLI
# --web flag is omitted to keep it in terminal, add it if you prefer browser opening
gh pr create --title "$TITLE" --body "$BODY"

# 4. Check status
if [[ $? -eq 0 ]]; then
    print -P "%F{green}✅ Success: Pull Request created successfully!%f"
else
    print -P "%F{red}❌ Error: Failed to create Pull Request.%f"
    exit 1
fi