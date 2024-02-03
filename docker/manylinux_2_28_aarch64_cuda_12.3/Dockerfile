# SPDX-FileCopyrightText: Copyright 2021, Siavash Ameli <sameli@berkeley.edu>
# SPDX-License-Identifier: BSD-3-Clause
# SPDX-FileType: SOURCE

# -----------------------------------------------------------------------------
# How to build
#   $ docker build -t sameli/manylinux_2_28_aarch64_cuda_12.3 -f <This-Filename> .
#
# How to run:
#   $ docker run -it -v/host_dir:/image_dir --entrypoint /bin/bash \
#         manylinux_2_28_aarch64_cuda_12.3
# -----------------------------------------------------------------------------

# -----------------
# Choose base image
# -----------------

FROM quay.io/pypa/manylinux_2_28_aarch64

MAINTAINER Siavash Ameli <samei@berkeley.edu>
LABEL Description="manylinux_2_28_aarch64 with cuda 12.3"

# ------------
# Install cuda
# ------------

ARG VER="12-3"
ARG ARCH="aarch64"

RUN dnf config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/rhel8/sbsa/cuda-rhel8.repo
RUN dnf -y install epel-release
RUN dnf -y install cuda-compiler-${VER}.${ARCH} \
                   cuda-libraries-${VER}.${ARCH} \
                   cuda-libraries-devel-${VER}.${ARCH}
RUN dnf -y module install nvidia-driver:latest-dkms
RUN dnf clean all
RUN rm -rf /var/cache/dnf/*
RUN echo "/usr/local/cuda/lib64" >> /etc/ld.so.conf.d/999_nvidia_cuda.conf

# -------------------------
# Set environment variables
# -------------------------

ENV PATH="/usr/local/cuda/bin:${PATH}"
ENV LD_LIBRARY_PATH="/usr/local/cuda/lib64:${LD_LIBRARY_PATH}"
ENV CUDA_HOME=/usr/local/cuda
ENV CUDA_ROOT=/usr/local/cuda
ENV CUDA_PATH=/usr/local/cuda
ENV CUDADIR=/usr/local/cuda

# --------
# Commands
# --------

CMD ["/bin/bash"]
