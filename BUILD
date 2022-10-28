load("@io_bazel_rules_scala//scala:scala.bzl", "scala_binary")
load("@io_bazel_rules_scala//jmh:jmh.bzl", "scala_benchmark_jmh")

DEPS = [
    "//3rdparty/jvm/org/openjdk/jmh:jmh_core",
]

scala_binary(
    name="helloworld",
    main_class="com.example.A",
    srcs=glob(["src/main/**/*.scala"]),
    deps= DEPS
)


scala_benchmark_jmh(
    name = "benchmark",
    srcs=glob(["src/main/scala/com/example/*.scala"]),
    deps= [":helloworld"] + DEPS
)
