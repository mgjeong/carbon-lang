// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// NOAUTOUPDATE

package ExplorerTest impl;

fn Main() -> i32 {
  var my_array : [i32; 1];
  // CHECK:STDERR: COMPILATION ERROR: fail_print_uninitalized_array_element.carbon:[[@LINE+1]]: use of uninitialized variable my_array
  Print("{0}", my_array[0]);
  return 0;
}
