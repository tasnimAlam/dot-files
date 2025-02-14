function ls --wraps=eza --description 'alias ls=eza'
  eza --oneline --icons --group-directories-first $argv
end
