# SPDX-FileCopyrightText: Copyright 2021, Siavash Ameli <sameli@berkeley.edu>
# SPDX-License-Identifier: BSD-3-Clause
# SPDX-FileType: SOURCE

# -----------------------------------------------------------------------------
# How to build
#   $ docker build -t sameli/manylinux2014_aarch64_cuda_12.3 -f <This-Filename> .
#
# How to run:
#   $ docker run -it -v/host_dir:/image_dir --entrypoint /bin/bash \
#         manylinux2014_aarch64_cuda_12.3
# -----------------------------------------------------------------------------

# -----------------
# Choose base image
# -----------------

FROM quay.io/pypa/manylinux2014_aarch64

MAINTAINER Siavash Ameli <samei@berkeley.edu>
LABEL Description="manylinux2014_aarch64 with cuda 12.3"

# ------------
# Install cuda
# ------------

VER="12-3"
ARCH="aarch64"

RUN yum install -y yum-utils
RUN yum-config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/rhel9/sbsa/cuda-rhel9.repo
RUN yum clean all
RUN yum -y install cuda-compiler-${VER}.${ARCH} \
                   cuda-libraries-${VER}.${ARCH} \
                   cuda-libraries-devel-${VER}.${ARCH}

# -------------------------
# Set environment variables
# -------------------------

ENV PATH="/usr/local/cuda/bin:${PATH}"
ENV CUDA_HOME=/usr/local/cuda
ENV CUDA_ROOT=/usr/local/cuda
ENV CUDA_PATH=/usr/local/cuda
ENV CUDADIR=/usr/local/cuda
ENV LD_LIBRARY_PATH="/usr/local/cuda/lib64:${LD_LIBRARY_PATH}"

# --------
# Commands
# --------

CMD ["/bin/bash"]
