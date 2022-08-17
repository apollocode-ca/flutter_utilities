import 'package:flutter/material.dart';

abstract class SocialNetworkIcon extends StatefulWidget {
  final Color? color;
  final Size? size;

  const SocialNetworkIcon({
    required this.color,
    required this.size,
    Key? key,
  }) : super(key: key);

  SocialNetworkIcon copyWith({
    Color? color,
    Size? size,
  });
}
