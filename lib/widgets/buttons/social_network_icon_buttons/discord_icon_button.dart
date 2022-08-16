import 'package:apollocode_flutter_utilities/widgets/buttons/social_network_icon_button.dart';
import 'package:apollocode_flutter_utilities/widgets/icons/social_network_icons/discord_icon.dart';
import 'package:flutter/material.dart';

class DiscordIconButton extends StatefulWidget {
  final Color background;
  final double borderWidth;
  final Color foreground;
  final void Function() onTap;
  final Size size;

  const DiscordIconButton({
    required this.background,
    required this.borderWidth,
    required this.foreground,
    required this.onTap,
    required this.size,
    Key? key,
  }) : super(key: key);

  @override
  State<DiscordIconButton> createState() => _State();
}

class _State extends State<DiscordIconButton> {
  Color get background {
    return widget.background;
  }

  double get borderWidth {
    return widget.borderWidth;
  }

  Color get foreground {
    return widget.foreground;
  }

  void Function() get onTap {
    return widget.onTap;
  }

  Size get size {
    return widget.size;
  }

  @override
  Widget build(BuildContext context) {
    return SocialNetworkIconButton(
      background: background,
      borderWidth: borderWidth,
      foreground: foreground,
      icon: const DiscordIcon(),
      onTap: onTap,
      size: size,
    );
  }
}
