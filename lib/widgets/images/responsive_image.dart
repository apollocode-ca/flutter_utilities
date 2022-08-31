import 'package:apollocode_flutter_utilities/helpers/adaptive.dart';
import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResponsiveImage extends StatefulWidget {
  final AlignmentGeometry alignment;
  final bool allowDrawingOutsideViewBox;
  final bool alwaysUsePng;
  final bool alwaysUseSvg;
  final AssetBundle? bundle;
  final bool cacheColorFilter;
  final int? cacheHeight;
  final int? cacheWidth;
  final Rect? centerSlice;
  final Clip clipBehavior;
  final Color? color;
  final BlendMode? colorBlendMode;
  final Widget Function(BuildContext, Object, StackTrace?)? errorBuilder;
  final bool excludeFromSemantics;
  final FilterQuality filterQuality;
  final BoxFit? fit;
  final Widget Function(BuildContext, Widget, int?, bool)? frameBuilder;
  final bool gaplessPlayback;
  final double? height;
  final DimensionsHelper? helper;
  final bool isAntiAlias;
  final bool matchTextDirection;
  final String name;
  final Animation<double>? opacity;
  final String? package;
  final Widget Function(BuildContext)? placeholderBuilder;
  final ImageRepeat repeat;
  final double? scale;
  final String? semanticLabel;
  final SvgTheme? theme;
  final double? width;

  const ResponsiveImage(
    this.name, {
    this.alignment = Alignment.center,
    this.allowDrawingOutsideViewBox = false,
    this.alwaysUsePng = false,
    this.alwaysUseSvg = false,
    this.bundle,
    this.cacheColorFilter = false,
    this.cacheHeight,
    this.cacheWidth,
    this.centerSlice,
    this.clipBehavior = Clip.hardEdge,
    this.color,
    this.colorBlendMode,
    this.errorBuilder,
    this.excludeFromSemantics = false,
    this.filterQuality = FilterQuality.low,
    this.fit,
    this.frameBuilder,
    this.gaplessPlayback = false,
    this.height,
    this.helper,
    this.isAntiAlias = false,
    Key? key,
    this.matchTextDirection = false,
    this.opacity,
    this.package,
    this.placeholderBuilder,
    this.repeat = ImageRepeat.noRepeat,
    this.scale,
    this.semanticLabel,
    this.theme,
    this.width,
  }) : super(key: key);

  @override
  State<ResponsiveImage> createState() => _State();
}

class _State extends State<ResponsiveImage> {
  static final RegExp extensionRegExp = RegExp(r'.png|.svg');

  AlignmentGeometry get alignment {
    return widget.alignment;
  }

  bool get allowDrawingOutsideViewBox {
    return widget.allowDrawingOutsideViewBox;
  }

  bool get alwaysUsePng {
    return widget.alwaysUsePng;
  }

  bool get alwaysUseSvg {
    return widget.alwaysUseSvg;
  }

  AssetBundle? get bundle {
    return widget.bundle;
  }

  bool get cacheColorFilter {
    return widget.cacheColorFilter;
  }

  int? get cacheHeight {
    return widget.cacheHeight;
  }

  int? get cacheWidth {
    return widget.cacheWidth;
  }

  Rect? get centerSlice {
    return widget.centerSlice;
  }

  Clip get clipBehavior {
    if (isAntiAlias) {
      return Clip.antiAlias;
    }
    return widget.clipBehavior;
  }

  Color? get color {
    return widget.color;
  }

  BlendMode? get colorBlendMode {
    return widget.colorBlendMode;
  }

  Widget Function(BuildContext, Object, StackTrace?)? get errorBuilder {
    return widget.errorBuilder;
  }

  bool get excludeFromSemantics {
    return widget.excludeFromSemantics;
  }

  FilterQuality get filterQuality {
    return widget.filterQuality;
  }

  BoxFit? get fit {
    return widget.fit;
  }

  Widget Function(BuildContext, Widget, int?, bool)? get frameBuilder {
    return widget.frameBuilder;
  }

  bool get gaplessPlayback {
    return widget.gaplessPlayback;
  }

  double? get height {
    return widget.height;
  }

  DimensionsHelper? get helper {
    return widget.helper;
  }

  bool get isAntiAlias {
    if (clipBehavior == Clip.antiAlias) {
      return true;
    }
    return widget.isAntiAlias;
  }

  bool get isMobile {
    return helper?.isMobile ?? isDisplayMobile(context);
  }

  Key? get key {
    return widget.key;
  }

  bool get matchTextDirection {
    return widget.matchTextDirection;
  }

  String get name {
    return widget.name.replaceAll(extensionRegExp, '');
  }

  Animation<double>? get opacity {
    return widget.opacity;
  }

  String? get package {
    return widget.package;
  }

  Widget Function(BuildContext)? get placeholderBuilder {
    return widget.placeholderBuilder;
  }

  Widget get pngImage {
    return Image.asset(
      '$name.png',
      alignment: alignment,
      bundle: bundle,
      cacheHeight: cacheHeight,
      cacheWidth: cacheWidth,
      centerSlice: centerSlice,
      color: color,
      colorBlendMode: colorBlendMode,
      errorBuilder: errorBuilder,
      excludeFromSemantics: excludeFromSemantics,
      filterQuality: filterQuality,
      fit: fit,
      frameBuilder: frameBuilder,
      gaplessPlayback: gaplessPlayback,
      height: height,
      isAntiAlias: isAntiAlias,
      key: key,
      matchTextDirection: matchTextDirection,
      opacity: opacity,
      package: package,
      repeat: repeat,
      scale: scale,
      semanticLabel: semanticLabel,
      width: width,
    );
  }

  ImageRepeat get repeat {
    return widget.repeat;
  }

  double? get scale {
    return widget.scale;
  }

  String? get semanticLabel {
    return widget.semanticLabel;
  }

  Widget get svgImage {
    return SvgPicture.asset(
      '$name.svg',
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      bundle: bundle,
      cacheColorFilter: cacheColorFilter,
      clipBehavior: clipBehavior,
      color: color,
      colorBlendMode: colorBlendMode ?? BlendMode.srcIn,
      excludeFromSemantics: excludeFromSemantics,
      fit: fit ?? BoxFit.contain,
      height: height,
      key: key,
      matchTextDirection: matchTextDirection,
      package: package,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticLabel,
      theme: theme,
      width: width,
    );
  }

  SvgTheme? get theme {
    return widget.theme;
  }

  double? get width {
    return widget.width;
  }

  void checkAlwaysUseProperties() {
    final alwaysUsePropertiesBothTrue = alwaysUsePng && alwaysUseSvg;
    assert(
      !alwaysUsePropertiesBothTrue,
      '"alwaysUsePng" and "alwaysUseSvg" can\'t be both true',
    );
  }

  @override
  void initState() {
    super.initState();
    checkAlwaysUseProperties();
  }

  @override
  void didUpdateWidget(covariant ResponsiveImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    checkAlwaysUseProperties();
  }

  @override
  Widget build(BuildContext context) {
    if (alwaysUsePng) {
      return pngImage;
    }
    if (alwaysUseSvg) {
      return svgImage;
    }
    if (isMobile) {
      return pngImage;
    }
    return svgImage;
  }
}
