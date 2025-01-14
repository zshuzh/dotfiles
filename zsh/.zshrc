# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# powerlevel10k
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# fzf
source <(fzf --zsh)

# fzf (config)
export FZF_DEFAULT_COMMAND="fd . $HOME/Desktop $HOME/Developer $HOME/.config"
bindkey -s '^F' 'cd $(fzf)\n' # TODO: use zsh widget to prevent flicker

# aliases (utils)
alias ll="eza -al --icons --group-directories-first"
alias t="tree -L 1 -I node_modules"
alias tt="tree -L 2 -I node_modules"
alias ttt="tree -L 3 -I node_modules"

# aliases (git)
alias gst='git status'
alias ga='git add'
alias gsw='git switch'
alias gco='git checkout'
alias gwip='git add -A; git commit --message "--wip-- [skip ci]"'
alias gunwip='git rev-list --max-count=1 --format="%s" HEAD | grep -q "\--wip--" && git reset HEAD~1'
alias gb='git branch'
alias gc='git commit'
alias gcm='git commit --message'
alias gcam='git commit --all --message'
alias glog='git log --oneline --decorate --graph'

# aliases (directories)
alias ..="cd .."
alias ~="cd ~"
alias dev="cd ~/Developer"
alias des="cd ~/Desktop"
alias doc="cd ~/Documents"

# aliases (config)
alias con="cd ~/.config"
alias zrc="nvim ~/.config/zsh/.zshrc"
alias nrc="cd ~/.config/nvim && nvim ."

# man
export MANPAGER='nvim +Man!'

