import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:apollocode_flutter_utilities/widgets/icons/social_network_icon.dart';
import 'package:apollocode_flutter_utilities/widgets/images/responsive_image.dart';
import 'package:flutter/material.dart';

class TwitterIcon extends SocialNetworkIcon {
  const TwitterIcon({
    bool alwaysUsePng = false,
    bool alwaysUseSvg = false,
    Color? color,
    DimensionsHelper? helper,
    Key? key,
    Size? size,
  }) : super(
          alwaysUsePng: alwaysUsePng,
          alwaysUseSvg: alwaysUseSvg,
          color: color,
          helper: helper,
          key: key,
          size: size,
        );

  @override
  SocialNetworkIcon copyWith({
    Color? color,
    Size? size,
  }) {
    return TwitterIcon(
      color: color ?? this.color,
      size: size ?? this.size,
    );
  }

  @override
  State<TwitterIcon> createState() => _State();
}

class _State extends State<TwitterIcon> {
  bool get alwaysUsePng {
    return widget.alwaysUsePng;
  }

  bool get alwaysUseSvg {
    return widget.alwaysUseSvg;
  }

  Color? get color {
    return widget.color;
  }

  DimensionsHelper? get helper {
    return widget.helper;
  }

  Size? get size {
    return widget.size;
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveImage(
      'assets/icons/twitter_icon',
      alwaysUsePng: alwaysUsePng,
      alwaysUseSvg: alwaysUseSvg,
      clipBehavior: Clip.antiAlias,
      color: color,
      filterQuality: FilterQuality.high,
      fit: BoxFit.fitWidth,
      helper: helper,
      package: 'apollocode_flutter_utilities',
      width: size?.width,
    );
  }
}
