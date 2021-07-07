# SPDX-FileCopyrightText: Copyright 2021, Siavash Ameli <sameli@berkeley.edu>
# SPDX-License-Identifier: BSD-3-Clause
# SPDX-FileType: SOURCE

# -----------------------------------------------------------------------------
# How to build
#   $ docker build -t sameli/manylinux2014_x86_64_cuda_10 -f <This-Filename> .
#
# How to run:
#   $ docker run -it -v/host_dir:/image_dir --entrypoint /bin/bash \
#         manylinux2014_x86_64_cuda_10
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
