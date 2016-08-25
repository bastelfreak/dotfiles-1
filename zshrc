POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_SHOW_CHANGESET=true
source  /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
function pkgcleanup {
    random=$RANDOM
    mkdir /tmp/cleanup-$random
    mv PKGBUILD /tmp/cleanup-$random
    mv *.install /tmp/cleanup-$random
    mv .SRCINFO /tmp/cleanup-$random
    rm -rI *
    mv /tmp/cleanup-$random/*.install .
    mv /tmp/cleanup-$random/PKGBUILD .
    mv /tmp/cleanup-$random/.SRCINFO .
    rmdir /tmp/cleanup-$random
}
zstyle ':completion:*:hosts' hosts 
