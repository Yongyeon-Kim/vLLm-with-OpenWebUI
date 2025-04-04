FROM pytorch/pytorch:2.1.2-cuda11.8-cudnn8-devel

# vLLM 설치
RUN pip install vllm

# 기본 실행 명령
CMD ["python", "-m", "vllm.entrypoints.api_server"]