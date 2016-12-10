zsh_detect_virtualization(){
    local virt=$(systemd-detect-virt)
    local color='%F{yellow}'
    if [[ "$virt" == "none" ]]; then
        if [[ "$(ls -di / | grep -o 2)" != "2" ]]; then
            virt="chroot"
            echo -n "%{$color%} $virt"
        else
            ;
        fi
    else
        echo -n "%{$color%} $virt"
    fi
}

zsh_detect_ssh(){
    local color='%F{yellow}'
    if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
        echo -n "%{$color%} ssh"
    fi
}

POWERLEVEL9K_CUSTOM_DETECT_VIRT="zsh_detect_virtualization"
POWERLEVEL9K_CUSTOM_DETECT_SSH="zsh_detect_ssh"
POWERLEVEL9K_CUSTOM_DETECT_VIRT_BACKGROUND="black"
POWERLEVEL9K_CUSTOM_DETECT_SSH_BACKGROUND="black"
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time custom_detect_virt custom_detect_ssh)
POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_SHOW_CHANGESET=true
#source  /home/chris/export/github/powerlevel9k/powerlevel9k.zsh-theme
source  /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
zstyle ':completion:*:hosts' hosts 
