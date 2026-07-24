function xc --wraps='xclip -set c <' --description 'alias xc=xclip -set c <'
  xclip -set c < $argv; 
end
