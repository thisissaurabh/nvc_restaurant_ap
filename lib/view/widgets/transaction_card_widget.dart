
import 'package:flutter/material.dart';
import 'package:nvc_restaurant_app/utils/dimensions.dart';
import 'package:nvc_restaurant_app/utils/styles.dart';

class TransactionCardWidget extends StatelessWidget {
  const TransactionCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("₹ 0.00",style: poppinsMedium.copyWith(fontSize: 14,color: Theme.of(context).primaryColor),),
              Text("Cash in Hand",style: poppinsMedium.copyWith(fontSize: 10,color: Theme.of(context).disabledColor),),
            ],
          ),
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("01 March 2024 11:23 AM",style: poppinsMedium.copyWith(fontSize: 10,color: Theme.of(context).disabledColor),),
              Text("Pending",style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSmall,
              color: Theme.of(context).primaryColor)),
              ],),
        ),],);
  }
}
