#!/usr/bin/env bash
############################
# This script downloads files and installers from internet
############################

if [ $SHELL != '/usr/bin/zsh' ]; then
    sudo usermod -s "$(type -P zsh)" "$(whoami)"
    echo "✔ [zsh] as default shell for leslie"  
fi
# install tmux
if [ -d "${HOME}/.tmux/plugins/tpm" ]; then
    echo "✔ [tmux][plugins] pulling latest changes"
    cd ${HOME}/.tmux/plugins/tpm && git pull origin $(git rev-parse --abbrev-ref HEAD)
    echo "✔ [tmux][plugins] Configured!"
else
    git clone https://github.com/tmux-plugins/tpm "${HOME}/.tmux/plugins/tpm"
fi
# install gnome-terminal themes
export TERMINAL=gnome-terminal
terminal_install_dir="${HOME}/gogh"
if [ -d "${terminal_install_dir}" ]; then
    echo "✔ [gnome-terminal] pulling latest changes"
    cd $terminal_install_dir && git pull origin $(git rev-parse --abbrev-ref HEAD)
    echo "✔ [gnome-terminal] Configured!"
else
    echo "[gnome-terminal] Configure"
    rm -rf "$terminal_install_dir"  && mkdir -p "$terminal_install_dir"
    git clone https://github.com/Mayccoll/Gogh.git "$terminal_install_dir"
    echo "✔ [gnome-terminal] Configured One Dark"
    "$terminal_install_dir/themes/one-dark.sh"
    echo "✔ [gnome-terminal] Configured Nord"
    "$terminal_install_dir/themes/nord.sh"
fi
# install oh-my-zsh
ZSH="${HOME}/.oh-my-zsh"
ZSH_CUSTOM="${ZSH}/custom"
[ -d "${ZSH}" ] || git clone https://github.com/robbyrussell/oh-my-zsh.git "${ZSH}"
declare -A plugins=(
    ["plugins/fast-syntax-highlighting"]="https://github.com/zdharma/fast-syntax-highlighting"
    ["plugins/zsh-syntax-highlighting"]="https://github.com/zsh-users/zsh-syntax-highlighting.git"
    ["plugins/zsh-autosuggestions"]="https://github.com/zsh-users/zsh-autosuggestions"
    ["plugins/zsh-completions"]="https://github.com/zsh-users/zsh-completions"
    ["plugins/you-should-use"]="https://github.com/MichaelAquilina/zsh-you-should-use"
    ["themes/powerlevel10k"]="https://github.com/romkatv/powerlevel10k"
)
for path in "${!plugins[@]}"; do
    if [[ ! -d "${ZSH_CUSTOM}/$path" ]]; then
        git clone "${plugins[$path]}" "${ZSH_CUSTOM}/$path"
    else
        echo "✔ [oh-my-zsh][${path}] pulling latest changes"
        cd "${ZSH_CUSTOM}/$path" && git pull origin $(git rev-parse --abbrev-ref HEAD)
    fi
done

echo "✔ [oh-my-zsh][Plugins] Configured!"

# Install keepass 2
if type -p keepass2 > /dev/null; then
    echo "✔ [Keepass] Installed!"
else
    echo "✔ [Keepass] Configure"
    sudo apt-add-repository ppa:jtaylor/keepass -y
    sudo apt-get install keepass2 -y
fi