# cpp_cython_bazel_example
A simple example project for cpp + cython. The bazel files in this project are adopted from [Ray project](https://github.com/ray-project/ray) and [gRPC project](https://github.com/grpc/grpc).


## Project Structure

```
.
├── BUILD.bazel
├── README.md
├── WORKSPACE
├── bazel
│   ├── BUILD
│   ├── BUILD.nlohmann_json
│   ├── BUILD.spdlog
│   ├── cy
│   │   ├── BUILD
│   │   ├── cython.BUILD
│   │   └── cython_library.bzl
│   ├── deps_build_all.bzl
│   ├── deps_setup.bzl
│   ├── project.bzl
│   ├── py
│   │   ├── BUILD
│   │   ├── BUILD.tpl
│   │   ├── python_configure.bzl
│   │   └── variety.tpl
│   └── python_deps.bzl
├── cpp
│   ├── include
│   │   └── my_header.h
│   └── src
│       ├── my_lib.cpp
│       └── my_lib.h
└── python
    └── my_package
        ├── __init__.py
        ├── __pycache__
        │   └── __init__.cpython-311.pyc
        ├── _my_package.pxd
        ├── _my_package.pyx
        └── _my_package.so
```

Python `python/my_package` depends on `cpp`. The `bazel` directory are the build tools, you don't need to care about.

## Usage

- Write your own .h and .cpp in cpp directory.
- Rename the package directory `python/my_package` to `python/<your package name>`.
- Write your own .pxd and .pyx in `python/<your package name>` directory, you can reference the cpp files.
- Run `bazel build //:build` to build all, the so files will be copied into your python package directory.

## Advanced

- Add your cpp dependency in `bazel/deps_setup.bzl`.
