import 'package:flutter/material.dart';

extension AsyncSnapshotExtension<T> on AsyncSnapshot<T> {
  bool get isLoading {
    return connectionState == ConnectionState.waiting;
  }
}
