manylinux-cuda
**************

Dockerfiles to install **NVIDIA CUDA toolkit**, on the top of `quay.io/pypa/manylinux2014_x86_64 <https://github.com/pypa/manylinux>`__ docker image.

Download Images
===============

Obtain the docker images from Dockerhub for two CUDA versions **10.2**, **11.7**, **11.8**, and **12.0** respectively as follows.

* For CUDA 10.2 (`see on Dockerhub <https://hub.docker.com/r/sameli/manylinux2014_x86_64_cuda_10.2>`__) |deploy-docker-10-2|

  ::

      docker pull sameli/manylinux2014_x86_64_cuda_10.2

* For CUDA 11.7 (`see on Dockerhub <https://hub.docker.com/r/sameli/manylinux2014_x86_64_cuda_11.7>`__) |deploy-docker-11-7|

  ::

      docker pull sameli/manylinux2014_x86_64_cuda_11.7

* For CUDA 11.8 (`see on Dockerhub <https://hub.docker.com/r/sameli/manylinux2014_x86_64_cuda_11.8>`__) |deploy-docker-11-8|

  ::

      docker pull sameli/manylinux2014_x86_64_cuda_11.8

* For CUDA 12.0 (`see on Dockerhub <https://hub.docker.com/r/sameli/manylinux2014_x86_64_cuda_12.0>`__) |deploy-docker-12-0|

  ::

      docker pull sameli/manylinux2014_x86_64_cuda_12.0

* For CUDA 12.2 (`see on Dockerhub <https://hub.docker.com/r/sameli/manylinux2014_x86_64_cuda_12.2>`__) |deploy-docker-12-2|

  ::

      docker pull sameli/manylinux2014_x86_64_cuda_12.2

Run Containers
==============

To run the container interactively:

* For CUDA 10.2

  ::

      docker run -it sameli/manylinux2014_x86_64_cuda_10.2

* For CUDA 11.7

  ::

      docker run -it sameli/manylinux2014_x86_64_cuda_11.7

* For CUDA 11.8

  ::

      docker run -it sameli/manylinux2014_x86_64_cuda_11.8

* For CUDA 12.0

  ::

      docker run -it sameli/manylinux2014_x86_64_cuda_12.0

* For CUDA 12.2

  ::

      docker run -it sameli/manylinux2014_x86_64_cuda_12.2

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

* For CUDA 10.2:

  ::

      docker run -t sameli/manylinux2014_x86_64_cuda_10.2 nvcc --version

  The output of the above command is:

  ::

      nvcc: NVIDIA (R) Cuda compiler driver
      Copyright (c) 2005-2019 NVIDIA Corporation
      Built on Wed_Oct_23_19:24:38_PDT_2019
      Cuda compilation tools, release 10.2, V10.2.89
    
* For CUDA 11.7:

  ::

      docker run -t sameli/manylinux2014_x86_64_cuda_11.7 nvcc --version
    
  The output of the above command is:

  ::

      Copyright (c) 2005-2022 NVIDIA Corporation
      Built on Wed_Jun__8_16:49:14_PDT_2022
      Cuda compilation tools, release 11.7, V11.7.99
      Build cuda_11.7.r11.7/compiler.31442593_0

* For CUDA 11.8:

  ::

      docker run -t sameli/manylinux2014_x86_64_cuda_11.8 nvcc --version
    
  The output of the above command is:

  ::

      Copyright (c) 2005-2022 NVIDIA Corporation
      Built on Wed_Jun__8_16:49:14_PDT_2022
      Cuda compilation tools, release 11.8, V11.8.00
      Build cuda_11.8.r11.8/compiler.31442593_0

* For CUDA 12.0:

  ::

      docker run -t sameli/manylinux2014_x86_64_cuda_12.0 nvcc --version
    
  The output of the above command is:

  ::

      Copyright (c) 2005-2022 NVIDIA Corporation
      Built on Mon_Oct_24_19:12:58_PDT_2022
      Cuda compilation tools, release 12.0, V12.0.76
      Build cuda_12.0.r12.0/compiler.31968024_0

* For CUDA 12.2:

  ::

      docker run -t sameli/manylinux2014_x86_64_cuda_12.2 nvcc --version
    
  The output of the above command is:

  ::

      Copyright (c) 2005-2022 NVIDIA Corporation
      Built on Mon_Oct_24_19:12:58_PDT_2022
      Cuda compilation tools, release 12.0, V12.0.76
      Build cuda_12.2.r12.0/compiler.31968024_0


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

Other CUDA Versions
===================

To request a docker image for a specific CUDA version, feel free to create a `GitHub issue <https://github.com/ameli/manylinux-cuda/issues>`_.

License
=======

|license|

.. |license| image:: https://img.shields.io/github/license/ameli/manylinux-cuda
   :target: https://opensource.org/licenses/BSD-3-Clause

.. |deploy-docker-10-2| image:: https://img.shields.io/github/actions/workflow/status/ameli/manylinux-cuda/deploy-docker-10-2.yml?label=build%20docker
   :target: https://github.com/ameli/manylinux-cuda/actions?query=workflow%3Adeploy-docker-10-2
.. |deploy-docker-11-7| image:: https://img.shields.io/github/actions/workflow/status/ameli/manylinux-cuda/deploy-docker-11-7.yml?label=build%20docker
   :target: https://github.com/ameli/manylinux-cuda/actions?query=workflow%3Adeploy-docker-11-7
.. |deploy-docker-11-8| image:: https://img.shields.io/github/actions/workflow/status/ameli/manylinux-cuda/deploy-docker-11-8.yml?label=build%20docker
   :target: https://github.com/ameli/manylinux-cuda/actions?query=workflow%3Adeploy-docker-11-8
.. |deploy-docker-12-0| image:: https://img.shields.io/github/actions/workflow/status/ameli/manylinux-cuda/deploy-docker-12-0.yml?label=build%20docker
   :target: https://github.com/ameli/manylinux-cuda/actions?query=workflow%3Adeploy-docker-12-0
.. |deploy-docker-12-2| image:: https://img.shields.io/github/actions/workflow/status/ameli/manylinux-cuda/deploy-docker-12-2.yml?label=build%20docker
   :target: https://github.com/ameli/manylinux-cuda/actions?query=workflow%3Adeploy-docker-12-2

.. |docker-pull-10-2| image:: https://img.shields.io/docker/pulls/sameli/manylinux2014_x86_64_cuda_10.2?color=green&label=downloads
   :target: https://hub.docker.com/r/sameli/manylinux2014_x86_64_cuda_10.2
.. |docker-pull-11-7| image:: https://img.shields.io/docker/pulls/sameli/manylinux2014_x86_64_cuda_11.7?color=green&label=downloads
   :target: https://hub.docker.com/r/sameli/manylinux2014_x86_64_cuda_11.7
.. |docker-pull-11-8| image:: https://img.shields.io/docker/pulls/sameli/manylinux2014_x86_64_cuda_11.8?color=green&label=downloads
   :target: https://hub.docker.com/r/sameli/manylinux2014_x86_64_cuda_11.8
.. |docker-pull-12-0| image:: https://img.shields.io/docker/pulls/sameli/manylinux2014_x86_64_cuda_12.0?color=green&label=downloads
   :target: https://hub.docker.com/r/sameli/manylinux2014_x86_64_cuda_12.0
.. |docker-pull-12-2| image:: https://img.shields.io/docker/pulls/sameli/manylinux2014_x86_64_cuda_12.2?color=green&label=downloads
   :target: https://hub.docker.com/r/sameli/manylinux2014_x86_64_cuda_12.2
