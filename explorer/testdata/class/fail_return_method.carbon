// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// NOAUTOUPDATE

package ExplorerTest api;

class C {
  fn F() {}
  fn G[self: Self]() {}
}

fn ReturnF() -> auto { return C.F; }
// CHECK:STDERR: COMPILATION ERROR: fail_return_method.carbon:[[@LINE+1]]: member name G can only be used in a member access or alias
fn ReturnG() -> auto { return C.G; }

fn Main() -> i32 {
  return 0;
}
