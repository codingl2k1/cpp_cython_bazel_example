COPTS_WITHOUT_LOG = select({
    "//:opt": ["-DBAZEL_OPT"],
    "//conditions:default": [],
}) + select({
    "@bazel_tools//src/conditions:windows": [
    ],
    "//conditions:default": [
    ],
}) + select({
    "//:clang-cl": [
        "-Wno-builtin-macro-redefined",  # To get rid of warnings caused by deterministic build macros (e.g. #define __DATE__ "redacted")
        "-Wno-microsoft-unqualified-friend",  # This shouldn't normally be enabled, but otherwise we get: google/protobuf/map_field.h: warning: unqualified friend declaration referring to type outside of the nearest enclosing namespace is a Microsoft extension; add a nested name specifier (for: friend class DynamicMessage)
    ],
    "//conditions:default": [
    ],
})

COPTS = COPTS_WITHOUT_LOG

def copy_to_workspace(name, srcs, dstdir = ""):
    if dstdir.startswith("/") or dstdir.startswith("\\"):
        fail("Subdirectory must be a relative path: " + dstdir)
    src_locations = " ".join(["$(locations %s)" % (src,) for src in srcs])
    native.genrule(
        name = name,
        srcs = srcs,
        outs = [name + ".out"],
        cmd = r"""
            mkdir -p -- {dstdir}
            for f in {locations}; do
                rm -f -- {dstdir}$${{f##*/}}
                cp -f -- "$$f" {dstdir}
            done
            date > $@
        """.format(
            locations = src_locations,
            dstdir = "." + ("/" + dstdir.replace("\\", "/")).rstrip("/") + "/",
        ),
        local = 1,
        tags = ["no-cache"],
    )
