import 'package:apollocode_flutter_utilities/enums/animation_type.dart';
import 'package:apollocode_flutter_utilities/widgets/buttons/social_network_icon_button.dart';
import 'package:apollocode_flutter_utilities/widgets/icons/social_network_icons/discord_icon.dart';
import 'package:flutter/material.dart';

class DiscordIconButton extends StatefulWidget {
  final AnimationType animationType;
  final Color background;
  final double borderWidth;
  final Color foreground;
  final EdgeInsets? margin;
  final void Function() onTap;
  final Size size;

  const DiscordIconButton({
    required this.animationType,
    required this.background,
    required this.borderWidth,
    required this.foreground,
    this.margin,
    required this.onTap,
    required this.size,
    Key? key,
  }) : super(key: key);

  @override
  State<DiscordIconButton> createState() => _State();
}

class _State extends State<DiscordIconButton> {
  AnimationType get animationType {
    return widget.animationType;
  }

  Color get background {
    return widget.background;
  }

  double get borderWidth {
    return widget.borderWidth;
  }

  Color get foreground {
    return widget.foreground;
  }

  EdgeInsets? get margin {
    return widget.margin;
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
      animationType: animationType,
      background: background,
      borderWidth: borderWidth,
      foreground: foreground,
      icon: const DiscordIcon(),
      margin: margin,
      onTap: onTap,
      size: size,
    );
  }
}
