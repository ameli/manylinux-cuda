# manylinux-cuda

This dockerfile installs **NVIDIA CUDA toolkit**, currently at **version 11.4**, on the top of [`quay.io/pypa/manylinux_2_24_x86_64`](https://github.com/pypa/manylinux) docker image.

Obtain this docker image from [Dockerhub](https://hub.docker.com/repository/docker/sameli/manylinux2014_x86_64_cuda) by:

    docker pull sameli/manylinux2014_x86_64_cuda

To run the container interactively:

    docker run -it --entrypoint /bin/bash sameli/manylinux2014_x86_64_cuda

The following environment variables are defined:

* `CUDA_HOME=/usr/local/cuda`
* `CUDA_ROOT=/usr/local/cuda`
* `CUDA_PATH=/usr/local/cuda`

The `nvcc` executable is available on the `PATH`. To check the cuda version, run:

    docker run -t sameli/manylinux2014_x86_64_cuda nvcc --version

The output of the above command is:

    nvcc: NVIDIA (R) Cuda compiler driver
    Copyright (c) 2005-2021 NVIDIA Corporation
    Built on Mon_May__3_19:15:13_PDT_2021
    Cuda compilation tools, release 11.3, V11.3.109
    Build cuda_11.3.r11.3/compiler.29920130_0
