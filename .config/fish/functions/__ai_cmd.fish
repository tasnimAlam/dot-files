# Turn the text on the command line into a shell command using a local model.
# Type a request in plain English, press Alt+i, review, then Enter.
# Alt+z restores your original request if the answer is wrong.

function __ai_cmd
    set -l req (commandline | string collect)
    test -z "$req"; and return

    # Keep the original request so Alt+z can bring it back
    set -g __ai_last_req $req

    commandline -r "# thinking: $req"
    commandline -f repaint

    set -l sys "You convert a request into ONE fish shell command for Arch Linux.
Output only the command. No explanation, no markdown, no backticks.
Use fish syntax (e.g. (cmd) not \$(cmd), 'and'/'or', set VAR value).
Prefer common tools: fd, rg, find, grep, awk, sed, pacman, systemctl."

    set -l out (ai -s "$sys" "Current directory: $PWD
Request: $req" 2>/dev/null \
        | string match -rv '^\s*```' \
        | string collect \
        | string trim)

    if test -z "$out"
        commandline -r $req
        commandline -f repaint
        echo
        set_color red; echo "ai: no answer (is ollama running?)"; set_color normal
        commandline -f repaint
        return 1
    end

    commandline -r $out
    commandline -f end-of-line repaint
end

function __ai_restore
    set -q __ai_last_req; or return
    commandline -r $__ai_last_req
    commandline -f end-of-line repaint
end
