URL=https://raw.githubusercontent.com/git/git/master/contrib/completion

#Get Completion scripts
mkdir -p ~/.gitutils
curl $URL/git-completion.bash -o ~/.gitutils/git-completion.bash
curl $URL/git-prompt.sh -o ~/.gitutils/git-prompt.sh

#Update bashrc to source scripts
echo "
for file in ~/.gitutils/* ; do
  source \$file
done
" >> ~/.bashrc

# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[33m\]$(__git_ps1 " (%s)")\[\033[00;39m\]\$ '
# PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(__git_ps1 " (%s)")\$ '

