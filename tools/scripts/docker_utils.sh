# SPDX-FileCopyrightText: Copyright 2021, Siavash Ameli <sameli@berkeley.edu>
# SPDX-License-Identifier: BSD-3-Clause
# SPDX-FileType: SOURCE
#
# This program is free software: you can redistribute it and/or modify it
# under the terms of the license found in the LICENSE.txt file in the root
# directory of this source tree.


set -xe

# ==============
# install docker
# ==============

install_docker() {

    # Non-interactive mode
    # export DEBIAN_FRONTEND=noninteractive

    # Add Docker's official GPG key:
    sudo apt-get update
    sudo apt-get install ca-certificates curl gnupg -y
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg

    # Add the repository to Apt sources:
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update

    # Install latest version of docker
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

    # Check docker with hello world example
    sudo service docker start
    sudo docker run hello-world

    # Configure to use docker without sudo
    getent group docker || sudo groupadd docker
    sudo usermod -aG docker $USER

    # Check docker works without sudo
    docker run hello-world
}


# ================
# install anaconda
# ================

install_anaconda() {

    # Usage:
    # install_anaconda "linux_aarch64"
    # install_anaconda "linux_x86_64"
    # install_anaconda "macosx_arm64"

    MINICONDA_URL="https://repo.anaconda.com/miniconda/"
    if [ "$1" == "linux_aarch64" ];
    then
        URL=${MINICONDA_URL}"Miniconda3-latest-Linux-aarch64.sh"
    elif [ "$1" == "linux_x86_64" ];
    then
        URL=${MINICONDA_URL}"Miniconda3-latest-Linux-x86_64.sh"
    elif [ "$1" == "macosx_arm64" ];
    then
        URL=${MINICONDA_URL}"Miniconda3-latest-MacOSX-arm64.sh"
    else
        echo "OS or platform is invalid."
        # return 1;
    fi


    # install miniconda in the temp directory, not in the current directory,
    # because the source code of the package is in the current directory, and
    # if we also install miniconda3 in the same directory of the package source
    # code, when we use conda-build, it gives error as it also tries to build
    # miniconda as well as the code.
    TMP_DIR="/tmp"

    # install miniconda for uploading to anaconda
    wget -q ${URL} -O ${TMP_DIR}/miniconda.sh
    bash ${TMP_DIR}/miniconda.sh -b -p ${TMP_DIR}/miniconda3

    # Conda directories
    CONDA_BASE_DIR=${TMP_DIR}/miniconda3
    CONDA_BIN_DIR=${CONDA_BASE_DIR}/bin

    # Export PATH
    export PATH=${CONDA_BASE_DIR}:$PATH
    export PATH=${CONDA_BIN_DIR}:$PATH

    # Initialize conda
    # ${CONDA_BIN_DIR}/conda init bash
    # source ${CONDA_BIN_DIR}/activate
}


# =====================
# build upload anaconda
# =====================

build_upload_anaconda() {

    # Usage:
    # build_upload_anaconda "linux_aarch64"
    # build_upload_anaconda "linux_x86_64"
    # build_upload_anaconda "macosx_arm64"

    conda install -y anaconda-client conda-build

    # Anaconda account
    ANACONDA_USERNAME="s-ameli"

    # Upload sdist
    if compgen -G "./dist/*.gz"; then
        anaconda -t ${ANACONDA_API_TOKEN} upload --force \
            -u ${ANACONDA_USERNAME} ./dist/*.gz
    else
        echo "Dist files do not exist"
    fi

    # Determine the sub-directory where the conda builds the package depending
    # on the operating system and platform
    if [ "$1" == "linux_aarch64" ];
    then
        BUILD_SUBDIR="linux-aarch64"
    elif [ "$1" == "linux_x86_64" ];
    then
        BUILD_SUBDIR="linux-64"
    elif [ "$1" == "macosx_arm64" ];
    then
        BUILD_SUBDIR="osx-arm64"
    else
        echo "OS or platform is invalid."
        return 1;
    fi

    # Build wheels and upload them automatically
    if compgen -G "./dist/*.whl"; then
        conda-build --output-folder conda-bld .
        anaconda -t ${ANACONDA_API_TOKEN} upload --force \
            -u ${ANACONDA_USERNAME} conda-bld/${BUILD_SUBDIR}/*.tar.bz2
    else
        echo "Wheel files do not exist"
        return 1
    fi
}


# ==================
# upload wheels pypi
# ==================

upload_wheels_pypi() {

    # Install pip and twine
    python -m pip install --upgrade pip
    python -m pip install twine

    PYPI_USERNAME="__token__"

    if [[ -z ${PYPI_PASSWORD} ]]; then
        echo no pypi password set, not uploading
    else
        if compgen -G "./dist/*.whl"; then
            echo "Found wheel"
            twine upload ./dist/* -u ${PYPI_USERNAME} -p ${PYPI_PASSWORD} \
                --verbose
        else
            echo "Wheel files do not exist"
            return 1
        fi
    fi
}
