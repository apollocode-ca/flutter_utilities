import 'package:flutter/material.dart';

Size _getMediaSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

class DimensionsHelper {
  static late Map<String, DimensionsHelper> _instances;

  static DimensionsHelper getInstance(
    BuildContext context, [
    Size? figmaFrameSize,
  ]) {
    final key = _getInstanceKey(context, figmaFrameSize);
    final instance = _instances[key];
    if (instance != null) {
      return instance;
    }
    throw StateError(
      'DimensionsHelper must be initialized before to get an instance.',
    );
  }

  static void initialize(BuildContext context, [Size? figmaFrameSize]) {
    final key = _getInstanceKey(context, figmaFrameSize);
    if (!_instances.containsKey(key)) {
      _instances[key] = DimensionsHelper._(
        context,
        figmaFrameSize,
      );
    }
  }

  static String _getInstanceKey(BuildContext context, Size? figmaFrameSize) {
    if (figmaFrameSize != null) {
      return figmaFrameSize.toString();
    }
    return _getMediaSize(context).toString();
  }

  late final BuildContext _context;
  late final Size _figmaFrameSize;

  DimensionsHelper._(BuildContext context, Size? figmaFrameSize) {
    _context = context;
    _figmaFrameSize = figmaFrameSize ?? _mediaSize;
  }

  double get _figmaFrameHeight {
    if (_figmaFrameSize.height != double.infinity) {
      return _figmaFrameSize.height;
    }
    return _mediaSize.height;
  }

  double get _figmaFrameWidth {
    if (_figmaFrameSize.width != double.infinity) {
      return _figmaFrameSize.width;
    }
    return _mediaSize.width;
  }

  Size get _mediaSize {
    return _getMediaSize(_context);
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
      return validator.dimension / _figmaFrameHeight * _mediaSize.height;
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
      return validator.dimension / _figmaFrameWidth * _mediaSize.width;
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
