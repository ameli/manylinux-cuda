manylinux-cuda
**************

Dockerfiles containing an installation of **NVIDIA CUDA toolkit**, built on top of the following base images:

* For X86_64 architecture: `quay.io/pypa/manylinux2014_x86_64 <https://github.com/pypa/manylinux>`__
* For AARCH64 architecture: `quay.io/pypa/manylinux2014_aarch64 <https://github.com/pypa/manylinux>`__

Download Images
===============

Obtain the docker images from Dockerhub for the following CUDA versions:

X86_64 Architecture
-------------------

* For X86_64 arch and CUDA 10.2 (`see on Dockerhub <https://hub.docker.com/r/sameli/manylinux2014_x86_64_cuda_10.2>`__) |deploy-docker-manylinux2014_x86_64_cuda_10_2|

  ::

      docker pull sameli/manylinux2014_x86_64_cuda_10.2

* For X86_64 arch and CUDA 11.7 (`see on Dockerhub <https://hub.docker.com/r/sameli/manylinux2014_x86_64_cuda_11.7>`__) |deploy-docker-manylinux2014_x86_64_cuda_11_7|

  ::

      docker pull sameli/manylinux2014_x86_64_cuda_11.7

* For X86_64 arch and CUDA 11.8 (`see on Dockerhub <https://hub.docker.com/r/sameli/manylinux2014_x86_64_cuda_11.8>`__) |deploy-docker-manylinux2014_x86_64_cuda_11_8|

  ::

      docker pull sameli/manylinux2014_x86_64_cuda_11.8

* For X86_64 arch and CUDA 12.0 (`see on Dockerhub <https://hub.docker.com/r/sameli/manylinux2014_x86_64_cuda_12.0>`__) |deploy-docker-manylinux2014_x86_64_cuda_12_0|

  ::

      docker pull sameli/manylinux2014_x86_64_cuda_12.0

* For X86_64 arch and CUDA 12.2 (`see on Dockerhub <https://hub.docker.com/r/sameli/manylinux2014_x86_64_cuda_12.2>`__) |deploy-docker-manylinux2014_x86_64_cuda_12_2|

  ::

      docker pull sameli/manylinux2014_x86_64_cuda_12.2

AARCH64 Architecture
--------------------

* For AARCH64 arch and CUDA 12.3 (`see on Dockerhub <https://hub.docker.com/r/sameli/manylinux2014_aarch64_cuda_12.3>`__) |deploy-docker-manylinux2014_aarch64_cuda_12_3|

  ::

      docker pull sameli/manylinux2014_x86_64_cuda_12.2

Run Containers
==============

Run containers interactively:

X86_64 Architecture
-------------------

* For X86_64 arch and CUDA 10.2

  ::

      docker run -it sameli/manylinux2014_x86_64_cuda_10.2

* For X86_64 arch and CUDA 11.7

  ::

      docker run -it sameli/manylinux2014_x86_64_cuda_11.7

* For X86_64 arch and CUDA 11.8

  ::

      docker run -it sameli/manylinux2014_x86_64_cuda_11.8

* For X86_64 arch and CUDA 12.0

  ::

      docker run -it sameli/manylinux2014_x86_64_cuda_12.0

* For X86_64 arch and CUDA 12.2

  ::

      docker run -it sameli/manylinux2014_x86_64_cuda_12.2

AARCH64 Architecture
--------------------

* For AARCH64 arch and CUDA 12.3

  ::

      docker run -it sameli/manylinux2014_aarch64_cuda_12.3

Environment Variables
=====================

The following environment variables are defined:

* ``PATH=/usr/local/cuda/bin:${PATH}``
* ``CUDA_HOME=/usr/local/cuda``
* ``CUDA_ROOT=/usr/local/cuda``
* ``CUDA_PATH=/usr/local/cuda``
* ``CUDADIR=/usr/local/cuda``
* ``LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH}``

Check CUDA Version
==================

The ``nvcc`` executable is available on the ``PATH``. To check the CUDA version, run:

X86_64 Architecture
-------------------

* For X86_64 arch and CUDA 10.2:

  ::

      docker run -t sameli/manylinux2014_x86_64_cuda_10.2 nvcc --version

  The output of the above command is:

  ::

      nvcc: NVIDIA (R) Cuda compiler driver
      Copyright (c) 2005-2019 NVIDIA Corporation
      Built on Wed_Oct_23_19:24:38_PDT_2019
      Cuda compilation tools, release 10.2, V10.2.89
    
* For X86_64 arch and CUDA 11.7:

  ::

      docker run -t sameli/manylinux2014_x86_64_cuda_11.7 nvcc --version
    
  The output of the above command is:

  ::

      Copyright (c) 2005-2022 NVIDIA Corporation
      Built on Wed_Jun__8_16:49:14_PDT_2022
      Cuda compilation tools, release 11.7, V11.7.99
      Build cuda_11.7.r11.7/compiler.31442593_0

