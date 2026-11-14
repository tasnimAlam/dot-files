function sudo --description 'sudo, but send a desktop notification when it will ask for a password'
    # sudo -n fails when no valid cached credential exists, i.e. a prompt is coming.
    if not command sudo -n true 2>/dev/null
        notify-send -u critical -a ghostty "Password needed" "sudo $argv[1] — in "(basename $PWD)
    end
    command sudo $argv
end
