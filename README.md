# vLLM + Open WebUI 통합 실행 환경

이 저장소는 [vLLM](https://github.com/vllm-project/vllm)을 기반으로 한 LLM 추론 서버와  
[Open WebUI](https://github.com/open-webui/open-webui)를 함께 실행할 수 있도록 구성된 Docker Compose 환경입니다.

로컬에 저장된 SFT 모델을 빠르게 배포하고, Web UI를 통해 사용자 친화적인 인터페이스로 활용할 수 있습니다.

---

## 🧱 프로젝트 구조

```bash
.
├── docker-compose.yml     # vLLM + Open WebUI 실행 환경 정의
├── Dockerfile             # vLLM 실행 환경용 커스텀 이미지
├── open-webui/            # Open WebUI 소스 코드
└── vllm/                  # vLLM 소스 코드
```

---

## 🚀 실행 방법

### 1. Docker 이미지 빌드

먼저 vLLM 환경을 위한 이미지를 빌드합니다:

```bash
docker build -t vllm-env .
```

---

### 2. Docker Compose로 실행

```bash
docker compose up
```

- vLLM API 서버: `http://localhost:8000/v1`
- Open WebUI: `http://localhost:8080`

---

## ⚙️ 환경설정 요약

### 📌 `docker-compose.yml` 주요 옵션

#### vllm 서비스
| 항목 | 설명 |
|------|------|
| `--model` | 로컬에 저장된 SFT 모델 경로 지정 |
| `--gpu-memory-utilization` | GPU 메모리 사용률 제한 |
| `--kv-cache-dtype` | 캐시 데이터 형식 (예: fp8, fp16 등) |

#### open-webui 서비스
| 환경변수 | 설명 |
|----------|------|
| `OPENAI_API_BASE_URL` | vLLM API 경로 지정 |
| `USE_CUDA_DOCKER` | Docker 내 GPU 사용 설정 |
| `WEBUI_SECRET_KEY` | 인증 키 (간단히 EMPTY로 설정 가능) |

---

## 💾 모델 경로 예시

로컬 모델 경로 예:
```
../model/output/gemma-2-9b_sft_1e-5_instruct/checkpoint-1875
```

이 경로가 `/model/`로 마운트되며, `--model /model/...` 형식으로 인식됩니다.

---

## ✅ 사전 요구 사항

- Docker 및 Docker Compose 설치  
- NVIDIA GPU 사용 시 [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/) 설치 필요  
- 로컬에 변환된 모델(`gguf` 또는 HF 포맷 SFT 모델) 준비

---

## 🖥️ 웹 UI 접속

브라우저에서 아래 주소로 접속:

```
http://localhost:8080
```

---

## 🛠️ 참고

- [vLLM 문서](https://docs.vllm.ai/)
- [Open WebUI 문서](https://docs.openwebui.com/)
- [vLLM API 호환 OpenAI 포맷](https://docs.vllm.ai/en/latest/serving/openai.html)

---

## 📜 라이선스

- vLLM: Apache 2.0  
- Open WebUI: Apache 2.0  
- 본 프로젝트는 연구 및 개발 용도로 구성되었습니다.
