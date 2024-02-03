manylinux-cuda
**************

`manylinux <https://github.com/pypa/manylinux>`__ docker images featuring an installation of the **NVIDIA CUDA** compiler, runtime and development libraries, and the NVIDIA graphic driver, designed specifically for building Python wheels with a C++/CUDA backend.

Download Images
===============

Obtain the docker images from Dockerhub for the following CUDA versions:

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
* NVIDIA driver: ``nvidia-driver:latest-dkms`` (*see note below* :sup:`1`)

If you need additional packages from CUDA toolkit to be included in the images, please feel free to create a `GitHub issue <https://github.com/ameli/manylinux-cuda/issues>`__.

.. line-block::

    :sup:`1. NVIDIA driver is not available on manylinux2014 on AARCH64 arch. To use NVIDIA driver on AARCH64 arch, use manylinux_2_xx.`

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

Troubleshooting
===============

When running the docker containers in Github action, you may encounter this error:

::

    no space left on device.

To resolve this, try clearing the Github's runner cache before executing the docker container:

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
