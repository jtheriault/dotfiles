BASHRC_DIR=~/.bashrc.d/

dotfiles() {
    case "$1" in
        "upgrade" )
            _dotfiles_track
            pushd ~/ >> /dev/null
            git pull
            git submodule init
            git submodule update
            popd >> /dev/null
            _dotfiles_notrack
            ;;
        "notrack" )
            _dotfiles_notrack
            ;;
        "track" )
            _dotfiles_track
            ;;
        "extend" )
            _dotfiles_extend $2
            ;;
        * )
            printf "Unknown option: $1\n\n"
            printf "Usage: dotfiles <cmd> [args]\n\n"
            printf "\textend\t\tSource the .bashrc in the argument directory if present; otherwise add it to path\n"
            printf "\tnotrack\t\tDisable git tracking\n"
            printf "\ttrack\t\tEnable git tracking\n"
            printf "\tupgrade\t\tGet the latest from git\n"
            echo
            ;;
    esac
}

_dotfiles_extend() {
    EXTENSION_PATH=$1
    for EXTENSION in $(find $EXTENSION_PATH -maxdepth 1 -type d);
    do
        # Use custom loader if available
        if [ -f $EXTENSION/.bashrc ]; then
            source $EXTENSION/.bashrc
        # otherwise just add it to the path
        else
            PATH=$PATH:$EXTENSION
        fi
    done
}

_dotfiles_notrack() {
    if [ -d ~/.git ]; then
        mv ~/.git ~/.git.inactive
    fi
}

_dotfiles_track() {
    if [ -d ~/.git.inactive ]; then
        mv ~/.git.inactive ~/.git
    fi
}

source_bashrc_dir() {
    BASHRC_DIR="$1"
    for bashrc in "$BASHRC_DIR"/*
    do
        source $bashrc
    done
}

source_bashrc_dir "$BASHRC_DIR"
