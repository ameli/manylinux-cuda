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

RUN yum install -y yum-utils
RUN yum install -y wget

RUN wget https://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda-repo-rhel7-10-2-local-10.2.89-440.33.01-1.0-1.x86_64.rpm
RUN rpm -i cuda-repo-rhel7-10-2-local-10.2.89-440.33.01-1.0-1.x86_64.rpm
RUN yum clean all
RUN yum -y install nvidia-driver-latest-dkms cuda
RUN yum -y install cuda-drivers
RUN rm cuda-repo-rhel7-10-2-local-10.2.89-440.33.01-1.0-1.x86_64.rpm

# -------------------------
# Set environment variables
# -------------------------

ENV PATH="/usr/local/cuda/bin:${PATH}"
ENV CUDA_HOME=/usr/local/cuda
ENV CUDA_ROOT=/usr/local/cuda
ENV CUDA_PATH=/usr/local/cuda
ENV CUDADIR=/usr/local/cuda
ENV LD_LIBRARY_PATH="/usr/local/cuda/lib64:${LD_LIBRARY_PATH}"

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
