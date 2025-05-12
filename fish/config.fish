if status is-interactive
    # Commands to run in interactive sessions can go here
    eval (ssh-agent -c)
    ssh-add ~/.ssh/id_ed25519
end

export PATH=$PATH:/usr/lib64/ccache:/home/sander/.cargo/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/usr/bin

# Utilities
function grep
    command grep --color=auto $argv
end

# mv, rm, cp
abbr mv 'mv -v'
abbr rm 'rm -v'
abbr cp 'cp -v'

function pt
    cd ~/pt-platinum
end

function upload_regulus
    set -x device_samba $argv
    pt
    bob firmware-upload-regulus --project samba
end
set -x EMSDK_QUIET 1
function wendy
    pt
    ./wendy
end

function pgit
    ssh-agent sh -c "ssh-add ~/.ssh/id_ed25519_private; git $argv"
end
alias bob='./bob-docker.sh'
export TERM=xterm
source "/home/sander/emsdk/emsdk_env.fish"
if status is-interactive
    clear
    set fish_greeting
    neofetch
end
