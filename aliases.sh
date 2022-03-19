alias list="pacman -Q | fzf"
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
alias soapui="export JAVA_HOME=/usr/lib/jvm/java-8-openjdk/ && soapui"
alias sys="sudo systemctl"
alias v="nvim"
alias g="git"
alias gc="g commit -m"
alias gps="g push"
alias gpl="g pull"
alias ga="g add"
alias gca="ga . && gc"
alias gg="g log --graph --all --oneline"
alias gclean='g remote prune origin && g branch | grep -v -E "(develop|master|main)" | xargs git branch -d'
alias k="kubectl"
alias kc="k config use-context"
alias kcl="k config get-contexts"
alias mk="minikube"
alias top="btop"
alias b="cd .."
alias ipa="ip -c -br address show"
alias code="vscodium"
alias docker="sudo docker"
alias docker-compose="sudo docker-compose"

