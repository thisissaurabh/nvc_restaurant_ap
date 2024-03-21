import 'package:flutter/material.dart';
import '../../controller/order_controller.dart';
import '../../utils/dimensions.dart';

class OrderButton extends StatelessWidget {
  final bool isSelected;
  final Color? buttonColor;
  final String txt;

  const OrderButton({
    Key? key,
    required this.txt,
    this.isSelected = false,
    this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSizeSmall,
          vertical: Dimensions.paddingSizeExtraSmall),
      margin: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
        color: buttonColor ?? (isSelected
            ? Theme.of(context).primaryColor.withOpacity(0.1)
            : Colors.transparent),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            txt,
            style: buttonColor != null
                ? TextStyle(
              fontSize: Dimensions.fontSizeSmall,
              color: Theme.of(context).primaryColor, // or any other default color
            )
                : isSelected
                ? TextStyle(
                fontSize: Dimensions.fontSizeSmall,
                color: Theme.of(context).primaryColor)
                : const TextStyle(
                fontSize: Dimensions.fontSizeSmall),
          ),
        ],
      ),
    );
  }
}
