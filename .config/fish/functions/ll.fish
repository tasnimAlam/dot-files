function ll --wraps='exa -1 --icons --group-directories-first' --description 'alias ll=exa -1 --icons --group-directories-first'
  exa -1 --icons --group-directories-first $argv; 
end
