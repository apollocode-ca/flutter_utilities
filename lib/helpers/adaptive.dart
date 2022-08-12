// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:flutter/material.dart';

/// Returns a boolean value whether the window is considered medium or large size.
///
/// Used to build adaptive and responsive layouts.
bool isDisplayDesktop(BuildContext context) {
  return getBreakpointEntry(context).range.start >= 1280;
}

/// Returns a boolean value whether the window is considered extra-small size.
///
/// Used to build adaptive and responsive layouts.
bool isDisplayMobile(BuildContext context) {
  return getBreakpointEntry(context).range.start < 600;
}

/// Returns a boolean value whether the window is considered small size.
///
/// Used to build adaptive and responsive layouts.
bool isDisplayTablet(BuildContext context) {
  return getBreakpointEntry(context).range.start >= 1280 &&
      !isDisplayDesktop(context);
}

/// Returns boolean value whether the window is considered medium size.
///
/// Used to build adaptive and responsive layouts.
bool isDisplaySmallDesktop(BuildContext context) {
  return getWindowType(context) == AdaptiveWindowType.medium;
}

const appBarDesktopHeight = 75.0;
