# Vagrantfile Template Guide

이 템플릿은 멀티 VM 환경을 쉽고 유연하게 구성하기 위해 설계되었습니다. `VM_CONFIG` 설정을 통해 각 VM의 리소스, 네트워크, 디스크, 프로비저닝 스크립트를 간편하게 관리할 수 있습니다.

## 시작하기

1. `templates/Vagrantfile_template` 파일을 프로젝트 디렉토리로 복사합니다.
   ```bash
   cp templates/Vagrantfile_template Vagrantfile
   ```
2. `Vagrantfile`을 열어 원하는 구성을 설정합니다.
3. `vagrant up` 명령어로 VM을 생성합니다.

---

## 설정 가이드

### 1. 전역 설정 (Global Configuration)
모든 VM에 기본으로 적용될 이미지와 리소스를 정의합니다.
```ruby
VM_IMAGE = "nobreak-labs/rocky-9"
VM_CPUS = 2
VM_MEMORY = "2048"
```

### 2. 프로비저닝 스크립트 (Provisioning Scripts)
VM 생성 시 실행할 스크립트를 변수로 정의합니다. 인라인 스크립트와 파일 경로를 모두 사용할 수 있습니다.

```ruby
# 인라인 스크립트 (Here Document 사용)
COMMON_SCRIPT = <<-SCRIPT
  echo "Hello, World!"
  yum update -y
SCRIPT

# 파일 경로는 사용 시 문자열로 직접 입력 가능
```

### 3. VM 구성 (VM Configuration)
`VM_CONFIG` 해시에 생성할 VM들을 정의합니다. 각 VM 이름(Key)에 대한 설정(Value)을 지정합니다.

#### 지원 옵션
| 옵션 | 설명 | 기본값 | 예시 |
|------|------|--------|------|
| `cpus` | CPU 코어 수 | `VM_CPUS` | `4` |
| `memory` | 메모리 크기 (MB) | `VM_MEMORY` | `"4096"` |
| `image` | Vagrant Box 이미지 이름 | `VM_IMAGE` | `"ubuntu/jammy64"` |
| `networks` | Private Network IP 주소 배열 | - | `["192.168.56.10"]` |
| `disks` | 추가 디스크 크기 배열 | - | `["10GB", "20GB"]` |
| `scripts` | 실행할 스크립트 배열 (변수 또는 경로) | - | `[COMMON_SCRIPT, "./setup.sh"]` |

> **참고**: `disks` 설정 시 디스크 이름은 `disk1`, `disk2`... 순서로 자동 생성되며 컨트롤러 포트에 순차적으로 연결됩니다.

---

## 구성 예제

다양한 시나리오에 따른 구성 예제입니다.

```ruby
VM_CONFIG = {
  # 1. 기본 설정 (네트워크만 지정)
  "web-server" => { 
    networks: ["192.168.56.10"]
  },

  # 2. 리소스 커스터마이징
  "db-server" => { 
    cpus: 4,
    memory: "4096",
    networks: ["192.168.56.20"]
  },

  # 3. 다른 OS 이미지 및 추가 디스크
  "storage-node" => { 
    image: "nobreak-labs/ubuntu-noble",
    networks: ["192.168.56.30"],
    disks: ["50GB", "50GB"]
  },

  # 4. 풀 옵션 (스크립트 포함)
  "k8s-master" => { 
    cpus: 2,
    memory: "4096",
    networks: ["192.168.56.40"],
    disks: ["20GB"],
    scripts: [COMMON_SCRIPT, INSTALL_DOCKER]
  }
}
```
