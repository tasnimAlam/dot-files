#/bin/sh

move_to_previous_desktop() {
  bspc desktop -f last.occupied
}

delete_local_receptacles() {
  for win in $(bspc query -N -n .leaf.local.!window); do
    bspc node $win -k
  done
}

void_empty_desktop() {
  if [ -z "$(bspc query -N -n .local.focused)" ]; then
    delete_local_receptacles
    move_to_previous_desktop
  fi
}

bspc subscribe node_remove |
  while read -r _; do
    void_empty_desktop
  done
