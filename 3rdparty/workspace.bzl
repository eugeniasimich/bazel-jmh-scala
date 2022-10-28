# Do not edit. bazel-deps autogenerates this file from dependencies.yaml.
def _jar_artifact_impl(ctx):
    jar_name = "%s.jar" % ctx.name
    ctx.download(
        output = ctx.path("jar/%s" % jar_name),
        url = ctx.attr.urls,
        sha256 = ctx.attr.sha256,
        executable = False
    )
    src_name = "%s-sources.jar" % ctx.name
    srcjar_attr = ""
    has_sources = len(ctx.attr.src_urls) != 0
    if has_sources:
        ctx.download(
            output = ctx.path("jar/%s" % src_name),
            url = ctx.attr.src_urls,
            sha256 = ctx.attr.src_sha256,
            executable = False
        )
        srcjar_attr = '\n    srcjar = ":%s",' % src_name

    build_file_contents = """
package(default_visibility = ['//visibility:public'])
java_import(
    name = 'jar',
    tags = ['maven_coordinates={artifact}'],
    jars = ['{jar_name}'],{srcjar_attr}
)
filegroup(
    name = 'file',
    srcs = [
        '{jar_name}',
        '{src_name}'
    ],
    visibility = ['//visibility:public']
)\n""".format(artifact = ctx.attr.artifact, jar_name = jar_name, src_name = src_name, srcjar_attr = srcjar_attr)
    ctx.file(ctx.path("jar/BUILD"), build_file_contents, False)
    return None

jar_artifact = repository_rule(
    attrs = {
        "artifact": attr.string(mandatory = True),
        "sha256": attr.string(mandatory = True),
        "urls": attr.string_list(mandatory = True),
        "src_sha256": attr.string(mandatory = False, default=""),
        "src_urls": attr.string_list(mandatory = False, default=[]),
    },
    implementation = _jar_artifact_impl
)

def jar_artifact_callback(hash):
    src_urls = []
    src_sha256 = ""
    source=hash.get("source", None)
    if source != None:
        src_urls = [source["url"]]
        src_sha256 = source["sha256"]
    jar_artifact(
        artifact = hash["artifact"],
        name = hash["name"],
        urls = [hash["url"]],
        sha256 = hash["sha256"],
        src_urls = src_urls,
        src_sha256 = src_sha256
    )
    native.bind(name = hash["bind"], actual = hash["actual"])


def list_dependencies():
    return [
    {"artifact": "net.sf.jopt-simple:jopt-simple:4.6", "lang": "java", "sha1": "306816fb57cf94f108a43c95731b08934dcae15c", "sha256": "3fcfbe3203c2ea521bf7640484fd35d6303186ea2e08e72f032d640ca067ffda", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/net/sf/jopt-simple/jopt-simple/4.6/jopt-simple-4.6.jar", "source": {"sha1": "9cd14a61d7aa7d554f251ef285a6f2c65caf7b65", "sha256": "edceaf232b2480e282af8dd9509176507e1781bef92cd06800c2cefed917c85b", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/net/sf/jopt-simple/jopt-simple/4.6/jopt-simple-4.6-sources.jar"} , "name": "net_sf_jopt_simple_jopt_simple", "actual": "@net_sf_jopt_simple_jopt_simple//jar", "bind": "jar/net/sf/jopt_simple/jopt_simple"},
    {"artifact": "org.apache.commons:commons-math3:3.2", "lang": "java", "sha1": "ec2544ab27e110d2d431bdad7d538ed509b21e62", "sha256": "6268a9a0ea3e769fc493a21446664c0ef668e48c93d126791f6f3f757978fee2", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/apache/commons/commons-math3/3.2/commons-math3-3.2.jar", "source": {"sha1": "cd098e055bf192a60c81d81893893e6e31a6482f", "sha256": "b62d60712ea06fb6259506269b3a0ed73a7da5ee11f891c0eb0399eb9bc71e3f", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/apache/commons/commons-math3/3.2/commons-math3-3.2-sources.jar"} , "name": "org_apache_commons_commons_math3", "actual": "@org_apache_commons_commons_math3//jar", "bind": "jar/org/apache/commons/commons_math3"},
    {"artifact": "org.openjdk.jmh:jmh-core:1.26", "lang": "java", "sha1": "3a60bc5f3b6204cc52139e4cb8967f4209e115e3", "sha256": "1341c9f7f2d29e5977486f5339d3667c8080ed22d460fbad9443c7accead598c", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/openjdk/jmh/jmh-core/1.26/jmh-core-1.26.jar", "source": {"sha1": "23d295ed284f5c7e260c64ef271015998d76faf7", "sha256": "f0ea9f2d6a9d62104c7f8c9b95743a842eaa8e4212baee6c16a5f5f56f935e75", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/openjdk/jmh/jmh-core/1.26/jmh-core-1.26-sources.jar"} , "name": "org_openjdk_jmh_jmh_core", "actual": "@org_openjdk_jmh_jmh_core//jar", "bind": "jar/org/openjdk/jmh/jmh_core"},
    ]

def maven_dependencies(callback = jar_artifact_callback):
    for hash in list_dependencies():
        callback(hash)
