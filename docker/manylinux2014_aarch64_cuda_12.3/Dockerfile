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

RUN yum install -y yum-utils
RUN yum install -y wget

# RUN wget https://developer.download.nvidia.com/compute/cuda/12.3.1/local_installers/cuda-repo-rhel9-12-3-local-12.3.1_545.23.08-1.aarch64.rpm
# RUN sudo rpm -i cuda-repo-rhel9-12-3-local-12.3.1_545.23.08-1.aarch64.rpm
# RUN sudo yum clean all
# RUN sudo yum -y install cuda-toolkit-12-3
# RUN rm cuda-repo-rhel9-12-3-local-12.3.1_545.23.08-1.aarch64.rpm

RUN wget https://developer.download.nvidia.com/compute/cuda/12.3.1/local_installers/cuda-repo-rhel8-12-3-local-12.3.1_545.23.08-1.aarch64.rpm
RUN sudo rpm -i cuda-repo-rhel8-12-3-local-12.3.1_545.23.08-1.aarch64.rpm
RUN sudo yum clean all
RUN sudo yum -y install cuda-toolkit-12-3
RUN rm cuda-repo-rhel8-12-3-local-12.3.1_545.23.08-1.aarch64.rpm

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
