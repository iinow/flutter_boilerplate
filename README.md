# flutter_example

* https://stackoverflow.com/questions/946993/intellij-reformat-on-file-save

## Getting Started

### install

* flutter
    * 압축푼 디렉토리에 `git init`
* dart
* fvm

```shell script
# flutter 환경 변수 설정
set -Ua fish_user_paths {flutter bin}

# fvm 환경 변수 설정
set -Ua fish_user_paths {~/.pub-cache/bin}

# dart 설치
brew tap dart-lang/dart
brew install dart

```

## flutter

```shell script
fvm flutter create {project name}
```

## fvm

* https://fvm.app/docs/getting_started/installation

### 명령어

```shell script
# fvm 명령어
fvm releases
fvm install 2.8.1
fvm list
fvm use 2.8.1
fvm flutter pub get
fvm flutter clean
```

### 프로젝트 내 fvm 디렉토리 설정

```shell script
cd {project directory}
fvm use 2.8.1
```

### vscode 설정

1. shift + command + P
2. workspace setting

```json
{
  "dart.flutterSdkPath": ".fvm/flutter_sdk"
}
```

## library

1. intl 다국어

```shell script
# 파일 생성
fvm flutter gen-l10n
```

## Environment variables

* 아래 `profile` 값을 읽어서 `.env.local`, `.env.dev`, `.env.prod` 파일을 읽도록
* `flutter_dotenv` 라이브러리와 함께

```shell
flutter run --dart-define=PROFILE=dev
const profile = String.fromEnvironment('PROFILE');
```

## Remote debug

* ~/Library/Android/sdk/platform-tools/adb tcpip 5555
    * 5555 -> 포트 번호
* ~/Library/Android/sdk/platform-tools/adb connect 192.168.0.18
    * 192.168.0.18 -> 모바일 내부 할당 아이피

## injectable

* 아래 명령어를 실행하면 `lib/common/config/injectable.config.dart` 파일이 생성된다

```shell
fvm flutter packages pub run build_runner build
fvm flutter packages pub run build_runner watch 
```
