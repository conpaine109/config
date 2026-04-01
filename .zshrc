alias python=python3
export PATH="/Library/Frameworks/Python.framework/Versions/3.12/bin:$PATH"
export CLICOLOR=1
export PS1=$'cjp:\e[0;36m%~\e[0m$ '
export EDITOR='vim'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# [[ -s "/Users/conner.paine/.gvm/scripts/gvm" ]] && source "/Users/conner.paine/.gvm/scripts/gvm"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/conner.paine/Desktop/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/conner.paine/Desktop/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/conner.paine/Desktop/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/conner.paine/Desktop/google-cloud-sdk/completion.zsh.inc'; fi
