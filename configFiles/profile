if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

PATH="$HOME/.gem/ruby/2.3.0/bin:$HOME/bin:$HOME/.local/bin:$PATH"
PATH="$HOME/.composer/vendor/bin:$PATH"
PATH="$HOME/cross/usr/bin:$PATH"
PATH="$PATH:/usr/local/go/bin"
PATH="$PATH:/home/vam/afl-2.52b"
PROMPT="%{$fg[white]%}%n@%{$fg[green]%}%m%{$reset_color%} ${PROMPT}"
export AFL_PATH='/home/vam/afl-2.52b'
