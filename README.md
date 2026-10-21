# Kej — Mac용 한·영·일 입력기

영문 자판으로 입력하면 단어에 맞는 언어를 골라줍니다.
macOS 13 이상 · Apple Silicon / Intel

## 다운로드·설치

[쉬운 설치 안내](https://tinyurl.com/getkej) · [최신 설치 파일](https://github.com/skizo-io/kej-releases/releases/latest)

1. DMG를 열고 `Kej 설치.app`에서 **설치**를 누릅니다.
2. 처음 한 번만 시스템 설정 → 키보드 → 입력 소스 편집 → **＋ → 한국어 → Kej**를 추가합니다.
3. 메뉴 막대에서 Kej를 선택합니다.

업데이트는 새 설치 파일만 실행하세요. 단어 선택과 설정은 유지되며, 입력 소스를 다시 추가할 필요는 없습니다.

## 키 사용법

- **Space**: 확정·띄어쓰기 / 일본어 한자 후보
- **Return**: 확정
- **오른쪽 Command — 변경 가능**

**1. 현재 단어의 언어 전환**

영어 · 한글 · 일본어(히라가나·가타카나) 중에서 전환합니다.
입력을 확정하면 선택한 언어를 학습해 다음 입력에 반영합니다.

**2. 언어 전환할 단어가 없는 경우 일본어 켜기/끄기**

공백 뒤·입력창 맨 앞에서 누르세요.

메뉴 막대의 **Kej → Kej 설정…**에서 메인·서브 키를 변경하거나 삭제할 수 있습니다.
기본값: 메인 오른쪽 Command / 서브 미등록
실행 버전은 Kej 입력 메뉴 맨 위에서 확인할 수 있습니다.

<details><summary>명령어로 설치</summary>

```sh
curl -fsSL https://raw.githubusercontent.com/skizo-io/kej-releases/refs/heads/main/install.sh | /bin/bash
```

</details>

[저작권·데이터 출처](NOTICE.md) · [프로그램 이용 안내](KEJ-LICENSE.md)
