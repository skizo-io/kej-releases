#!/bin/bash
# Download and verify the notarized installer. Never disable Gatekeeper or alter input data.
set -euo pipefail
if [[ "$(uname -s)" != Darwin ]]; then
  echo 'Kej는 macOS에서만 설치할 수 있습니다.' >&2
  exit 1
fi
case "${1:-}" in
  ''|--check) ;;
  *) echo '사용법: bash install.sh [--check]' >&2; exit 2 ;;
esac
version='0.3.3'
expected='b7de2591ec8d8a836cebf3385525453983b863708b415d4c0d4f8f12fe8ff52d'
work=$(mktemp -d "${TMPDIR:-/tmp}/kej-download.XXXXXX")
dmg="$work/Kej-$version.dmg"
volume="$work/volume"
mounted=0
keep=0
cleanup() {
  if [[ "$mounted" == 1 && "$keep" == 0 ]]; then
    /usr/bin/hdiutil detach "$volume" -quiet || true
  fi
}
trap cleanup EXIT
echo "Kej $version 설치 파일을 받습니다."
/usr/bin/curl --fail --location --silent --show-error --proto '=https' --proto-redir '=https' \
  "https://github.com/skizo-io/kej-releases/releases/download/v$version/Kej-$version.dmg" -o "$dmg"
actual=$(/usr/bin/shasum -a 256 "$dmg")
[[ "${actual%% *}" == "$expected" ]] || { echo '파일 체크섬이 다릅니다. 설치하지 않았습니다.' >&2; exit 1; }
/usr/bin/codesign --verify --strict "$dmg"
/usr/sbin/spctl --assess --type open --context context:primary-signature "$dmg"
mkdir "$volume"
/usr/bin/hdiutil attach "$dmg" -readonly -nobrowse -mountpoint "$volume" -quiet
mounted=1
installer="$volume/Kej 설치.app"
/usr/bin/codesign --verify --deep --strict \
  -R '=anchor apple generic and certificate leaf[subject.OU] = "J9WMZ4G9PY" and identifier "com.k-byungkyu.Kej.Installer.v0-3-3.b12"' "$installer"
/usr/sbin/spctl --assess --type execute "$installer"
echo '체크섬·개발자 서명·Gatekeeper 확인 완료.'
if [[ "${1:-}" == --check ]]; then
  echo '검사만 수행했습니다. 앱 설치·실행·설정 변경은 하지 않았습니다.'
  exit 0
fi
/usr/bin/open -n "$installer"
keep=1
echo '열린 창에서 설치를 누르세요. 완료 후 Finder에서 Kej 디스크를 추출하면 됩니다.'
