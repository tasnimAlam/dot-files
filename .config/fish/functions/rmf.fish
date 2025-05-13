function rmf --wraps='fzf -m | xargs -I {} rm {}' --description 'Interactive rm via fzf, including hidden files'
    fzf -m | xargs -I {} rm {} $argv
end

