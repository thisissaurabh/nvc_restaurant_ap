
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../controller/order_controller.dart';
import '../../../../utils/dimensions.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/order_button.dart';
import '../../../widgets/order_widget.dart';
import '../widget/count_widget.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get.find<OrderController>().getPaginatedOrders(1, true);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Order History', isBackButtonExist: false),
      body: GetBuilder<OrderController>(builder: (orderController) {
        return Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
          child: Column(children: [

            /*GetBuilder<AuthController>(builder: (authController) {
              return*/ /*authController.profileModel != null ? */Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                ),
                child: const Row(children: [
                  CountWidget(title: 'Today', count: 0),
                  CountWidget(title: 'This Week', count: 0),
                  CountWidget(title: 'This Month', count: 0),
                ]),
              ),/* : const SizedBox();*/
            // }),
            const SizedBox(height: Dimensions.paddingSizeLarge),
               SizedBox(
                   height: 30,
                   child: ListView.builder(
                     scrollDirection: Axis.horizontal,
                     itemCount: orderController.categoryListOrderHistory.length,
                     physics: const AlwaysScrollableScrollPhysics(),
                     itemBuilder: (context, index) {
                       return InkWell(
                           onTap: () => orderController.setCategoryIndex(index),
                           child: OrderButton(
                             isSelected:
                             index == orderController.categoryIndex,
                             txt: orderController.categoryListOrderHistory[index].name,)
                       );
                     },
                   )),
               Expanded(
                 child: ListView.builder(
                   physics: const BouncingScrollPhysics(),
                   shrinkWrap: true,
                   itemCount:10,
                   itemBuilder: (context, index) {
                     return const OrderWidget(hasDivider: true, isRunning: true,);
                   },
                 ),
               ),


            // Container(
            //   height: 40,
            //   decoration: BoxDecoration(
            //     border: Border.all(color: Theme.of(context).disabledColor, width: 1),
            //     borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
            //   ),
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: orderController.statusList.length,
            //     itemBuilder: (context, index) {
            //       return OrderButton(
            //         title: orderController.statusList[index].tr, index: index, orderController: orderController, fromHistory: true,
            //       );
            //     },
            //   ),
            // ),
            // SizedBox(height: orderController.historyOrderList != null ? Dimensions.paddingSizeSmall : 0),
            //
            // Expanded(
            //   child: orderController.historyOrderList != null ? orderController.historyOrderList!.isNotEmpty
            //       ? const OrderView() : Center(child: Text('no_order_found'.tr)) : const Center(child: CircularProgressIndicator()),
            // ),

          ]),
        );
      }),
    );
  }
}
