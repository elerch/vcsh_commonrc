try_source () {
  [ -r "$1" ] && . "$1"
  return $?
}
[ -d "$HOME"/.nix-profile/bin ] && \
  ! echo "$PATH" | grep -Fq "$HOME"/.nix-profile/bin && \
  [ -z "$NIX_PATH" ] && \
  try_source "$HOME"/.nix-profile/etc/profile.d/nix.sh
[ -r "$HOME"/.functions ] && source "$HOME"/.functions
