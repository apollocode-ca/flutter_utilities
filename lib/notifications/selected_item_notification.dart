import 'package:flutter/material.dart';

class SelectedItemNotification<T> extends Notification {
  final T value;

  SelectedItemNotification(
    this.value,
  );
}
