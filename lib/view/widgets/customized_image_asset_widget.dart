import 'package:flutter/material.dart';

class CustomImageAssetWidget extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final double? radius;
  final BoxFit? fit;


  const CustomImageAssetWidget(
      {super.key,
        required this.image,
        this.height,
        this.width,
        this.fit = BoxFit.cover,
        /* this.isNotification = false, this.placeholder = ''*/ this.radius =
      20});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius!)),
      child: Image.asset(
        image,
        fit: fit,
      ),
    );
  }
}