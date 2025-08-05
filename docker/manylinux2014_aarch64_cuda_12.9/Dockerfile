# SPDX-FileCopyrightText: Copyright 2021, Siavash Ameli <sameli@berkeley.edu>
# SPDX-License-Identifier: BSD-3-Clause
# SPDX-FileType: SOURCE

# -----------------------------------------------------------------------------
# How to build
#   $ docker build -t sameli/manylinux2014_aarch64_cuda_12.9 -f <This-Filename> .
#
# How to run:
#   $ docker run -v$PWD:/host --rm --name cuda -it \
#         sameli/manylinux2014_aarch64_cuda_12.9
# -----------------------------------------------------------------------------

# -----------------
# Choose base image
# -----------------

FROM quay.io/pypa/manylinux2014_aarch64

LABEL org.opencontainers.image.authors="Siavash Ameli <samei@berkeley.edu>"
LABEL org.opencontainers.image.licenses="BSD-3-Clause"
LABEL org.opencontainers.image.source="https://github.com/ameli/manylinux-cuda"
LABEL org.opencontainers.image.version="12.9-aarch64"
LABEL org.opencontainers.image.description="manylinux2014_aarch64 with CUDA 12.9"
LABEL org.opencontainers.image.base.name="quay.io/pypa/manylinux2014_aarch64"

# ------------
# Install cuda
# ------------

ARG VER="12-9"
ARG ARCH="aarch64"

RUN yum install -y yum-utils \
 && yum-config-manager --add-repo \
        https://developer.download.nvidia.com/compute/cuda/repos/rhel9/sbsa/cuda-rhel9.repo \
 && yum -y install \
        cuda-compiler-${VER}.${ARCH} \
        cuda-libraries-${VER}.${ARCH} \
        cuda-libraries-devel-${VER}.${ARCH} \
 && yum -y erase yum-utils \
 && yum clean all \
 && rm -rf /var/cache/yum/* \
 && echo "/usr/local/cuda/lib64" > /etc/ld.so.conf.d/999_nvidia_cuda.conf

# -------------------------
# Set environment variables
# -------------------------

ENV PATH="/usr/local/cuda/bin:${PATH}" \
    LD_LIBRARY_PATH="/usr/local/cuda/lib64:${LD_LIBRARY_PATH}" \
    CUDA_HOME=/usr/local/cuda \
    CUDA_ROOT=/usr/local/cuda \
    CUDA_PATH=/usr/local/cuda \
    CUDADIR=/usr/local/cuda

# --------
# Commands
# --------

WORKDIR /host
CMD ["/bin/bash"]
