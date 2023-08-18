"""Define project dependencies."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def deps_setup():
    """Install dependencies."""
    http_archive(
        name = "com_github_spdlog",
        build_file = "//bazel:BUILD.spdlog",
        urls = ["https://github.com/gabime/spdlog/archive/v1.12.0.zip"],
        strip_prefix = "spdlog-1.12.0",
        sha256 = "6174bf8885287422a6c6a0312eb8a30e8d22bcfcee7c48a6d02d1835d7769232",
    )

    http_archive(
        name = "bazel_common",
        url = "https://github.com/google/bazel-common/archive/084aadd3b854cad5d5e754a7e7d958ac531e6801.tar.gz",
        sha256 = "a6e372118bc961b182a3a86344c0385b6b509882929c6b12dc03bb5084c775d5",
    )

    http_archive(
        name = "bazel_skylib",
        sha256 = "66ffd9315665bfaafc96b52278f57c7e2dd09f5ede279ea6d39b2be471e7e3aa",
        url = "https://github.com/bazelbuild/bazel-skylib/releases/download/1.4.2/bazel-skylib-1.4.2.tar.gz",
    )

    # Boost
    # Famous C++ library that has given rise to many new additions to the C++ Standard Library
    # Makes @boost available for use: For example, add `@boost//:algorithm` to your deps.
    # For more, see https://github.com/nelhage/rules_boost and https://www.boost.org
    http_archive(
        name = "com_github_nelhage_rules_boost",

        # Replace the commit hash in both places (below) with the latest, rather than using the stale one here.
        # Even better, set up Renovate and let it do the work for you (see "Suggestion: Updates" in the README).
        url = "https://github.com/nelhage/rules_boost/archive/cfa585b1b5843993b70aa52707266dc23b3282d0.tar.gz",
        strip_prefix = "rules_boost-cfa585b1b5843993b70aa52707266dc23b3282d0",
        sha256 = "a7c42df432fae9db0587ff778d84f9dc46519d67a984eff8c79ae35e45f277c1",
        # When you first run this tool, it'll recommend a sha256 hash to put here with a message like: "DEBUG: Rule 'com_github_nelhage_rules_boost' indicated that a canonical reproducible form can be obtained by modifying arguments sha256 = ..."
    )

    http_archive(
        name = "com_google_googletest",
        url = "https://github.com/google/googletest/archive/refs/tags/v1.13.0.tar.gz",
        sha256 = "ad7fdba11ea011c1d925b3289cf4af2c66a352e18d4c7264392fead75e919363",
        strip_prefix = "googletest-1.13.0",
    )

    http_archive(
        name = "com_github_gflags_gflags",
        url = "https://github.com/gflags/gflags/archive/e171aa2d15ed9eb17054558e0b3a6a413bb01067.tar.gz",
        sha256 = "b20f58e7f210ceb0e768eb1476073d0748af9b19dfbbf53f4fd16e3fb49c5ac8",
    )

    http_archive(
        name = "cython",
        url = "https://github.com/cython/cython/archive/c48361d0a0969206e227ec016f654c9d941c2b69.tar.gz",
        sha256 = "37c466fea398da9785bc37fe16f1455d2645d21a72e402103991d9e2fa1c6ff3",
    )

    http_archive(
        name = "com_google_absl",
        url = "https://github.com/abseil/abseil-cpp/archive/refs/tags/20230802.0.zip",
        strip_prefix = "abseil-cpp-20230802.0",
        sha256 = "2942db09db29359e0c1982986167167d226e23caac50eea1f07b2eb2181169cf",
    )

    http_archive(
        name = "rules_foreign_cc",
        sha256 = "2a4d07cd64b0719b39a7c12218a3e507672b82a97b98c6a89d38565894cf7c51",
        strip_prefix = "rules_foreign_cc-0.9.0",
        url = "https://github.com/bazelbuild/rules_foreign_cc/archive/refs/tags/0.9.0.tar.gz",
    )

    http_archive(
        name = "rules_foreign_cc_thirdparty",
        sha256 = "2a4d07cd64b0719b39a7c12218a3e507672b82a97b98c6a89d38565894cf7c51",
        strip_prefix = "rules_foreign_cc-0.9.0/examples/third_party",
        url = "https://github.com/bazelbuild/rules_foreign_cc/archive/refs/tags/0.9.0.tar.gz",
    )

    http_archive(
        name = "msgpack",
        url = "https://github.com/msgpack/msgpack-c/archive/refs/tags/c-6.0.0.tar.gz",
    )

    http_archive(
        name = "nlohmann_json",
        strip_prefix = "json-3.9.1",
        urls = ["https://github.com/nlohmann/json/archive/v3.9.1.tar.gz"],
        sha256 = "4cf0df69731494668bdd6460ed8cb269b68de9c19ad8c27abc24cd72605b2d5b",
        build_file = "//bazel:BUILD.nlohmann_json",
    )
