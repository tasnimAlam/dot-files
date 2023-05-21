function rmf --wraps='fzf -m | xargs -I {} rm {}' --description 'alias rmf=ls | fzf -m | xargs -I {} rm {}'
    fzf -m | xargs -I {} rm {} $argv
end
