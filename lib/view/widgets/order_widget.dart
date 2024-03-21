
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nvc_restaurant_app/utils/styles.dart';
import 'package:nvc_restaurant_app/view/widgets/order_button.dart';

import '../../helper/route_helper.dart';
import '../../utils/dimensions.dart';

class OrderWidget extends StatelessWidget {
  // final OrderModel orderModel;
  final bool hasDivider;
  final bool isRunning;
  final bool showStatus;
  const OrderWidget({Key? key,
    // required this.orderModel,
    required this.hasDivider,
    required this.isRunning,
    this.showStatus = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(RouteHelper.getOrderDetailsRoute(),),
      child: Column(children: [

        Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [

            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Order Id:${'#100146'}', style: poppinsRegular.copyWith(fontSize: 16,color: Colors.black)),
              const SizedBox(height: Dimensions.paddingSizeExtraSmall),
              Row(children: [
                Text(
                  "02 march 2024 5:50 PM ",
                  // DateConverter.dateTimeStringToDateTime(orderModel.createdAt!),
                  style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).disabledColor),
                ),
                Container(
                  height: 10, width: 1, color: Theme.of(context).disabledColor,
                  margin: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall),
                ),
                Text(
                  "Delivery",
                  style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).primaryColor),
                ),
              ]),
            ])),

            // showStatus ? Container(
            //   padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall, vertical: Dimensions.paddingSizeExtraSmall),
            //   decoration: BoxDecoration(
            //     color: Theme.of(context).primaryColor.withOpacity(0.1),
            //     borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
            //   ),
            //   alignment: Alignment.center,
            //   child: Text(
            //    " orderModel.orderStatus!.tr",
            //     style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeExtraSmall, color: Theme.of(context).primaryColor),
            //   ),
            // ) : Text(
            //   'Items',
            //   style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).disabledColor),
            // ),

            showStatus ? const SizedBox() :  OrderButton(buttonColor:Theme.of(context).primaryColor.withOpacity(0.1) ,txt: 'Pending',)/*Icon(Icons.keyboard_arrow_right, size: 30, color: Theme.of(context).primaryColor)*/,

          ]),
        ),

        hasDivider ? Divider(color: Theme.of(context).disabledColor) : const SizedBox(),

      ]),
    );
  }
}
