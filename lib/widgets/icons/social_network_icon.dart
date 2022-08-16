import 'package:flutter/material.dart';

abstract class SocialNetworkIcon extends StatefulWidget {
  final Color? color;

  const SocialNetworkIcon({
    required this.color,
    Key? key,
  }) : super(key: key);

  SocialNetworkIcon copyWith({
    Color? color,
  });
}
