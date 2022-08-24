import 'package:apollocode_flutter_utilities/helpers/adaptive.dart';
import 'package:apollocode_flutter_utilities/models/responsive_size.dart';
import 'package:flutter/material.dart';

class DimensionsHelper {
  static final _instances = <Enum, DimensionsHelper>{};

  static DimensionsHelper getInstance(
    BuildContext context,
    Enum figmaFrameType,
  ) {
    final instance = _instances[figmaFrameType];
    if (instance != null) {
      return instance;
    }
    throw StateError(
      'The "$figmaFrameType" instance of DimensionsHelper has not been '
      'initialized before to get it.',
    );
  }

  static void initialize(
    BuildContext context,
    Enum figmaFrameType, [
    Size? figmaDesktopSize,
    Size? figmaMobileSize,
  ]) {
    if (!_instances.containsKey(figmaFrameType)) {
      _instances[figmaFrameType] = DimensionsHelper._(
        context,
        figmaDesktopSize,
        figmaMobileSize,
      );
    }
  }

  late final BuildContext _context;
  late final ResponsiveSize _figmaFrameSizes;

  DimensionsHelper._(
    BuildContext context,
    Size? figmaDesktopSize,
    Size? figmaMobileSize,
  ) {
    _context = context;
    final desktopSize = figmaDesktopSize ?? mediaSize;
    _figmaFrameSizes = ResponsiveSize(
      desktop: desktopSize,
      mobile: figmaMobileSize ?? desktopSize,
    );
  }

  Size get _figmaFrameSize {
    if (isDisplayMobile(_context)) {
      return _figmaFrameSizes.mobile;
    }
    return _figmaFrameSizes.desktop;
  }

  double get _figmaFrameHeight {
    if (_figmaFrameSize.height != double.infinity) {
      return _figmaFrameSize.height;
    }
    return mediaSize.height;
  }

  double get _figmaFrameWidth {
    if (_figmaFrameSize.width != double.infinity) {
      return _figmaFrameSize.width;
    }
    return mediaSize.width;
  }

  Size get mediaSize {
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
      return validator.dimension / _figmaFrameHeight * mediaSize.height;
    }
    throw validator.error;
  }

  double scaleRadiusFrom({
    required double figmaRadius,
  }) {
    final scaledRadiusFromHeight = scaleHeightFrom(
      figmaHeight: figmaRadius,
    );
    final scaledRadiusFromWidth = scaleWidthFrom(
      figmaWidth: figmaRadius,
    );
    if (scaledRadiusFromHeight < scaledRadiusFromWidth) {
      return scaledRadiusFromHeight;
    }
    return scaledRadiusFromWidth;
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
      return validator.dimension / _figmaFrameWidth * mediaSize.width;
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
