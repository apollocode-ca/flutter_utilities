import 'package:apollocode_flutter_utilities/widgets/icons/social_network_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InstagramIcon extends SocialNetworkIcon {
  const InstagramIcon({
    Color? color,
    Size? size,
    Key? key,
  }) : super(color: color, key: key, size: size);

  @override
  SocialNetworkIcon copyWith({
    Color? color,
    Size? size,
  }) {
    return InstagramIcon(
      color: color ?? this.color,
      size: size ?? this.size,
    );
  }

  @override
  State<InstagramIcon> createState() => _State();
}

class _State extends State<InstagramIcon> {
  Color? get color {
    return widget.color;
  }

  Size? get size {
    return widget.size;
  }

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/instagram_icon.svg',
      clipBehavior: Clip.antiAlias,
      color: color,
      fit: BoxFit.fitHeight,
      height: size?.height,
      package: 'apollocode_flutter_utilities',
    );
  }
}
