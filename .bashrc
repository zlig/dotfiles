alias reload_bashrc="source ~/.bashrc"

# Search
function pdfgrep() {
    local PATTERN="$*"
    find . -iname '*.pdf' -type f -exec bash -c 'pdftotext "{}" - | grep --with-filename --color=always --label="{}" "'"$PATTERN"'" ' \;
}
function search() {
    local PATTERN="$*"
    ag -li "$PATTERN"
    find . -iname '*.pdf' -type f -exec bash -c 'pdftotext "{}" - | grep -i --with-filename --color=always --label="{}" "'"$PATTERN"'" ' \;
}
function cearch() {
    local PATTERN="$*"
    ag -l "$PATTERN"
    find . -iname '*.pdf' -type f -exec bash -c 'pdftotext "{}" - | grep --with-filename --color=always --label="{}" "'"$PATTERN"'" ' \;
}
alias pdfsearch="pdfgrep"

# Common Tips
alias k="kubectl"
alias ic="ibmcloud"
alias hla="helm list --all-namespaces"
alias gp-all="oc get pods --all-namespaces"
alias gp-bad="oc get pods --all-namespaces | \grep -v Running | \grep -v Completed"
