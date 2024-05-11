manylinux-cuda
**************

`manylinux <https://github.com/pypa/manylinux>`__ docker images featuring an installation of the **NVIDIA CUDA** compiler, runtime and development libraries, and the NVIDIA graphic driver, designed specifically for building Python wheels with a C++/CUDA backend.

Download Images
===============

Obtain the docker images from Docker Hub for the following CUDA versions:

X86_64 Architecture
-------------------

* **manylinux_2_28** on **X86_64** arch with CUDA **12.3** (`see on Dockerhub <https://hub.docker.com/r/sameli/manylinux_2_28_x86_64_cuda_12.3>`__) |deploy-docker-manylinux_2_28_x86_64_cuda_12.3|

  ::

      docker pull sameli/manylinux_2_28_x86_64_cuda_12.3

* **manylinux2014** on **X86_64** arch with CUDA **12.3** (`see on Dockerhub <https://hub.docker.com/r/sameli/manylinux2014_x86_64_cuda_12.3>`__) |deploy-docker-manylinux2014_x86_64_cuda_12.3|

  ::

      docker pull sameli/manylinux2014_x86_64_cuda_12.3

* **manylinux2014** on **X86_64** arch with CUDA **12.0** (`see on Dockerhub <https://hub.docker.com/r/sameli/manylinux2014_x86_64_cuda_12.0>`__) |deploy-docker-manylinux2014_x86_64_cuda_12_0|

  ::

      docker pull sameli/manylinux2014_x86_64_cuda_12.0

* **manylinux2014** on **X86_64** arch with CUDA **11.8** (`see on Dockerhub <https://hub.docker.com/r/sameli/manylinux2014_x86_64_cuda_11.8>`__) |deploy-docker-manylinux2014_x86_64_cuda_11_8|

  ::

      docker pull sameli/manylinux2014_x86_64_cuda_11.8

* **manylinux2014** on **X86_64** arch with CUDA **10.2** (`see on Dockerhub <https://hub.docker.com/r/sameli/manylinux2014_x86_64_cuda_10.2>`__) |deploy-docker-manylinux2014_x86_64_cuda_10_2|

  ::

      docker pull sameli/manylinux2014_x86_64_cuda_10.2


AARCH64 Architecture
--------------------

* **manylinux_2_28** on **AARCH64** arch with CUDA **12.3** (`see on Dockerhub <https://hub.docker.com/r/sameli/manylinux_2_28_aarch64_cuda_12.3>`__) |deploy-docker-manylinux_2_28_aarch64_cuda_12_3|

  ::

      docker pull sameli/manylinux_2_28_x86_64_cuda_12.3

* **manylinux2014** on **AARCH64** arch with CUDA **12.3** (`see on Dockerhub <https://hub.docker.com/r/sameli/manylinux2014_aarch64_cuda_12.3>`__) |deploy-docker-manylinux2014_aarch64_cuda_12_3|

  ::

      docker pull sameli/manylinux2014_x86_64_cuda_12.3

Base of Images
==============

The docker images were built based on the following images:

* **manylinux_2_28** on **X86_64** architecture is based on: `quay.io/pypa/manylinux_2_28_x86_64 <https://github.com/pypa/manylinux>`__
* **manylinux_2_28** on **AARCH64** architecture is based on: `quay.io/pypa/manylinux_2_28_aarch64 <https://github.com/pypa/manylinux>`__
* **manylinux2014** on **X86_64** architecture is based on: `quay.io/pypa/manylinux2014_x86_64 <https://github.com/pypa/manylinux>`__
* **manylinux2014** on **AARCH64** architecture is based on: `quay.io/pypa/manylinux2014_aarch64 <https://github.com/pypa/manylinux>`__

What is Included
================

To maintain a minimal Docker image size, only the essential compilers and libraries from CUDA Toolkit are included. These include:

* CUDA compiler: ``cuda-crt``, ``cuda-cuobjdump``, ``cuda-cuxxfilt``, ``cuda-nvcc``, ``cuda-nvprune``, ``cuda-nvvm``, ``cuda-cudart``, ``cuda-nvrtc``, ``cuda-opencl``,
* CUDA libraries: ``libcublas``, ``libcufft``, ``libcufile``, ``libcurand``, ``libcusolver``, ``libcusparse``, ``libnpp``, ``libnvjitlink``, ``libnvjpeg``
* CUDA development libraries: ``cuda-cccl``, ``cuda-cudart-devel``, ``cuda-driver-devel``, ``cuda-nvrtc-devel``, ``cuda-opencl-devel``, ``cuda-profiler-api``, ``libcublas-devel``, ``libcufft-devel``, ``libcufile-devel``, ``libcurand-devel``, ``libcusolver-devel``, ``libcusparse-devel``, ``libnpp-devel``, ``libnvjitlink-devel``, ``libnvjpeg-devel``

