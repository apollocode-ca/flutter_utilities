import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiscordIcon extends StatefulWidget {
  final Color? color;

  const DiscordIcon({
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  State<DiscordIcon> createState() => _State();
}

class _State extends State<DiscordIcon> {
  Color? get color {
    return widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/discord_icon.svg',
      clipBehavior: Clip.antiAlias,
      color: color,
      package: 'apollocode_flutter_utilities',
    );
  }
}
