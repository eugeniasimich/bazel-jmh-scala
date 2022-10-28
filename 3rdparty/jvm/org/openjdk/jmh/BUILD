load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library", "scala_binary", "scala_test")
java_library(
    name = "jmh_core",
    exports = [
        "//external:jar/org/openjdk/jmh/jmh_core"
    ],
    runtime_deps = [
        "//3rdparty/jvm/net/sf/jopt_simple:jopt_simple",
        "//3rdparty/jvm/org/apache/commons:commons_math3"
    ],
    visibility = [
        "//visibility:public"
    ]
)


