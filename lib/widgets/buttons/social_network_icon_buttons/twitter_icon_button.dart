import 'package:apollocode_flutter_utilities/enums/animation_type.dart';
import 'package:apollocode_flutter_utilities/widgets/buttons/social_network_icon_button.dart';
import 'package:apollocode_flutter_utilities/widgets/icons/social_network_icons/twitter_icon.dart';
import 'package:flutter/material.dart';

class TwitterIconButton extends StatefulWidget {
  final AnimationType animationType;
  final Color background;
  final double borderWidth;
  final Color foreground;
  final void Function() onTap;
  final Size size;

  const TwitterIconButton({
    required this.animationType,
    required this.background,
    required this.borderWidth,
    required this.foreground,
    required this.onTap,
    required this.size,
    Key? key,
  }) : super(key: key);

  @override
  State<TwitterIconButton> createState() => _State();
}

class _State extends State<TwitterIconButton> {
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
      icon: const TwitterIcon(),
      onTap: onTap,
      size: size,
    );
  }
}