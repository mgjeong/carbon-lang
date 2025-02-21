// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE
// TIP: To test this file alone, run:
// TIP:   bazel test //toolchain/testing:file_test --test_arg=--file_tests=toolchain/check/testdata/struct/literal_member_access.carbon
// TIP: To dump output, run:
// TIP:   bazel run //toolchain/testing:file_test -- --dump_output --file_tests=toolchain/check/testdata/struct/literal_member_access.carbon

fn G() -> {.x: i32, .y: i32, .z: i32};

fn F() -> i32 {
  return {.a = 1, .b = G(), .c = 3}.b.y;
}

// CHECK:STDOUT: --- literal_member_access.carbon
// CHECK:STDOUT:
// CHECK:STDOUT: constants {
// CHECK:STDOUT:   %Int32.type: type = fn_type @Int32 [template]
// CHECK:STDOUT:   %.1: type = tuple_type () [template]
// CHECK:STDOUT:   %Int32: %Int32.type = struct_value () [template]
// CHECK:STDOUT:   %.2: type = struct_type {.x: i32, .y: i32, .z: i32} [template]
// CHECK:STDOUT:   %G.type: type = fn_type @G [template]
// CHECK:STDOUT:   %G: %G.type = struct_value () [template]
// CHECK:STDOUT:   %F.type: type = fn_type @F [template]
// CHECK:STDOUT:   %F: %F.type = struct_value () [template]
// CHECK:STDOUT:   %.3: i32 = int_literal 1 [template]
// CHECK:STDOUT:   %.4: type = ptr_type %.2 [template]
// CHECK:STDOUT:   %.5: i32 = int_literal 3 [template]
// CHECK:STDOUT:   %.6: type = struct_type {.a: i32, .b: %.2, .c: i32} [template]
// CHECK:STDOUT:   %.7: type = struct_type {.a: i32, .b: %.4, .c: i32} [template]
// CHECK:STDOUT:   %.8: type = ptr_type %.7 [template]
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: imports {
// CHECK:STDOUT:   %Core: <namespace> = namespace file.%Core.import, [template] {
// CHECK:STDOUT:     .Int32 = %import_ref
// CHECK:STDOUT:     import Core//prelude
// CHECK:STDOUT:     import Core//prelude/operators
// CHECK:STDOUT:     import Core//prelude/types
// CHECK:STDOUT:     import Core//prelude/operators/arithmetic
// CHECK:STDOUT:     import Core//prelude/operators/as
// CHECK:STDOUT:     import Core//prelude/operators/bitwise
// CHECK:STDOUT:     import Core//prelude/operators/comparison
// CHECK:STDOUT:     import Core//prelude/types/bool
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %import_ref: %Int32.type = import_ref Core//prelude/types, inst+4, loaded [template = constants.%Int32]
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: file {
// CHECK:STDOUT:   package: <namespace> = namespace [template] {
// CHECK:STDOUT:     .Core = imports.%Core
// CHECK:STDOUT:     .G = %G.decl
// CHECK:STDOUT:     .F = %F.decl
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %Core.import = import Core
// CHECK:STDOUT:   %G.decl: %G.type = fn_decl @G [template = constants.%G] {} {
// CHECK:STDOUT:     %int.make_type_32.loc11_16: init type = call constants.%Int32() [template = i32]
// CHECK:STDOUT:     %.loc11_16.1: type = value_of_initializer %int.make_type_32.loc11_16 [template = i32]
// CHECK:STDOUT:     %.loc11_16.2: type = converted %int.make_type_32.loc11_16, %.loc11_16.1 [template = i32]
// CHECK:STDOUT:     %int.make_type_32.loc11_25: init type = call constants.%Int32() [template = i32]
// CHECK:STDOUT:     %.loc11_25.1: type = value_of_initializer %int.make_type_32.loc11_25 [template = i32]
// CHECK:STDOUT:     %.loc11_25.2: type = converted %int.make_type_32.loc11_25, %.loc11_25.1 [template = i32]
// CHECK:STDOUT:     %int.make_type_32.loc11_34: init type = call constants.%Int32() [template = i32]
// CHECK:STDOUT:     %.loc11_34.1: type = value_of_initializer %int.make_type_32.loc11_34 [template = i32]
// CHECK:STDOUT:     %.loc11_34.2: type = converted %int.make_type_32.loc11_34, %.loc11_34.1 [template = i32]
// CHECK:STDOUT:     %.loc11_37: type = struct_type {.x: i32, .y: i32, .z: i32} [template = constants.%.2]
// CHECK:STDOUT:     %return: ref %.2 = var <return slot>
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %F.decl: %F.type = fn_decl @F [template = constants.%F] {} {
// CHECK:STDOUT:     %int.make_type_32: init type = call constants.%Int32() [template = i32]
// CHECK:STDOUT:     %.loc13_11.1: type = value_of_initializer %int.make_type_32 [template = i32]
// CHECK:STDOUT:     %.loc13_11.2: type = converted %int.make_type_32, %.loc13_11.1 [template = i32]
// CHECK:STDOUT:     %return: ref i32 = var <return slot>
// CHECK:STDOUT:   }
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: fn @Int32() -> type = "int.make_type_32";
// CHECK:STDOUT:
// CHECK:STDOUT: fn @G() -> %.2;
// CHECK:STDOUT:
// CHECK:STDOUT: fn @F() -> i32 {
// CHECK:STDOUT: !entry:
// CHECK:STDOUT:   %.loc14_16: i32 = int_literal 1 [template = constants.%.3]
// CHECK:STDOUT:   %G.ref: %G.type = name_ref G, file.%G.decl [template = constants.%G]
// CHECK:STDOUT:   %.loc14_25.1: ref %.2 = temporary_storage
// CHECK:STDOUT:   %G.call: init %.2 = call %G.ref() to %.loc14_25.1
// CHECK:STDOUT:   %.loc14_34: i32 = int_literal 3 [template = constants.%.5]
// CHECK:STDOUT:   %.loc14_35.1: %.6 = struct_literal (%.loc14_16, %G.call, %.loc14_34)
// CHECK:STDOUT:   %.loc14_25.2: ref %.2 = temporary %.loc14_25.1, %G.call
// CHECK:STDOUT:   %.loc14_25.3: ref i32 = struct_access %.loc14_25.2, element0
// CHECK:STDOUT:   %.loc14_25.4: i32 = bind_value %.loc14_25.3
// CHECK:STDOUT:   %.loc14_25.5: ref i32 = struct_access %.loc14_25.2, element1
// CHECK:STDOUT:   %.loc14_25.6: i32 = bind_value %.loc14_25.5
// CHECK:STDOUT:   %.loc14_25.7: ref i32 = struct_access %.loc14_25.2, element2
// CHECK:STDOUT:   %.loc14_25.8: i32 = bind_value %.loc14_25.7
// CHECK:STDOUT:   %struct.loc14_25: %.2 = struct_value (%.loc14_25.4, %.loc14_25.6, %.loc14_25.8)
// CHECK:STDOUT:   %.loc14_35.2: %.2 = converted %G.call, %struct.loc14_25
// CHECK:STDOUT:   %struct.loc14_35: %.6 = struct_value (%.loc14_16, %.loc14_35.2, %.loc14_34)
// CHECK:STDOUT:   %.loc14_35.3: %.6 = converted %.loc14_35.1, %struct.loc14_35
// CHECK:STDOUT:   %.loc14_36: %.2 = struct_access %.loc14_35.3, element1
// CHECK:STDOUT:   %.loc14_38: i32 = struct_access %.loc14_36, element1
// CHECK:STDOUT:   return %.loc14_38
// CHECK:STDOUT: }
// CHECK:STDOUT:
