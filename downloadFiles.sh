#!/usr/bin/env bash
############################
# This script downloads files and installers from internet
############################

if [ $SHELL != '/usr/bin/zsh' ]; then
    sudo usermod -s "$(type -P zsh)" "$(whoami)"
    echo "✔ zsh as default shell for leslie"  
fi
# install tmux
[ -d "${HOME}/.tmux/plugins/tpm" ] || git clone https://github.com/tmux-plugins/tpm "${HOME}/.tmux/plugins/tpm"
echo "✔ tmux configured!"
# install gnome-terminal themes
export TERMINAL=gnome-terminal
terminal_install_dir="/tmp/gogh"
info "[gnome-terminal] Configure"
rm -rf "$terminal_install_dir" && mkdir -p "$terminal_install_dir"
git clone https://github.com/Mayccoll/Gogh.git "$terminal_install_dir"
info "[gnome-terminal][configure] One Dark"
"$terminal_install_dir/themes/one-dark.sh"
info "[gnome-terminal][configure] Nord"
"$terminal_install_dir/themes/nord.sh"
# install oh-my-zsh
ZSH="${HOME}/.oh-my-zsh"
ZSH_CUSTOM="${ZSH}/custom"
[ -d "${ZSH}" ] || git clone https://github.com/robbyrussell/oh-my-zsh.git "${ZSH}"
info "[ohmyzsh][configure] Download plugins"
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
    fi
done

echo "✔ oh my zsh configured!"

# Install keepass 2
sudo apt-add-repository ppa:jtaylor/keepass -y
sudo apt-get install keepass2 -y
echo "✔ Keepass installed!"