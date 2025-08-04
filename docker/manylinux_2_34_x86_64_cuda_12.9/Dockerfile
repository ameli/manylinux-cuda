# SPDX-FileCopyrightText: Copyright 2021, Siavash Ameli <sameli@berkeley.edu>
# SPDX-License-Identifier: BSD-3-Clause
# SPDX-FileType: SOURCE

# -----------------------------------------------------------------------------
# How to build
# $ docker build -t sameli/manylinux_2_34_x86_64_cuda_12.9 -f docker/manylinux_2_34_x86_64_cuda_12.9/Dockerfile .
#
# How to run:
# $ docker run -v$PWD:/host --rm --name cuda -it sameli/manylinux_2_34_x86_64_cuda_12.9
# -----------------------------------------------------------------------------

# -----------------
# Choose base image
# -----------------

FROM quay.io/pypa/manylinux_2_34_x86_64

LABEL org.opencontainers.image.authors="Siavash Ameli <samei@berkeley.edu>"
LABEL org.opencontainers.image.licenses="BSD-3-Clause"
LABEL org.opencontainers.image.source="https://github.com/ameli/manylinux-cuda"
LABEL org.opencontainers.image.version="12.9-x86_64"
LABEL org.opencontainers.image.description="manylinux_2_34_x86_64 with cuda 12.9"
LABEL org.opencontainers.image.base.name="quay.io/pypa/manylinux_2_34_x86_64"

# ------------
# Install cuda
# ------------

ARG VER="12-9"
ARG ARCH="x86_64"

RUN dnf config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/rhel9/x86_64/cuda-rhel9.repo
RUN dnf update \
 && dnf -y install \
    cuda-compiler-${VER}.${ARCH} \
    cuda-libraries-${VER}.${ARCH} \
    cuda-librar ies-devel-${VER}.${ARCH} \
 && dnf clean all \
 && rm -rf /var/cache/dnf/* \
 && echo "/usr/local/cuda/lib64" >> /etc/ld.so.conf.d/999_nvidia_cuda.conf

# ---------------------------------------
# Preserve environment for squashed image
# ---------------------------------------

RUN <<EOF
cmd="2a\\"
while IFS= read -r line; do cmd+="\n$line"; done <<EOH
# Restore original environment in squashed image
export AUDITWHEEL_POLICY=$AUDITWHEEL_POLICY AUDITWHEEL_ARCH=$AUDITWHEEL_ARCH AUDITWHEEL_PLAT=$AUDITWHEEL_PLAT
export LC_ALL=$LC_ALL LANG=$LANG LANGUAGE=$LANGUAGE
export DEVTOOLSET_ROOTPATH=\"$DEVTOOLSET_ROOTPATH\"
export LD_LIBRARY_PATH=\"/usr/local/cuda/lib64:$LD_LIBRARY_PATH\"
export PATH=\"/usr/local/cuda/bin:$PATH\"
export PKG_CONFIG_PATH=\"$PKG_CONFIG_PATH\"
export SSL_CERT_FILE=\"$SSL_CERT_FILE\"

EOH
sed -i "${cmd}" /usr/local/bin/manylinux-entrypoint
EOF

# ------------------------------------------------
# Squash all previous players to save wasted space
# ------------------------------------------------

# Do not inherit previous stage
FROM scratch

COPY --from=0 / /

# -------------------------
# Set environment variables
# -------------------------

# Copy the original ENV, ENTRYPOINT, CMD commands into the squashed image
ENV CUDA_HOME=/usr/local/cuda
ENV CUDA_ROOT=/usr/local/cuda
ENV CUDA_PATH=/usr/local/cuda
ENV CUDADIR=/usr/local/cuda

# --------
# Commands
# --------

WORKDIR /host

# Contains the preserved environment now
ENTRYPOINT ["/usr/local/bin/manylinux-entrypoint"]

CMD ["/bin/bash"]