If you need additional packages from CUDA toolkit to be included in the images, please feel free to create a `GitHub issue <https://github.com/ameli/manylinux-cuda/issues>`__.

NVIDIA Driver
=============

The Docker images do not include the NVIDIA driver to prevent incompatibility issues with the host system's native driver when used at runtime.

For users who might need specific components of the NVIDIA driver, such as ``libcuda.so``, to compile their code, the driver can be installed within the container using the following commands based on your image's base distribution:

* For ``manylinux2`` images:

  ::

      dnf -y install epel-release
      dnf -y module install nvidia-driver:latest-dkms

* For ``manylinux2014`` images:

  ::

      yum install nvidia-driver-latest-dkms

Note, however, that this step should generally be avoided unless strictly required, as it may lead to compatibility issues between the driver versions in the container and on the host system. If possible, it is recommended to rely on the host system's driver installation when running containers that require GPU access.

Environment Variables
=====================

The following environment variables are defined:

* ``PATH=/usr/local/cuda/bin:${PATH}``
* ``LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH}``
* ``CUDA_HOME=/usr/local/cuda``
* ``CUDA_ROOT=/usr/local/cuda``
* ``CUDA_PATH=/usr/local/cuda``
* ``CUDADIR=/usr/local/cuda``

Run Containers
==============

Run containers in interactive mode by:

::

    docker run -it sameli/manylinux_2_28_x86_64_cuda_12.3

Check CUDA Version
==================

The ``nvcc`` executable is available on the ``PATH``. To check the CUDA version, execute:

::

    docker run -t sameli/manylinux_2_28_x86_64_cuda_12.3 nvcc --version
    
The output of the above command is:

::

    Copyright (c) 2005-2022 NVIDIA Corporation
    Built on Mon_Oct_24_19:12:58_PDT_2022
    Cuda compilation tools, release 12.0, V12.0.76
    Build cuda_12.3.r12.0/compiler.31968024_0

Using Host's GPU
================

The primary purpose of these Docker images is to build code, such as Python wheels, using the *manylinux* standard. While this process does not require access to the host's GPU, you might want to use them at runtime on the host's GPU, particularly for testing purposes.

To access host's GPU device from the container, install *Nvidia Container Toolkit* as follows.

1. Add the package to the repository:

   ::

       distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
       curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
       curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

2. Install `nvidia-contaner-toolkit` by:

   ::
      
       sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit

3. Restart docker to be able to use it:

   ::

       sudo systemctl restart docker

To use host's GPU, add  ``--gpus all`` to any of the docker commands given before, such as:

::

    docker run --gpus all -it sameli/manylinux_2_28_x86_64_cuda_12.3

To check the host's NVIDIA driver version, CUDA runtime library version, and list of available GPU devices, run ``nvida-smi`` command, such as by:

::

    docker run --gpus all sameli/manylinux_2_28_x86_64_cuda_12.3 nvidia-smi


Troubleshooting
===============

When running the docker containers in GitHub action, you may encounter this error:

::

    no space left on device.

To resolve this, try clearing the GitHub's runner cache before executing the docker container:

::

    - name: Clear Cache
      run: rm -rf /opt/hostedtoolcache

Other CUDA Versions
===================

To request a docker image for a specific CUDA version or architecture, feel free to create a `GitHub issue <https://github.com/ameli/manylinux-cuda/issues>`__.

License
=======

|license|

.. |license| image:: https://img.shields.io/github/license/ameli/manylinux-cuda
   :target: https://opensource.org/licenses/BSD-3-Clause

.. |deploy-docker-manylinux2014_x86_64_cuda_10_2| image:: https://img.shields.io/github/actions/workflow/status/ameli/manylinux-cuda/deploy-docker-manylinux2014_x86_64_cuda_10.2.yml?label=build%20docker
   :target: https://github.com/ameli/manylinux-cuda/actions/workflows/deploy-docker-manylinux2014_x86_64_cuda_10.2.yml
.. |deploy-docker-manylinux2014_x86_64_cuda_11_7| image:: https://img.shields.io/github/actions/workflow/status/ameli/manylinux-cuda/deploy-docker-manylinux2014_x86_64_cuda_11.7.yml?label=build%20docker
   :target: https://github.com/ameli/manylinux-cuda/actions/workflows/deploy-docker-manylinux2014_x86_64_cuda_11.7.yml
