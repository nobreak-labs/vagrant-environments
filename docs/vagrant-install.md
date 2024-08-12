# Vagrant 설치

## (옵션) 패키지 관리자 설치

### Windows - Chocolatey

- [Chocolatey 홈페이지](https://chocolatey.org)
- [Chocolatey 설치](https://chocolatey.org/install)

요구사항:

- PowerShell v3+
- .NET Framework 4.8+

PowerShell 버전 확인

```powershell
pwsh -Version
```

**PowerShell**을 **관리자 권한**으로 실행

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

> Microsoft Store에서 [Windows Terminal](https://apps.microsoft.com/detail/windows-terminal/9N0DX20HK701) 앱 설치하여 사용하는 것을 권장

### macOS - Homebrew

- [Homebrew 홈페이지](https://brew.sh/)

Terminal 앱에서 아래 명령 실행

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

> [iTerm2](https://iterm2.com/) 터미널 사용 추천

## Vagrant 설치

- [Vagrant 홈페이지](https://www.vagrantup.com/)
- [Vagrant 설치](https://developer.hashicorp.com/vagrant/install)

Windows

```
choco install vagrant
```

macOS

```
brew install vagrant
```

## VirtualBox 설치

- [VirtualBox 홈페이지](https://www.virtualbox.org)
- [VirtualBox 설치](https://www.virtualbox.org/wiki/Downloads)

Windows

```
choco install virtualbox
```

macOS

```
brew install virtualbox
```
