# SPDX-FileCopyrightText: Copyright 2021, Siavash Ameli <sameli@berkeley.edu>
# SPDX-License-Identifier: BSD-3-Clause
# SPDX-FileType: SOURCE

# -----------------------------------------------------------------------------
# How to build
#   $ docker build -t sameli/manylinux_2_34_x86_64_cuda_12.9 -f <This-Filename> .
#
# How to run:
#   $ docker run -v$PWD:/host --rm --name cuda -it \
#         sameli/manylinux_2_34_x86_64_cuda_12.9
# -----------------------------------------------------------------------------

# -----------------
# Choose base image
# -----------------

FROM quay.io/pypa/manylinux_2_34_x86_64

LABEL org.opencontainers.image.authors="Siavash Ameli <samei@berkeley.edu>"
LABEL org.opencontainers.image.licenses="BSD-3-Clause"
LABEL org.opencontainers.image.source="https://github.com/ameli/manylinux-cuda"
LABEL org.opencontainers.image.version="12.9-x86_64"
LABEL org.opencontainers.image.description="manylinux_2_34_x86_64 with CUDA 12.9"
LABEL org.opencontainers.image.base.name="quay.io/pypa/manylinux_2_34_x86_64"

# ------------
# Install cuda
# ------------

ARG VER="12-9"
ARG ARCH="x86_64"

RUN dnf config-manager --add-repo \
        https://developer.download.nvidia.com/compute/cuda/repos/rhel9/x86_64/cuda-rhel9.repo \
 && dnf -y install \
        cuda-compiler-${VER}.${ARCH} \
        cuda-libraries-${VER}.${ARCH} \
        cuda-libraries-devel-${VER}.${ARCH} \
 && dnf clean all \
 && rm -rf /var/cache/dnf/* \
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
