import 'package:apollocode_flutter_utilities/enums/animation_type.dart';
import 'package:apollocode_flutter_utilities/widgets/clickable.dart';
import 'package:apollocode_flutter_utilities/widgets/icons/social_network_icon.dart';
import 'package:flutter/material.dart';

class SocialNetworkIconButton extends StatefulWidget {
  final AnimationType animationType;
  final Color background;
  final double borderWidth;
  final SocialNetworkIcon icon;
  final Color foreground;
  final EdgeInsets? margin;
  final void Function() onTap;
  final Size size;

  const SocialNetworkIconButton({
    required this.animationType,
    required this.background,
    required this.borderWidth,
    required this.foreground,
    required this.icon,
    this.margin,
    required this.onTap,
    required this.size,
    Key? key,
  }) : super(key: key);

  @override
  State<SocialNetworkIconButton> createState() => _State();
}

class _State extends State<SocialNetworkIconButton> {
  static const iconSizeScale = 0.56;

  late Color background;
  late double borderWidth;
  late Color foreground;

  AnimationType get animationType {
    return widget.animationType;
  }

  BoxBorder get border {
    if (borderWidth == 0) {
      return const Border.fromBorderSide(
        BorderSide.none,
      );
    }
    return Border.all(
      color: borderColor,
      width: borderWidth,
    );
  }

  Color get borderColor {
    switch (animationType) {
      case AnimationType.background:
        return widget.background;
      case AnimationType.border:
        return widget.foreground;
      default:
        throw UnimplementedError(
          'Animation has not been implemented for '
          'AnimationType.$animationType.',
        );
    }
  }

  Duration get duration {
    switch (animationType) {
      case AnimationType.background:
        return const Duration(
          milliseconds: 300,
        );
      case AnimationType.border:
        return const Duration(
          milliseconds: 400,
        );
      default:
        throw UnimplementedError(
          'Animation has not been implemented for '
          'AnimationType.$animationType.',
        );
    }
  }

  SocialNetworkIcon get icon {
    return widget.icon;
  }

  Size get iconSize {
    return size * iconSizeScale;
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

  void backgroundAnimation({
    bool reverse = false,
  }) {
    if (reverse) {
      background = widget.background;
      foreground = widget.foreground;
    } else {
      background = Colors.transparent;
      foreground = widget.background;
    }
  }

  void borderAnimation({
    bool reverse = false,
  }) {
    if (reverse) {
      borderWidth = 0;
    } else {
      borderWidth = widget.borderWidth;
    }
  }

  void onEnter() {
    switch (animationType) {
      case AnimationType.background:
        setState(() {
          backgroundAnimation();
        });
        break;
      case AnimationType.border:
        setState(() {
          borderAnimation();
        });
        break;
      default:
        throw UnimplementedError(
          'Animation has not been implemented for '
          'AnimationType.$animationType.',
        );
    }
  }

  void onExit() {
    switch (animationType) {
      case AnimationType.background:
        setState(() {
          backgroundAnimation(
            reverse: true,
          );
        });
        break;
      case AnimationType.border:
        setState(() {
          borderAnimation(
            reverse: true,
          );
        });
        break;
      default:
        throw UnimplementedError(
          'Animation has not been implemented for '
          'AnimationType.$animationType.',
        );
    }
  }

  double getBorderWidth() {
    switch (animationType) {
      case AnimationType.background:
        return widget.borderWidth;
      case AnimationType.border:
        return 0;
      default:
        throw UnimplementedError(
          'Animation has not been implemented for '
          'AnimationType.$animationType.',
        );
    }
  }

  @override
  void initState() {
    super.initState();
    background = widget.background;
    borderWidth = getBorderWidth();
    foreground = widget.foreground;
  }

  @override
  void didUpdateWidget(covariant SocialNetworkIconButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.background != widget.background) {
      background = widget.background;
    }
    if (oldWidget.borderWidth != widget.borderWidth) {
      borderWidth = getBorderWidth();
    }
    if (oldWidget.foreground != widget.foreground) {
      foreground = widget.foreground;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Clickable(
        child: AnimatedContainer(
          alignment: Alignment.center,
          child: icon.copyWith(
            color: foreground,
            size: iconSize,
          ),
          clipBehavior: Clip.antiAlias,
          constraints: BoxConstraints.tight(size),
          decoration: BoxDecoration(
            border: border,
            color: background,
            shape: BoxShape.circle,
          ),
          duration: duration,
        ),
        cursor: SystemMouseCursors.click,
        onEnter: (_) {
          onEnter();
        },
        onExit: (_) {
          onExit();
        },
        onTap: onTap,
      ),
      margin: margin,
    );
  }
}
