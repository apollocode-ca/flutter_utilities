import 'package:flutter/material.dart';

abstract class Copyable<T extends Widget> {
  T copyWith(Size? sizeToRemove);
}
