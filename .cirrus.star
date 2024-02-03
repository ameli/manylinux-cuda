# SPDX-FileCopyrightText: Copyright 2021, Siavash Ameli <sameli@berkeley.edu>
# SPDX-License-Identifier: BSD-3-Clause
# SPDX-FileType: SOURCE
#
# This program is free software: you can redistribute it and/or modify it
# under the terms of the license found in the LICENSE.txt file in the root
# directory of this source tree.


load("cirrus", "env", "fs", "http")

def main(ctx):

    file = ''
    file += fs.read("tools/ci/cirrus_deploy_docker_manylinux2014_aarch64_cuda_12.3.yml")
    file += fs.read("tools/ci/cirrus_deploy_docker_manylinux_2_28_aarch64_cuda_12.3.yml")

    return file
