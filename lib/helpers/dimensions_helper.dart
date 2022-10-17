import 'package:apollocode_flutter_utilities/helpers/adaptive.dart';
import 'package:apollocode_flutter_utilities/models/responsive_models/responsive_size.dart';
import 'package:flutter/material.dart';

export 'package:apollocode_flutter_utilities/extensions/border_extension.dart';
export 'package:apollocode_flutter_utilities/extensions/edge_insets_extension.dart';
export 'package:apollocode_flutter_utilities/extensions/offset_extension.dart';
export 'package:apollocode_flutter_utilities/extensions/size_extension.dart';
export 'package:apollocode_flutter_utilities/extensions/text_style_extension.dart';
export 'package:apollocode_flutter_utilities/extensions/vector3_extension.dart';

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
    ResponsiveSize? sizes,
  ]) {
    if (!_instances.containsKey(figmaFrameType)) {
      _instances[figmaFrameType] = DimensionsHelper._(context, sizes);
    }
  }

  late final BuildContext _context;
  late final ResponsiveSize _figmaFrameSizes;

  DimensionsHelper._(
    BuildContext context,
    ResponsiveSize? sizes,
  ) {
    _context = context;
    final desktopSize = sizes?.desktop ?? mediaSize;
    _figmaFrameSizes = ResponsiveSize(
      desktop: desktopSize,
      laptop: sizes?.laptop ?? desktopSize,
      mobile: sizes?.mobile ?? desktopSize,
    );
  }

  Size get _figmaFrameSize {
    return _figmaFrameSizes.getCurrentWith(this);
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

  bool get isDesktop {
    return mediaSize.width >= 1240;
  }

  bool get isLaptop {
    return mediaSize.width >= 904 && mediaSize.width < 1240;
  }

  bool get isMobile {
    return mediaSize.width < 600;
  }

  bool get isTablet {
    return mediaSize.width >= 600 && mediaSize.width < 904;
  }

  Size get mediaSize {
    return MediaQuery.of(_context).size;
  }

  double scaleHeightFrom({
    double? figmaHeight,
    Size? figmaSize,
    double? maxHeight,
    double? minHeight,
  }) {
    final validator = _ArgumentsValidator(
      figmaHeight,
      figmaSize,
      maxHeight,
      mediaSize,
      'scaleHeightFrom',
      minHeight,
    );
    if (validator.validate()) {
      return validator.dimension / _figmaFrameHeight * mediaSize.height;
    }
    throw validator.error;
  }

  double scaleRadiusFrom({
    required double figmaRadius,
    double? maxRadius,
    double? minRadius,
  }) {
    final scaledRadiusFromHeight = scaleHeightFrom(
      figmaHeight: figmaRadius,
      maxHeight: maxRadius,
      minHeight: minRadius,
    );
    final scaledRadiusFromWidth = scaleWidthFrom(
      figmaWidth: figmaRadius,
      maxWidth: maxRadius,
      minWidth: minRadius,
    );
    if (scaledRadiusFromHeight < scaledRadiusFromWidth) {
      return scaledRadiusFromHeight;
    }
    return scaledRadiusFromWidth;
  }

  double scaleWidthFrom({
    double? figmaWidth,
    Size? figmaSize,
    double? maxWidth,
    double? minWidth,
  }) {
    final validator = _ArgumentsValidator(
      figmaWidth,
      figmaSize,
      maxWidth,
      mediaSize,
      'scaleWidthFrom',
      minWidth,
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
  final double? maxDimension;
  final Size mediaSize;
  final String methodName;
  final double? minDimension;

  late final double dimension;
  late final Error error;

  _ArgumentsValidator(
    this.figmaDimension,
    this.figmaSize,
    this.maxDimension,
    this.mediaSize,
    this.methodName,
    this.minDimension,
  );

  String get argumentName {
    if (methodName == 'scaleHeightFrom') {
      return 'figmaHeight';
    }
    return 'figmaWidth';
  }

  double get lowerClampLimit {
    final minDimension = this.minDimension;
    if (minDimension != null) {
      return minDimension;
    }
    return double.negativeInfinity;
  }

  double get upperClampLimit {
    final maxDimension = this.maxDimension;
    if (maxDimension != null && maxDimension != double.infinity) {
      return maxDimension;
    }
    if (methodName == 'scaleHeightFrom') {
      return mediaSize.height;
    }
    return mediaSize.width;
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
      dimension = figmaDimension.clamp(lowerClampLimit, upperClampLimit);
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
      return figmaSize.height.clamp(lowerClampLimit, upperClampLimit);
    }
    return figmaSize.width.clamp(lowerClampLimit, upperClampLimit);
  }
}
