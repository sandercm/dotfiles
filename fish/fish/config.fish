if status is-interactive
    # Commands to run in interactive sessions can go here
    eval (ssh-agent -c)
    ssh-add ~/.ssh/id_ed25519
end

export PATH=$PATH:/usr/lib64/ccache:/home/sander/.cargo/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/usr/bin

# Utilities
function grep     ; command grep --color=auto $argv ; end

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

function pgit
	ssh-agent sh -c 'ssh-add ~/.ssh/id_ed25519_private; $argv'
end

function wendy
	pt
	./wendy
end

alias bob='./bob-docker.sh'
export TERM=xterm
