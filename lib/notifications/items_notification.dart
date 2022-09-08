import 'package:flutter/material.dart';

class ItemsNotification<T> extends Notification {
  final List<T> values;

  ItemsNotification(
    this.values,
  );
}
