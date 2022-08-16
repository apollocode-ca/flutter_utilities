import 'package:apollocode_flutter_utilities/widgets/clickable.dart';
import 'package:apollocode_flutter_utilities/widgets/icons/social_network_icon.dart';
import 'package:flutter/material.dart';

class SocialNetworkIconButton extends StatefulWidget {
  final Color background;
  final double borderWidth;
  final SocialNetworkIcon icon;
  final Color foreground;
  final void Function() onTap;
  final Size size;

  const SocialNetworkIconButton({
    required this.background,
    required this.borderWidth,
    required this.foreground,
    required this.icon,
    required this.onTap,
    required this.size,
    Key? key,
  }) : super(key: key);

  @override
  State<SocialNetworkIconButton> createState() => _State();
}

class _State extends State<SocialNetworkIconButton> {
  late Color backgroundColor;
  late Color foregroundColor;

  Color get background {
    return widget.background;
  }

  double get borderWidth {
    return widget.borderWidth;
  }

  Color get foreground {
    return widget.foreground;
  }

  SocialNetworkIcon get icon {
    return widget.icon;
  }

  void Function() get onTap {
    return widget.onTap;
  }

  Size get size {
    return widget.size;
  }

  @override
  void initState() {
    super.initState();
    backgroundColor = background;
    foregroundColor = foreground;
  }

  @override
  void didUpdateWidget(covariant SocialNetworkIconButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.background != background) {
      backgroundColor = background;
    }
    if (oldWidget.foreground != foreground) {
      foregroundColor = foreground;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Clickable(
      child: AnimatedContainer(
        child: Center(
          child: icon.copyWith(
            color: foregroundColor,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        constraints: BoxConstraints.loose(size),
        decoration: BoxDecoration(
          border: Border.all(
            color: background,
            width: borderWidth,
          ),
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        duration: const Duration(
          milliseconds: 300,
        ),
      ),
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          backgroundColor = Colors.transparent;
          foregroundColor = background;
        });
      },
      onExit: (_) {
        setState(() {
          backgroundColor = background;
          foregroundColor = foreground;
        });
      },
      onTap: onTap,
    );
  }
}
