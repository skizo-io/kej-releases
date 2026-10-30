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
version='0.3.16'
expected='7ff4d04ecf8c744f43e0576200f965af59f0cf7c71c3062a993f46ef6fe6fbd2'
work=$(mktemp -d "${TMPDIR:-/tmp}/kej-download.XXXXXX")
trap 'rm -rf "$work"' EXIT
archive="$work/Kej-$version.zip"
echo "Kej $version 설치 파일을 받습니다."
/usr/bin/curl --fail --location --silent --show-error --proto '=https' --proto-redir '=https' \
  "https://github.com/skizo-io/kej-releases/releases/download/v$version/Kej-$version.zip" -o "$archive"
actual=$(/usr/bin/shasum -a 256 "$archive")
[[ "${actual%% *}" == "$expected" ]] || { echo '파일 체크섬이 다릅니다. 설치하지 않았습니다.' >&2; exit 1; }
mkdir "$work/extracted"
/usr/bin/ditto -x -k "$archive" "$work/extracted"
installer="$work/extracted/Kej 설치/Kej 설치.app"
verify_installer() {
  /usr/bin/codesign --verify --deep --strict \
    -R '=anchor apple generic and certificate leaf[subject.OU] = "J9WMZ4G9PY" and identifier "com.k-byungkyu.Kej.Installer.v0-3-16.b25"' "$1"
  /usr/sbin/spctl --assess --type execute "$1"
}
verify_installer "$installer"
echo '체크섬·개발자 서명·Gatekeeper 확인 완료.'
if [[ "${1:-}" == --check ]]; then
  echo '검사만 수행했습니다. 앱 설치·실행·설정 변경은 하지 않았습니다.'
  exit 0
fi
mkdir -p "$HOME/Downloads"
destination=$(mktemp -d "$HOME/Downloads/Kej-Install-$version.XXXXXX")
/usr/bin/ditto "$work/extracted/Kej 설치" "$destination/Kej 설치"
installer="$destination/Kej 설치/Kej 설치.app"
verify_installer "$installer"
/usr/bin/open -n "$installer"
echo '열린 창에서 설치를 누르세요. 설치 파일은 다운로드 폴더에 있습니다.'