.. |deploy-docker-manylinux2014_x86_64_cuda_11_8| image:: https://img.shields.io/github/actions/workflow/status/ameli/manylinux-cuda/deploy-docker-manylinux2014_x86_64_cuda_11.8.yml?label=build%20docker
   :target: https://github.com/ameli/manylinux-cuda/actions/workflows/deploy-docker-manylinux2014_x86_64_cuda_11.8.yml
.. |deploy-docker-manylinux2014_x86_64_cuda_12_0| image:: https://img.shields.io/github/actions/workflow/status/ameli/manylinux-cuda/deploy-docker-manylinux2014_x86_64_cuda_12.0.yml?label=build%20docker
   :target: https://github.com/ameli/manylinux-cuda/actions/workflows/deploy-docker-manylinux2014_x86_64_cuda_12.0.yml
.. |deploy-docker-manylinux2014_x86_64_cuda_12.3| image:: https://img.shields.io/github/actions/workflow/status/ameli/manylinux-cuda/deploy-docker-manylinux2014_x86_64_cuda_12.3.yml?label=build%20docker
   :target: https://github.com/ameli/manylinux-cuda/actions/workflows/deploy-docker-manylinux2014_x86_64_cuda_12.3.yml
.. |deploy-docker-manylinux_2_28_x86_64_cuda_12.3| image:: https://img.shields.io/github/actions/workflow/status/ameli/manylinux-cuda/deploy-docker-manylinux_2_28_x86_64_cuda_12.3.yml?label=build%20docker
   :target: https://github.com/ameli/manylinux-cuda/actions/workflows/deploy-docker-manylinux_2_28_x86_64_cuda_12.3.yml
.. |deploy-docker-manylinux2014_aarch64_cuda_12_3| image:: https://img.shields.io/cirrus/github/ameli/manylinux-cuda/main?label=build%20docker
   :target: https://cirrus-ci.com/github/ameli/manylinux-cuda
.. |deploy-docker-manylinux_2_28_aarch64_cuda_12_3| image:: https://img.shields.io/cirrus/github/ameli/manylinux-cuda/main?label=build%20docker
   :target: https://cirrus-ci.com/github/ameli/manylinux-cuda

.. |docker-pull-manylinux2014_x86_64_cuda_10_2| image:: https://img.shields.io/docker/pulls/sameli/manylinux2014_x86_64_cuda_10.2?color=green&label=downloads
   :target: https://hub.docker.com/r/sameli/manylinux2014_x86_64_cuda_10.2
.. |docker-pull-manylinux2014_x86_64_cuda_11_7| image:: https://img.shields.io/docker/pulls/sameli/manylinux2014_x86_64_cuda_11.7?color=green&label=downloads
   :target: https://hub.docker.com/r/sameli/manylinux2014_x86_64_cuda_11.7
.. |docker-pull-manylinux2014_x86_64_cuda_11_8| image:: https://img.shields.io/docker/pulls/sameli/manylinux2014_x86_64_cuda_11.8?color=green&label=downloads
   :target: https://hub.docker.com/r/sameli/manylinux2014_x86_64_cuda_11.8
.. |docker-pull-manylinux2014_x86_64_cuda_12_0| image:: https://img.shields.io/docker/pulls/sameli/manylinux2014_x86_64_cuda_12.0?color=green&label=downloads
   :target: https://hub.docker.com/r/sameli/manylinux2014_x86_64_cuda_12.0
.. |docker-pull-manylinux2014_x86_64_cuda_12.3| image:: https://img.shields.io/docker/pulls/sameli/manylinux2014_x86_64_cuda_12.3?color=green&label=downloads
   :target: https://hub.docker.com/r/sameli/manylinux2014_x86_64_cuda_12.3
.. |docker-pull-manylinux_2_28_x86_64_cuda_12.3| image:: https://img.shields.io/docker/pulls/sameli/manylinux_2_28_x86_64_cuda_12.3?color=green&label=downloads
   :target: https://hub.docker.com/r/sameli/manylinux_2_28_x86_64_cuda_12.3
.. |docker-pull-manylinux2014_aarch64_cuda_12_3| image:: https://img.shields.io/docker/pulls/sameli/manylinux2014_aarch64_cuda_12.3?color=green&label=downloads
   :target: https://hub.docker.com/r/sameli/manylinux2014_aarch64_cuda_12.3
.. |docker-pull-manylinux_2_28_aarch64_cuda_12_3| image:: https://img.shields.io/docker/pulls/sameli/manylinux_2_28_aarch64_cuda_12.3?color=green&label=downloads
   :target: https://hub.docker.com/r/sameli/manylinux_2_28_aarch64_cuda_12.3
