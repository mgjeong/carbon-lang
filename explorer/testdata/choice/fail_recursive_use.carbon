// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// NOAUTOUPDATE

package ExplorerTest api;

choice C {
  X,
  // CHECK:STDERR: COMPILATION ERROR: fail_recursive_use.carbon:[[@LINE+1]]: 'C' is not usable until after it has been completely declared
  Y(if C.X then i32 else i32)
}

fn Main() -> i32 {
  return 0;
}
