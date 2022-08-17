import 'package:apollocode_flutter_utilities/widgets/icons/social_network_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InstagramIcon extends SocialNetworkIcon {
  final double height;

  const InstagramIcon({
    Color? color,
    required this.height,
    Key? key,
  }) : super(color: color, key: key);

  @override
  SocialNetworkIcon copyWith({
    Color? color,
    double? height,
  }) {
    return InstagramIcon(
      color: color ?? this.color,
      height: height ?? this.height,
    );
  }

  @override
  State<InstagramIcon> createState() => _State();
}

class _State extends State<InstagramIcon> {
  Color? get color {
    return widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/instagram_icon.svg',
      clipBehavior: Clip.antiAlias,
      color: color,
      fit: BoxFit.fitHeight,
      height: widget.height,
      package: 'apollocode_flutter_utilities',
    );
  }
}
