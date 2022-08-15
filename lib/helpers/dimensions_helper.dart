import 'package:flutter/material.dart';

class DimensionsHelper {
  static late DimensionsHelper _instance;
  static bool _isInitialized = false;

  static void initialize(BuildContext context, Size figmaFrameSize) {
    _instance = DimensionsHelper._(context, figmaFrameSize);
    _isInitialized = true;
  }

  static DimensionsHelper get instance {
    if (_isInitialized) {
      return _instance;
    }
    throw StateError(
      'DimensionsHelper must be initialized before to get an instance.',
    );
  }

  late final BuildContext _context;
  late final Size _figmaFrameSize;

  DimensionsHelper._(BuildContext context, Size figmaFrameSize) {
    _context = context;
    _figmaFrameSize = figmaFrameSize;
  }

  Size get _mediaSize {
    return MediaQuery.of(_context).size;
  }

  double scaleHeightFrom({
    double? figmaHeight,
    Size? figmaSize,
  }) {
    final validator = _ArgumentsValidator(
      figmaHeight,
      figmaSize,
      'scaleHeightFrom',
    );
    if (validator.validate()) {
      return validator.dimension / _figmaFrameSize.height * _mediaSize.height;
    }
    throw validator.error;
  }

  double scaleWidthFrom({
    double? figmaWidth,
    Size? figmaSize,
  }) {
    final validator = _ArgumentsValidator(
      figmaWidth,
      figmaSize,
      'scaleWidthFrom',
    );
    if (validator.validate()) {
      return validator.dimension / _figmaFrameSize.width * _mediaSize.width;
    }
    throw validator.error;
  }
}

class _ArgumentsValidator {
  final double? figmaDimension;
  final Size? figmaSize;
  final String methodName;

  late final double dimension;
  late final Error error;

  _ArgumentsValidator(
    this.figmaDimension,
    this.figmaSize,
    this.methodName,
  );

  String get argumentName {
    if (methodName == 'scaleHeightFrom') {
      return 'figmaHeight';
    }
    return 'figmaWidth';
  }

  bool validate() {
    final figmaDimension = this.figmaDimension;
    final figmaSize = this.figmaSize;

    if (figmaDimension != null && figmaSize != null) {
      error = ArgumentError(
        'At most one of the following arguments must be provided: '
        '[figmaSize, $argumentName].',
      );
      return false;
    }

    if (figmaDimension != null) {
      dimension = figmaDimension;
      return true;
    }

    if (figmaSize != null) {
      dimension = getDimensionFrom(figmaSize);
      return true;
    }

    error = ArgumentError(
      'At least one of the following arguments must be provided: ',
      '[figmaSize, $argumentName].',
    );
    return false;
  }

  double getDimensionFrom(Size figmaSize) {
    if (methodName == 'scaleHeightFrom') {
      return figmaSize.height;
    }
    return figmaSize.width;
  }
}
