alias list="dnf list --installed | fzf"
alias l="lsd -l -F --size short --group-dirs first"
alias ls="ls --color"
alias t="lsd --group-dirs first --tree"
alias la="l -A"
alias lss="l --total-size"
alias npm-reset="rm node_modules package-lock.json && npm i"
alias p="echo $PWD"
alias ping="ping -c 5"
alias q="exit"
alias rm="rm -rf"
alias cp="cp -rv"
alias size="du -shc"
alias sys="sudo systemctl"
alias v="nvim"
alias g="git"
alias gc="g commit -m"
alias gch="g checkout"
alias gsw="g switch"
alias gst="g status"
alias gps="g push"
alias gpl="g pull"
alias ga="g add"
alias gca="ga . && gc"
alias gb="g branch"
alias gg="g log --graph --all --oneline"
alias gclean='g remote prune origin && g branch | grep -v -E "(develop|master|main)" | xargs git branch -d'
alias n="npm"
alias ni="n i"
alias nr="n run"
alias k="kubectl"
alias kg="k get"
alias kd="k describe"
alias kl="k logs"
alias kcu="k config use-context"
alias kc="k config get-contexts"
alias mk="minikube"
alias top="btop"
alias b="cd .."
alias ipa="ip -c -br address show"
alias code="codium"
alias docker="podman"

