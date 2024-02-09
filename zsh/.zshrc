# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# CodeWhisperer pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh"

# Go
export GOPATH="/Users/gary/go"
export GOROOT="$(brew --prefix golang)/libexec"

# Docker
export DOCKER_DEFAULT_PLATFORM=linux/amd64

# Path
export PATH=$HOME/bin:/usr/local/bin:${GOBIN}:~/scripts:~/.cargo/bin:~/jetbrains:$PATH

# ZSH Installation
export ZSH="/Users/gary/.oh-my-zsh"

# Clip
export DISPLAY=:0

# NVM
ZSH_THEME="spaceship"
plugin+=(git zsh-nvm)
source $ZSH/oh-my-zsh.sh

##### Alias definitions #####

# General
alias o=""
eval $(thefuck --alias)
# ZSH
alias change="code-insiders ~/.zshrc"
# Clipboard
alias clip="pbcopy"
# Git
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"'
alias gunwip='git rev-list --max-count=1 --format="%s" HEAD | grep -q "\--wip--" && git reset HEAD~1'
alias gm="git commit -m"
alias gl="git log --oneline"
alias gc="git checkout"
alias gs="git status"
# Similar to `gunwip` but recursive "Unwips" all recent `--wip--` commits not just the last one
function gunwipall() {
  local _commit=$(git log --grep='--wip--' --invert-grep --max-count=1 --format=format:%H)

  # Check if a commit without "--wip--" was found and it's not the same as HEAD
  if [[ "$_commit" != "$(git rev-parse HEAD)" ]]; then
    git reset $_commit || return 1
  fi
}
# One Password
getpass() { op item get $1 --fields password}
alias signin='eval $(op signin)'
alias listpass='op item list'



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/opt/ruby/bin:$PATH"

export GPG_TTY=$(tty)

# CodeWhisperer post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/gary/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/gary/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/gary/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/gary/google-cloud-sdk/completion.zsh.inc'; fi

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
