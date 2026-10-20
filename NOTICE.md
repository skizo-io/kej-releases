# 데이터 출처·저작권 및 이용 조건

Kej에는 아래 외부 자료에서 가공한 단어표·통계표가 포함됩니다.
각 데이터의 권리는 원저작자에게 있으며, 해당 라이선스가 적용됩니다.
회사 업무용 사용·재배포도 각 조건을 지켜야 합니다. 자료 제공자가 Kej를 보증하거나 후원한다는 뜻은 아닙니다.

## 1. SCOWL — 영어 단어표

- 자료: SCOWL 2020.12.07, Kevin Atkinson 및 원문 고지에 기재된 기여자들.
- Copyright 2000–2018 Kevin Atkinson and the other copyright holders identified in the original notice.
- 원본: http://wordlist.aspell.net/ ; https://sourceforge.net/projects/wordlist/files/SCOWL/2020.12.07/
- 포함 파일: `english_words.tsv`.
- 가공: 여러 단어 목록을 합치고 중복·대소문자를 정리하여 단어별 SCOWL 수준을 TSV로 저장했습니다.
  고유명사 목록도 판별용 수준으로 구분했습니다.
- 조건: 사용·복사·수정·배포·판매를 허용하며 원래 저작권·허락 고지를 유지해야 합니다.
- 원문 전체와 개별 원자료 조건: [SCOWL 저작권 고지](third-party/scowl-Copyright).
  앱 안에서는 `Contents/Resources/third-party/scowl-Copyright`에 있습니다.

## 2. Tatoeba — 한국어·일본어 통계표

- 자료 및 저작자 표시: **Tatoeba 문장 모음 / Tatoeba contributors**.
- 원본: https://tatoeba.org/ ; 한국어·일본어 텍스트 자료: https://tatoeba.org/en/downloads
- 라이선스: **Creative Commons Attribution 2.0 France (CC BY 2.0 FR)**.
  조건 및 원문: https://creativecommons.org/licenses/by/2.0/fr/ ; https://creativecommons.org/licenses/by/2.0/fr/legalcode
- 포함 파일: `korean_syllables.tsv`, `korean_words.tsv`, `korean_syllable_pairs.tsv`,
  `kana_trigrams.tsv`, `kanji_ngrams.tsv`, `kanji_spellings.tsv`.
- 가공: 한국어 음절·단어·인접 음절의 횟수를 집계하고, 일본어 읽기와 문자 묶음·한자 표기의 빈도를
  집계·필터링·정렬하여 TSV로 만들었습니다. 일본어 일부 자료는 평가·조정용 문장을 제외합니다.
  원문 문장 모음·번역·오디오는 앱에 배포하지 않습니다. 오디오 자료는 사용하지 않습니다.
- Kej가 이 가공 데이터에 가지는 권리는 위 CC BY 2.0 FR 조건으로 제공합니다.
  상업적 사용·수정·재배포가 허용되며 출처·라이선스·가공 표시를 유지해야 합니다.
- 텍스트 출처 표시 방식은 Tatoeba 공식 FAQ에 따릅니다:
  https://en.wiki.tatoeba.org/articles/show/faq#i-would-like-to-use-data-from-tatoeba-for-my-project-how-do-i-give-proper-attribution

## 3. FrequencyWords — 한국어 어휘·빈도표

- 자료 및 저작자 표시: **FrequencyWords / Hermit Dave (hermitdave)**, 2018 한국어 상위 50,000 단어 목록.
- 원본: https://github.com/hermitdave/FrequencyWords/tree/master/content/2018/ko
- 원자료 계보: FrequencyWords는 OpenSubtitles2018의 토큰화 자료에서 생성되었다고 설명합니다.
  https://opus.nlpl.eu/OpenSubtitles2018.php
- 데이터 라이선스: **Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)**.
  https://creativecommons.org/licenses/by-sa/4.0/ ; https://creativecommons.org/licenses/by-sa/4.0/legalcode.en
  원본 저장소의 MIT 조건은 생성기 코드에 대한 것이며 데이터의 이용 조건과 다릅니다.
- 포함 파일: `korean_vocabulary.tsv`.
- 가공: 한국어 완성형 음절로만 이루어진 항목을 추려 원래 빈도와 함께 TSV로 변환했습니다.
  배포용 표에는 평가용 단어 제외를 적용하지 않습니다. 평가 전용 사본은 별도이며 앱에 넣지 않습니다.
- 이 파일과 Kej가 기여한 수정 부분은 **CC BY-SA 4.0**으로 제공합니다.
  수정하여 배포하는 해당 데이터도 같은 조건 또는 공식 호환 조건을 따라야 합니다.
  해당 데이터에 대한 재사용 권리를 Kej의 프로그램 이용 조건으로 제한하지 않습니다.
- 이 데이터는 앱의 `Contents/Resources/Data/korean_vocabulary.tsv`에 읽을 수 있는 TSV로 있습니다.
  출처·라이선스·가공 표시와 원래 제공된 고지를 유지하세요.

## 4. Mac에 이미 설치된 자료·기능

- `/usr/share/dict/words`: 해당 Mac에 있으면 영어 철자 통계를 계산할 때 읽습니다.
  없으면 포함된 영어 단어표를 사용합니다. 이 시스템 사전 자체를 Kej 설치 파일에 복제하지 않습니다.
- 일본어 한자 변환: macOS의 시스템 `libmecabra` 기능을 호출합니다. 해당 Apple 라이브러리나
  시스템 일본어 사전을 Kej 설치 파일에 복제·배포하지 않습니다.
- Apple의 시스템 구성요소에 대한 권리·이용 조건은 Apple에 있습니다.

## 프로그램과 데이터의 구분

이 문서는 외부 데이터의 출처와 조건을 알리는 고지입니다. Kej 고유 소스 코드 전체를 CC 또는
오픈소스 라이선스로 제공하는 것이 아닙니다. 별도 TSV 데이터에는 위 라이선스가 계속 적용됩니다.
Kej 프로그램 설치·업무 사용·수정 없는 재배포 허용 범위는 [Kej 이용 안내](KEJ-LICENSE.md)를 확인하세요.
데이터는 원래 라이선스에 정해진 보증 부인과 책임 제한을 포함한 조건으로 제공됩니다.
