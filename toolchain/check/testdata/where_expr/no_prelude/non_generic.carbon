// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE
// TIP: To test this file alone, run:
// TIP:   bazel test //toolchain/testing:file_test --test_arg=--file_tests=toolchain/check/testdata/where_expr/no_prelude/non_generic.carbon
// TIP: To dump output, run:
// TIP:   bazel run //toolchain/testing:file_test -- --dump_output --file_tests=toolchain/check/testdata/where_expr/no_prelude/non_generic.carbon

interface I { let T:! type; }

// Ensure that we don't crash when checking this `where` in a non-generic context.
fn NotGenericF(U: I where .T = {}) {}

// CHECK:STDOUT: --- non_generic.carbon
// CHECK:STDOUT:
// CHECK:STDOUT: constants {
// CHECK:STDOUT:   %.1: type = interface_type @I [template]
// CHECK:STDOUT:   %Self: %.1 = bind_symbolic_name Self, 0 [symbolic]
// CHECK:STDOUT:   %.2: type = assoc_entity_type %.1, type [template]
// CHECK:STDOUT:   %.3: %.2 = assoc_entity element0, @I.%T [template]
// CHECK:STDOUT:   %.Self: %.1 = bind_symbolic_name .Self, 0 [symbolic]
// CHECK:STDOUT:   %.4: type = tuple_type () [template]
// CHECK:STDOUT:   %.5: type = struct_type {} [template]
// CHECK:STDOUT:   %NotGenericF.type: type = fn_type @NotGenericF [template]
// CHECK:STDOUT:   %NotGenericF: %NotGenericF.type = struct_value () [template]
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: file {
// CHECK:STDOUT:   package: <namespace> = namespace [template] {
// CHECK:STDOUT:     .I = %I.decl
// CHECK:STDOUT:     .NotGenericF = %NotGenericF.decl
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %I.decl: type = interface_decl @I [template = constants.%.1] {} {}
// CHECK:STDOUT:   %NotGenericF.decl: %NotGenericF.type = fn_decl @NotGenericF [template = constants.%NotGenericF] {
// CHECK:STDOUT:     %U.patt: %.1 = binding_pattern U
// CHECK:STDOUT:   } {
// CHECK:STDOUT:     %I.ref: type = name_ref I, file.%I.decl [template = constants.%.1]
// CHECK:STDOUT:     %.Self: %.1 = bind_symbolic_name .Self, 0 [symbolic = constants.%.Self]
// CHECK:STDOUT:     %.Self.ref: %.1 = name_ref .Self, %.Self [symbolic = constants.%.Self]
// CHECK:STDOUT:     %T.ref: %.2 = name_ref T, @I.%.loc11 [template = constants.%.3]
// CHECK:STDOUT:     %.loc14_33: %.5 = struct_literal ()
// CHECK:STDOUT:     %.loc14_21: type = where_expr %.Self [template = constants.%.1] {
// CHECK:STDOUT:       requirement_rewrite %T.ref, %.loc14_33
// CHECK:STDOUT:     }
// CHECK:STDOUT:     %U.param: %.1 = param U, runtime_param0
// CHECK:STDOUT:     %U: %.1 = bind_name U, %U.param
// CHECK:STDOUT:   }
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: interface @I {
// CHECK:STDOUT:   %Self: %.1 = bind_symbolic_name Self, 0 [symbolic = constants.%Self]
// CHECK:STDOUT:   %T: type = assoc_const_decl T [template]
// CHECK:STDOUT:   %.loc11: %.2 = assoc_entity element0, %T [template = constants.%.3]
// CHECK:STDOUT:
// CHECK:STDOUT: !members:
// CHECK:STDOUT:   .Self = %Self
// CHECK:STDOUT:   .T = %.loc11
// CHECK:STDOUT:   witness = (%T)
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: fn @NotGenericF(%U: %.1) {
// CHECK:STDOUT: !entry:
// CHECK:STDOUT:   return
// CHECK:STDOUT: }
// CHECK:STDOUT:
