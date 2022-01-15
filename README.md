# flutter_example

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
