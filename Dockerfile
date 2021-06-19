# SPDX-FileCopyrightText: Copyright 2021, Siavash Ameli <sameli@berkeley.edu>
# SPDX-License-Identifier: BSD-3-Clause
# SPDX-FileType: SOURCE

# -----------------------------------------------------------------------------
# How to build
#   $ docker build -t sameli/manylinux2014_x86_64_cuda -f <This-Filename> .
#
# How to run:
#   $ docker run -it -v/host_dir:/image_dir --entrypoint /bin/bash \
#         manylinux2014_x86_64_cuda
# -----------------------------------------------------------------------------

# -----------------
# Choose base image
# -----------------

FROM quay.io/pypa/manylinux2014_x86_64

MAINTAINER Siavash Ameli <samei@berkeley.edu>
LABEL Description="manylinux2014_x86_64 with cuda 11.3"

# ------------
# Install cuda
# ------------

ARG VERSION=11-3
ARG ARCH=x86_64

RUN yum install -y yum-utils
RUN yum-config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/rhel7/x86_64/cuda-rhel7.repo
RUN yum clean all
RUN yum -y install nvidia-driver-latest-dkms cuda
RUN yum -y install cuda-drivers
RUN ln -s cuda-$VERSION /usr/local/cuda
ENV PATH="/usr/local/cuda/bin:${PATH}"
ENV CUDA_HOME=/usr/local/cuda
ENV CUDA_ROOT=/usr/local/cuda
ENV CUDA_PATH=/usr/local/cuda
