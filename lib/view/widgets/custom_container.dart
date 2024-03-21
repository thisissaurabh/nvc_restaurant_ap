

import 'package:flutter/material.dart';

class PaddedContainer extends StatelessWidget {
  final double vertical;
  final double horizontal;
  final Widget child;
  final Color? color;
  final Color? borderColor;
  final double? borderRadius;
  const PaddedContainer({super.key, required this.child, required this.vertical, required this.horizontal, this.color, this.borderColor,  this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: vertical,horizontal: horizontal),
      decoration: BoxDecoration(
        border: Border.all(width: 1,color:borderColor?? Theme.of(context).cardColor ),
        borderRadius: BorderRadius.circular(borderRadius ?? 2),
        color: color?? Theme.of(context).cardColor
      ),
      child: child,
    );
  }
}
