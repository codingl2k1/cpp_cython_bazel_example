# Copyright 2021 The gRPC Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
"""Load dependencies needed to compile and test the grpc python library as a 3rd-party consumer."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//bazel/py:python_configure.bzl", "python_configure")

# buildifier: disable=unnamed-macro
def python_deps():
    """Loads dependencies for Python."""
    if "io_bazel_rules_python" not in native.existing_rules():
        http_archive(
            name = "io_bazel_rules_python",
            url = "https://github.com/bazelbuild/rules_python/releases/download/0.24.0/rules_python-0.24.0.tar.gz",
            sha256 = "0a8003b044294d7840ac7d9d73eef05d6ceb682d7516781a4ec62eeb34702578",
            strip_prefix = "rules_python-0.24.0",
        )

    python_configure(name = "local_config_python")

    native.bind(
        name = "python_headers",
        actual = "@local_config_python//:python_headers",
    )

    if "cython" not in native.existing_rules():
        http_archive(
            name = "cython",
            build_file = "//bazel:cython.BUILD",
            sha256 = "a2da56cc22be823acf49741b9aa3aa116d4f07fa8e8b35a3cb08b8447b37c607",
            strip_prefix = "cython-0.29.35",
            urls = [
                "https://github.com/cython/cython/archive/0.29.35.tar.gz",
            ],
        )
