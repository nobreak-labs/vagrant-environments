# Vagrant 치트 시트

## 일반적인 작업 순서

1. 적절한 경로(일반적으로 홈 디렉터리)에 작업할 빈 디렉터리 생성
2. 생성한 디렉터리에 `Vagrantfile` 파일 생성
3. 해당 디렉터리에서 `vagrant` 명령으로 VM 관리

> ⚠️ 주의
> 
> Windows 시스템에서 Vagrant에 사용할 디렉터리를 홈 디렉터리에 배치 한 경우 적절하게 부팅되지 않거나 SSH 관련 오류가 발생할 수 있음, 가능하면 `c:\vagrant`에 작업별 디렉터리를 사용하는 것을 권장함

## 초기화

- `vagrant init`: 현재 디렉터리에 새로운 `Vagrantfile` 파일 생성, 베이스 이미지가 지정되지 않아 `vagrant up` 할 수 없음
- `vagrant init <box_image>`: 특정 박스 이미지와 함께 `Vagrantfile` 파일 생성
  - [Vagrant Cloud](https://app.vagrantup.com/boxes/search) 이미지 검색
  - 예:
    - `vagrant init ubuntu/jammy64`
    - `vagrant init rockylinux/9`

```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
end
```

## VM 정보 확인

- `vagrant status`: VM 배포 상태 확인
- `vagrant global-status`: 시스템의 `vagrant`로 배포된 모든 VM 상태 확인
- `vagrant global-status --prune`: 유효하지 않은 VM 정보 삭제

## VM 시작

- `vagrant up`: VM 생성 및 실행, 프로비저닝이 있으면 한번만 실행
- `vagrant resume`: 일시중지된 VM 재개
- `vagrant provision`: VM 프로비저닝
- `vagrant reload`: VM 재시작, `Vagrantfile` 다시 읽음
- `vagrant reload --provision`: VM 재시작, `Vagrantfile` 다시 읽고 프로비저닝 실행



## VM 중지

- `vagrant halt`: VM 중지
- `vagrant suspend`: VM 일시중지

## VM 삭제

- `vagrant destroy`: VM 삭제
- `vagrant destroy -f`: 확인 절차 없이 VM 삭제

## VM 이미지 관리

- `vagrant box list`: 시스템에 다운로드된 모든 이미지 확인
- `vagrant box add <box_image>`: 특정 이미지 다운로드
  - 이미지를 미리 받아놓지 않더라도 `vagrant up` 명령 실행 시 이미지 다운로드 함
- `vagrant box outdated`: 이미지 최신 버전 확인
- `vagrant box remove <box_image>`: 로컬에서 이미지 삭제
  - `vagrant box remove <box_image> --box-version <version>`: 같은 이미지의 특정 버전만 삭제
  - `vagrant box remove <box_image> --all`: 같은 이미지의 여러 버전을 한번에 삭제

## VM SSH 접속

- `vagrant ssh`: 단일 VM인 경우
- `vagrant ssh <vm_name>`: 여러 VM인 경우 반드시 VM 이름을 지정해야 함
- `vagrant ssh-config`: SSH 클라이언트 컨피그 확인, 일반적으로 `~/.ssh/config` 파일에 해당 정보를 저장하며, `vagrant ssh` 명령이 아닌 `ssh` 명령으로 접속 시 필요함
