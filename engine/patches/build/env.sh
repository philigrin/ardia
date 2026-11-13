export CB="${AC_CHROMIUM_BUILD:-$HOME/chromium-build}"
_ac_repo="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")/../../.." && pwd)"
[[ -f "$_ac_repo/engine/patches/series" ]] || _ac_repo="$HOME/Documents/ardia"
export AC_REPO="${AC_REPO:-$_ac_repo}"
unset _ac_repo
export DEPOT_TOOLS_UPDATE=0
export PATH="$CB/depot_tools:$PATH"
export CHROMIUM_VERSION=157.0.8103.50
export HELIUM_TAG=0.21.2
export HELIUM_MACOS_TAG=0.21.2.1
export HELIUM_DIR="$CB/helium"
export HELIUM_MACOS_DIR="$CB/helium-macos"
export ARDIA_ARCH="${ARDIA_ARCH:-arm64}"
case "$ARDIA_ARCH" in
  arm64) export GN_CPU=arm64 ;;
  x86_64) export GN_CPU=x64 ;;
  *) echo "env.sh: ARDIA_ARCH is arm64 or x86_64, got '$ARDIA_ARCH'" >&2; return 64 2>/dev/null || exit 64 ;;
esac
export GN_OUT_CONFIGS="Release_GN_$GN_CPU"
lowprio() { taskpolicy -b nice -n 19 "$@"; }
lowprio_net() { taskpolicy -c utility -d throttle nice -n 19 "$@"; }
export DEPOT_TOOLS_METRICS=0
