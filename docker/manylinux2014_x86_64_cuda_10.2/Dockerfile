# SPDX-FileCopyrightText: Copyright 2021, Siavash Ameli <sameli@berkeley.edu>
# SPDX-License-Identifier: BSD-3-Clause
# SPDX-FileType: SOURCE

# -----------------------------------------------------------------------------
# How to build
#   $ docker build -t sameli/manylinux2014_x86_64_cuda_10.2 -f <This-Filename> .
#
# How to run:
#   $ docker run -it -v/host_dir:/image_dir --entrypoint /bin/bash \
#         manylinux2014_x86_64_cuda_10.2
# -----------------------------------------------------------------------------

# -----------------
# Choose base image
# -----------------

FROM quay.io/pypa/manylinux2014_x86_64

MAINTAINER Siavash Ameli <samei@berkeley.edu>
LABEL Description="manylinux2014_x86_64 with cuda 10.2"

# ------------
# Install cuda
# ------------

ARG VER="10-2"
ARG ARCH="x86_64"

RUN yum install -y yum-utils
RUN yum-config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/rhel7/x86_64/cuda-rhel7.repo
RUN yum -y install cuda-compiler-${VER}.${ARCH} \
                   cuda-libraries-${VER}.${ARCH} \
                   cuda-libraries-dev-${VER}.${ARCH} \
                   nvidia-driver-latest-dkms
RUN yum clean all
RUN rm -rf /var/cache/yum/*
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

# ------------------
# Set Compatible GCC
# ------------------

# Cuda 10 is not compatible with gcc version higher than 8.
RUN yum -y install centos-release-scl
RUN yum -y install devtoolset-8-gcc devtoolset-8-gcc-c++
# RUN ln -s /opt/rh/devtoolset-8/root/bin/gcc /usr/local/cuda/bin/gcc
# RUN ln -s /opt/rh/devtoolset-8/root/bin/g++ /usr/local/cuda/bin/g++
# RUN scl enable devtoolset-8 -- bash
ENV PATH=/opt/rh/devtoolset-8/root/bin/:$PATH

# --------
# Commands
# --------

CMD ["/bin/bash"]
