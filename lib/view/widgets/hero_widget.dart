import 'package:flutter/material.dart';
import 'package:glow/constants/extensions.dart';

import '../../constants/colors.dart';

class HeroWidget extends StatelessWidget {
  final String tag;
  final Widget child;

  const HeroWidget({required this.tag, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(tag: tag, child: Card(elevation: 0, margin: 0.edgeInsetsAll, color: AppColors.white, child: child));
  }
}