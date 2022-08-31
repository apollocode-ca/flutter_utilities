import 'package:apollocode_flutter_utilities/helpers/dimensions_helper.dart';
import 'package:flutter/material.dart';

abstract class SocialNetworkIcon extends StatefulWidget {
  final bool alwaysUsePng;
  final bool alwaysUseSvg;
  final Color? color;
  final DimensionsHelper? helper;
  final Size? size;

  const SocialNetworkIcon({
    this.alwaysUsePng = false,
    this.alwaysUseSvg = false,
    this.color,
    this.helper,
    Key? key,
    this.size,
  }) : super(key: key);

  SocialNetworkIcon copyWith({
    Color? color,
    Size? size,
  });
}
