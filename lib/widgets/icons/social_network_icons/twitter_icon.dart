import 'package:apollocode_flutter_utilities/widgets/icons/social_network_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TwitterIcon extends SocialNetworkIcon {
  const TwitterIcon({
    Color? color,
    Key? key,
  }) : super(color: color, key: key);

  @override
  SocialNetworkIcon copyWith({
    Color? color,
  }) {
    return TwitterIcon(
      color: color ?? this.color,
    );
  }

  @override
  State<TwitterIcon> createState() => _State();
}

class _State extends State<TwitterIcon> {
  Color? get color {
    return widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/twitter_icon.svg',
      clipBehavior: Clip.antiAlias,
      color: color,
      fit: BoxFit.fitWidth,
      package: 'apollocode_flutter_utilities',
    );
  }
}