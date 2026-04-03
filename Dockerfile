# syntax=docker/dockerfile:1

FROM mambaorg/micromamba:git-6d896e6-cuda12.2.2-ubuntu22.04

# Node.js 20 for qwen-code (requires node >=20)
# prepare libs for open3d
# curl for vscode server
# slurm-client for sbatch, srun, scontrol, squeue, scancel
# openssh-client for git ssh operations inside container
USER root
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get update && apt-get install --no-install-recommends -y \
    nodejs \
    libgl1 \
    libgomp1 \
    git \
    less \
    curl \
    libreoffice \
    build-essential \
    slurm-client \
    openssh-client \
    && rm -rf /var/lib/apt/lists/*
