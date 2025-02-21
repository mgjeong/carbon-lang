# Part of the Carbon Language project, under the Apache License v2.0 with LLVM
# Exceptions. See /LICENSE for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library", "cc_proto_library", "cc_test")
load("@rules_proto//proto:defs.bzl", "proto_library")

package(default_visibility = ["//visibility:public"])

proto_library(
    name = "carbon_proto",
    srcs = ["carbon.proto"],
)

cc_proto_library(
    name = "carbon_cc_proto",
    testonly = 1,
    deps = [":carbon_proto"],
)

# Header for LibFuzzer, does not provide the implementation which should come
# from some other source such as a fuzz test target.
cc_library(
    name = "libfuzzer_header",
    testonly = 1,
    hdrs = ["libfuzzer.h"],
)

cc_library(
    name = "proto_to_carbon_lib",
    testonly = 1,
    srcs = ["proto_to_carbon.cpp"],
    hdrs = ["proto_to_carbon.h"],
    deps = [
        ":carbon_cc_proto",
        "//common:error",
        "@llvm-project//llvm:Support",
        "@protobuf//:protobuf_headers",
    ],
)

cc_binary(
    name = "proto_to_carbon",
    testonly = 1,
    srcs = ["proto_to_carbon_main.cpp"],
    deps = [
        ":carbon_cc_proto",
        ":proto_to_carbon_lib",
        "//common:bazel_working_dir",
        "//common:error",
        "@llvm-project//llvm:Support",
        "@protobuf//:protobuf_headers",
    ],
)

cc_test(
    name = "proto_to_carbon_test",
    size = "small",
    srcs = ["proto_to_carbon_test.cpp"],
    deps = [
        ":carbon_cc_proto",
        ":proto_to_carbon_lib",
        "//common:error",
        "//testing/base:gtest_main",
        "@googletest//:gtest",
    ],
)
