#!/usr/bin/env bash
############################
# This script downloads files and installers from internet
############################

if [ $SHELL != '/usr/bin/zsh' ]; then
    chsh -s /usr/bin/zsh leslie
    echo "✔ zsh as default shell for leslie"  
fi

# install oh-my-zsh
[ -d ~/.oh-my-zsh ] || git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
[ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

[ -d ~/.oh-my-zsh/custom/themes/powerlevel10k ] || git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

echo "✔ oh my zsh configured!"

# Download Git Auto-Completion
#curl "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash" > ${HOME}/.git-completion.bash
curl "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh" > ~/.oh-my-zsh/custom/plugins/_git