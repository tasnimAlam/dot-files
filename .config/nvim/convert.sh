LUA_CONFIG=init.lua
VIM_CONFIG=init.vim

if [[ -f "$LUA_CONFIG" ]]; then
  mv test_init.vim $VIM_CONFIG 
  mv $LUA_CONFIG test_init.lua;
else 
  mv test_init.lua $LUA_CONFIG 
  mv $VIM_CONFIG test_init.vim;
fi;