* For X86_64 arch and CUDA 11.8:

  ::

      docker run -t sameli/manylinux2014_x86_64_cuda_11.8 nvcc --version
    
  The output of the above command is:

  ::

      Copyright (c) 2005-2022 NVIDIA Corporation
      Built on Wed_Jun__8_16:49:14_PDT_2022
      Cuda compilation tools, release 11.8, V11.8.00
      Build cuda_11.8.r11.8/compiler.31442593_0

* For X86_64 arch and CUDA 12.0:

  ::

      docker run -t sameli/manylinux2014_x86_64_cuda_12.0 nvcc --version
    
  The output of the above command is:

  ::

      Copyright (c) 2005-2022 NVIDIA Corporation
      Built on Mon_Oct_24_19:12:58_PDT_2022
      Cuda compilation tools, release 12.0, V12.0.76
      Build cuda_12.0.r12.0/compiler.31968024_0

* For X86_64 arch and CUDA 12.2:

  ::

      docker run -t sameli/manylinux2014_x86_64_cuda_12.2 nvcc --version
    
  The output of the above command is:

  ::

      Copyright (c) 2005-2022 NVIDIA Corporation
      Built on Mon_Oct_24_19:12:58_PDT_2022
      Cuda compilation tools, release 12.0, V12.0.76
      Build cuda_12.2.r12.0/compiler.31968024_0

AARCH64 Architecture
--------------------

* For AARCH64 arch and CUDA 12.3:

  ::

      docker run -t sameli/manylinux2014_aarch64_cuda_12.3 nvcc --version
    
  The output of the above command is:

  ::

      Copyright (c) 2005-2023 NVIDIA Corporation
      Built on Fri_Nov__3_17:22:02_PDT_2023
      Cuda compilation tools, release 12.3, V12.3.103
      Build cuda_12.3.r12.3/compiler.33492891_0


How to Build Images
===================

Get this repository:

::

    git clone git@github.com:ameli/manylinux-cuda.git
    cd manylinux-cuda

Build docker with ``docker-compose``:

::

    sudo apt install docker-compose
    docker-compose build

Push to Dockerhub:

::

    docker login
    docker-compose push

Troubleshooting
===============

When running the docker container in Github action, you may encounter this error:

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
.. |deploy-docker-manylinux2014_x86_64_cuda_12_2| image:: https://img.shields.io/github/actions/workflow/status/ameli/manylinux-cuda/deploy-docker-manylinux2014_x86_64_cuda_12.2.yml?label=build%20docker
   :target: https://github.com/ameli/manylinux-cuda/actions/workflows/deploy-docker-manylinux2014_x86_64_cuda_12.2.yml
.. |deploy-docker-manylinux2014_aarch64_cuda_12_3| image:: https://api.cirrus-ci.com/github/ameli/manylinux-cuda.svg
   :target: https://cirrus-ci.com/github/ameli/manylinux-cuda

.. |docker-pull-manylinux2014_x86_64_cuda_10_2| image:: https://img.shields.io/docker/pulls/sameli/manylinux2014_x86_64_cuda_10.2?color=green&label=downloads
   :target: https://hub.docker.com/r/sameli/manylinux2014_x86_64_cuda_10.2
.. |docker-pull-manylinux2014_x86_64_cuda_11_7| image:: https://img.shields.io/docker/pulls/sameli/manylinux2014_x86_64_cuda_11.7?color=green&label=downloads
   :target: https://hub.docker.com/r/sameli/manylinux2014_x86_64_cuda_11.7
.. |docker-pull-manylinux2014_x86_64_cuda_11_8| image:: https://img.shields.io/docker/pulls/sameli/manylinux2014_x86_64_cuda_11.8?color=green&label=downloads
   :target: https://hub.docker.com/r/sameli/manylinux2014_x86_64_cuda_11.8
.. |docker-pull-manylinux2014_x86_64_cuda_12_0| image:: https://img.shields.io/docker/pulls/sameli/manylinux2014_x86_64_cuda_12.0?color=green&label=downloads
   :target: https://hub.docker.com/r/sameli/manylinux2014_x86_64_cuda_12.0
.. |docker-pull-manylinux2014_x86_64_cuda_12_2| image:: https://img.shields.io/docker/pulls/sameli/manylinux2014_x86_64_cuda_12.2?color=green&label=downloads
   :target: https://hub.docker.com/r/sameli/manylinux2014_x86_64_cuda_12.2
.. |docker-pull-manylinux2014_aarch64_cuda_12_3| image:: https://img.shields.io/docker/pulls/sameli/manylinux2014_aarch64_cuda_12.3?color=green&label=downloads
   :target: https://hub.docker.com/r/sameli/manylinux2014_aarch64_cuda_12.3
