
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nvc_restaurant_app/utils/styles.dart';

import '../../../controller/auth_controller.dart';
import '../../../controller/order_controller.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/images.dart';
import '../../widgets/confirmation_dialog.dart';
import '../../widgets/order_button.dart';
import '../../widgets/order_widget.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Text("Hi User",
            style: poppinsMedium.copyWith(fontSize: 16)),
          // flexibleSpace: Container(
          //
          //   child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Expanded(
          //         child: Image.asset("assets/images/icappbg1.png",
          //           // height: 100,
          //           color: Colors.white.withOpacity(0.90),),
          //       ),
          //       Expanded(
          //         child: Image.asset("assets/images/icappbg1.png",
          //           // height: 100,
          //           color: Colors.white.withOpacity(0.90),),
          //       ),
          //
          //     ],),
          // ),
        ),
      body: RefreshIndicator(
        onRefresh: () async {
          // await _loadData();
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(children: [

            GetBuilder<AuthController>(builder: (authController) {
              return Column(children: [
                Row(children: [
                  const Expanded(child: Text(
                    'Restaurant Temporarily Closed', style: poppinsMedium,
                    maxLines: 1, overflow: TextOverflow.ellipsis,
                  )),
                  /*authController.profileModel != null ? */
                  Switch(
                    value: false,
                    activeColor: Theme.of(context).primaryColor,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onChanged: (bool isActive) {
                      Get.dialog(ConfirmationDialog(
                        icon: Images.warning,
                        description: isActive ? 'Are You Sure To Close Restaurant': 'Are You Sure To Open Restaurant',
                        onYesPressed: () {
                          Get.back();
                          // authController.toggleRestaurantClosedStatus();
                        },
                      ));
                    },
                  ), /*: Shimmer(duration: const Duration(seconds: 2), child: Container(height: 30, width: 50, color: Colors.grey[300])),*/
                ]),
                const SizedBox(height: Dimensions.paddingSizeSmall),
                Container(
                  padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Column(children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Image.asset(Images.wallet, width: 60, height: 60),
                      const SizedBox(width: Dimensions.paddingSizeLarge),
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(
                          'Today',
                          style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).cardColor),
                        ),
                        const SizedBox(height: Dimensions.paddingSizeSmall),
                        Text(
                         /* authController.profileModel != null ? PriceConverter.convertPrice(authController.profileModel!.todaysEarning) :*/ '0',
                          style: poppinsBold.copyWith(fontSize: 24, color: Theme.of(context).cardColor), textDirection: TextDirection.ltr,
                        ),
                      ]),
                    ]),
                    const SizedBox(height: 30),
                    Row(children: [
                      Expanded(child: Column(children: [
                        Text(
                          'This week',
                          style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).cardColor),
                        ),
                        const SizedBox(height: Dimensions.paddingSizeSmall),
                        Text(
                          /*authController.profileModel != null ? PriceConverter.convertPrice(authController.profileModel!.thisWeekEarning) : */'0',
                          style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: Theme.of(context).cardColor), textDirection: TextDirection.ltr,
                        ),
                      ])),
                      Container(height: 30, width: 1, color: Theme.of(context).cardColor),
                      Expanded(child: Column(children: [
                        Text(
                          'This month',
                          style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).cardColor),
                        ),
                        const SizedBox(height: Dimensions.paddingSizeSmall),
                        Text(
/*                          authController.profileModel != null ? PriceConverter.convertPrice(authController.profileModel!.thisMonthEarning) :*/ '0',
                          style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: Theme.of(context).cardColor),textDirection: TextDirection.ltr,
                        ),
                      ])),
                    ]),
                  ]),
                ),
              ]);
            }),
            const SizedBox(height: Dimensions.paddingSizeLarge),
            GetBuilder<OrderController>(builder: (orderController) {
              return Column(
                children: [
                  SizedBox(
                      height: 30,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: orderController.categoryList.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => orderController.setCategoryIndex(index),
                            child: OrderButton(
                              isSelected:
                              index == orderController.categoryIndex,
                              txt: orderController.categoryList[index].name,)
                          );
                        },
                      )),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:4,
                    itemBuilder: (context, index) {
                      return const OrderWidget(hasDivider: true, isRunning: true,);
                    },
                  ),
                ],
              );
            }),


            /*  GetBuilder<OrderController>(builder: (orderController) {
              List<OrderModel> orderList = [];
              if(orderController.runningOrders != null) {
                orderList = orderController.runningOrders![orderController.orderIndex].orderList;
              }

              return Column(children: [

                orderController.runningOrders != null ? Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).disabledColor, width: 1),
                    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: orderController.runningOrders!.length,
                    itemBuilder: (context, index) {
                      return OrderButton(
                        title: orderController.runningOrders![index].status.tr, index: index,
                        orderController: orderController, fromHistory: false,
                      );
                    },
                  ),
                ) : const SizedBox(),

                Row(children: [
                  orderController.runningOrders != null ? InkWell(
                    onTap: () => orderController.toggleCampaignOnly(),
                    child: Row(children: [
                      Checkbox(
                        activeColor: Theme.of(context).primaryColor,
                        value: orderController.campaignOnly,
                        onChanged: (isActive) => orderController.toggleCampaignOnly(),
                      ),
                      Text(
                        'campaign_order'.tr,
                        style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).disabledColor),
                      ),
                    ]),
                  ) : const SizedBox(),

                  orderController.runningOrders != null ? InkWell(
                    onTap: () => orderController.toggleSubscriptionOnly(),
                    child: Row(children: [
                      Checkbox(
                        activeColor: Theme.of(context).primaryColor,
                        value: orderController.subscriptionOnly,
                        onChanged: (isActive) => orderController.toggleSubscriptionOnly(),
                      ),
                      Text(
                        'subscription_order'.tr,
                        style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).disabledColor),
                      ),
                    ]),
                  ) : const SizedBox(),
                ]),

                orderController.runningOrders != null ? orderList.isNotEmpty ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: orderList.length,
                  itemBuilder: (context, index) {
                    return OrderWidget(orderModel: orderList[index], hasDivider: index != orderList.length-1, isRunning: true);
                  },
                ) : Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Center(child: Text('no_order_found'.tr)),
                ) : ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return OrderShimmer(isEnabled: orderController.runningOrders == null);
                  },
                ),

              ]);
            }),*/

          ]),
        ),
      ),

    );
  }
}
