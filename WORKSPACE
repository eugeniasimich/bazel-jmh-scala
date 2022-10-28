# WORKSPACE
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

skylib_version = "1.1.1"
http_archive(
    name = "bazel_skylib",
    sha256 = "c6966ec828da198c5d9adbaa94c05e3a1c7f21bd012a0b29ba8ddbccb2c93b0d",
    type = "tar.gz",
    url = "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/{}/bazel-skylib-{}.tar.gz".format(skylib_version, skylib_version),
)



http_archive(
    name = "rules_python",
    sha256 = "a30abdfc7126d497a7698c29c46ea9901c6392d6ed315171a6df5ce433aa4502",
    strip_prefix = "rules_python-0.6.0",
    url = "https://github.com/bazelbuild/rules_python/archive/0.6.0.tar.gz",
)

http_archive(
    name = "rules_pkg",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_pkg/releases/download/0.7.1/rules_pkg-0.7.1.tar.gz",
        "https://github.com/bazelbuild/rules_pkg/releases/download/0.7.1/rules_pkg-0.7.1.tar.gz",
    ],
    sha256 = "451e08a4d78988c06fa3f9306ec813b836b1d076d0f055595444ba4ff22b867f",
)
load("@rules_pkg//:deps.bzl", "rules_pkg_dependencies")
rules_pkg_dependencies()

http_archive(
    name = "zlib",
    build_file = "@com_google_protobuf//:third_party/zlib.BUILD",
    sha256 = "b3a24de97a8fdbc835b9833169501030b8977031bcb54b3b3ac13740f846ab30",
    strip_prefix = "zlib-1.2.13",
    urls = [
        "https://mirror.bazel.build/zlib.net/zlib-1.2.13.tar.gz",
        "https://zlib.net/zlib-1.2.13.tar.gz",
    ],
)


protobuf_version="90b73ac3f0b10320315c2ca0d03a5a9b095d2f66"
protobuf_version_sha256="f5ba48be0fd7a32daa6900b9bbf90b1cb0af9fc696ee7d71455149898f46ee46"

http_archive(
    name = "com_google_protobuf",
    url = "https://github.com/protocolbuffers/protobuf/archive/%s.tar.gz" % protobuf_version,
    strip_prefix = "protobuf-%s" % protobuf_version,
    sha256 = protobuf_version_sha256,
)

#rules_scala_version="4ba3780fcba8d26980daff4639abc6f18517308b"
scala_version = "2.13.8"

http_archive(
    name = "io_bazel_rules_scala",
    url = "https://github.com/bazelbuild/rules_scala/releases/download/20220201/rules_scala-20220201.zip",
    type = "zip",
    strip_prefix = "rules_scala-20220201",
    sha256 = "77a3b9308a8780fff3f10cdbbe36d55164b85a48123033f5e970fdae262e8eb2",
)


load("@io_bazel_rules_scala//:scala_config.bzl", "scala_config")
scala_config(scala_version = scala_version)

load("@io_bazel_rules_scala//scala:scala.bzl", "scala_repositories")
scala_repositories(overriden_artifacts = {
   "io_bazel_rules_scala_scala_library": {
       "artifact": "org.scala-lang:scala-library:2.13.8",
       "sha256": "a0882b82514190c2bac7d1a459872a75f005fc0f3e88b2bc0390367146e35db7",
   },
   "io_bazel_rules_scala_scala_compiler": {
       "artifact": "org.scala-lang:scala-compiler:2.13.8",
       "sha256": "b248cb6f390ee8bceb912af3da471146fdf003702a173d750f986b1d4a3362e6",
   },
   "io_bazel_rules_scala_scala_reflect": {
       "artifact": "org.scala-lang:scala-reflect:2.13.8",
       "sha256": "fdfbcc92e87f424578b303bcb47e0f55fee990c4b6da0006c9e75879d1e442e4",
   },
}, fetch_sources = True)

load("@io_bazel_rules_scala//scala:toolchains.bzl", "scala_register_toolchains")
scala_register_toolchains()

load("@io_bazel_rules_scala//testing:scalatest.bzl", "scalatest_repositories", "scalatest_toolchain")
scalatest_repositories()
scalatest_toolchain()

load("@io_bazel_rules_scala//jmh:jmh.bzl", "jmh_repositories")
jmh_repositories()

load("//3rdparty:workspace.bzl", "maven_dependencies")
maven_dependencies()


RULES_JVM_EXTERNAL_TAG = "4.4.2"
RULES_JVM_EXTERNAL_SHA = "735602f50813eb2ea93ca3f5e43b1959bd80b213b836a07a62a29d757670b77b"

http_archive(
    name = "rules_jvm_external",
    strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
    sha256 = RULES_JVM_EXTERNAL_SHA,
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/refs/tags/%s.zip" % RULES_JVM_EXTERNAL_TAG,
)

load("@rules_jvm_external//:repositories.bzl", "rules_jvm_external_deps")

rules_jvm_external_deps()

load("@rules_jvm_external//:setup.bzl", "rules_jvm_external_setup")

rules_jvm_external_setup()

