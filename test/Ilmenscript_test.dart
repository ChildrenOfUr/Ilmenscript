// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library Ilmenscript.test;

import 'package:test/test.dart';

import 'package:Ilmenscript/Ilmenscript.dart';

void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });
}
