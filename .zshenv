try_source () {
  [ -r "$1" ] && . "$1"
  return $?
}
[ -d "$HOME"/.nix-profile/bin ] && \
  ! echo "$PATH" | grep -Fq "$HOME"/.nix-profile/bin && \
  [ -z "$NIX_PATH" ] && \
  try_source "$HOME"/.nix-profile/etc/profile.d/nix.sh
[ -f "$HOME"/.config/nix/nix-host.conf ] && \
  export NIX_USER_CONF_FILES="$HOME"/.config/nix/nix-host.conf

[ -r "$HOME"/.functions ] && source "$HOME"/.functions
