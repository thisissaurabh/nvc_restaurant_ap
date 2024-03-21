// import 'dart:async';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:nvc_restaurant_app/utils/styles.dart';
// import '../../../../helper/data_converter.dart';
// import '../../../../utils/dimensions.dart';
// import '../../../widgets/custom_app_bar.dart';
// import '../../../widgets/custom_snackbar.dart';
//
// class OrderDetailsScreen extends StatefulWidget {
//
//
//   const OrderDetailsScreen({Key? key, }) : super(key: key);
//
//   @override
//   State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
// }
//
// class _OrderDetailsScreenState extends State<OrderDetailsScreen> with WidgetsBindingObserver {
//   late Timer _timer;
//
//
//
//   @override
//   void initState() {
//     super.initState();
//
//    /* if(Get.find<OrderController>().showDeliveryImageField){
//       Get.find<OrderController>().changeDeliveryImageStatus(isUpdate: false);
//     }
//     Get.find<OrderController>().pickPrescriptionImage(isRemove: true, isCamera: false);
//
//     Get.find<OrderController>().setOrderDetails(widget.orderModel);
//     if(Get.find<AuthController>().profileModel == null){
//       Get.find<AuthController>().getProfile();
//     }
//
//     Get.find<OrderController>().getOrderDetails(widget.orderModel.id);
//
//     _startApiCalling();*/
//   }
//
//
//   @override
//   void dispose() {
//     super.dispose();
//
//     WidgetsBinding.instance.removeObserver(this);
//
//     _timer.cancel();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return GetBuilder<OrderController>(
//         builder: (orderController) {
//
//           double? deliveryCharge = 0;
//           double itemsPrice = 0;
//           double? discount = 0;
//           double? couponDiscount = 0;
//           double? dmTips = 0;
//           double? tax = 0;
//           bool? taxIncluded = false;
//           double addOns = 0;
//           double additionalCharge = 0;
//
//             discount = order.restaurantDiscountAmount;
//             tax = order.totalTaxAmount;
//             taxIncluded = order.taxStatus;
//             couponDiscount = order.couponDiscountAmount;
//             additionalCharge = order.additionalCharge ?? 0;
//             for(OrderDetailsModel orderDetails in orderController.orderDetailsModel!) {
//               for(AddOn addOn in orderDetails.addOns!) {
//                 addOns = addOns + (addOn.price! * addOn.quantity!);
//               }
//               itemsPrice = itemsPrice + (orderDetails.price! * orderDetails.quantity!);
//             }
//
//           double subTotal = itemsPrice + addOns;
//           double total = itemsPrice + addOns - discount! + (taxIncluded! ? 0 : tax!) + deliveryCharge! - couponDiscount! + dmTips! + additionalCharge;
//
//           return Scaffold(
//             appBar: CustomAppBar(title:  'order_details'),
//             body: Column(children: [
//
//               Expanded(child: Scrollbar(child: SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
//                 child: Center(child: SizedBox(width: 1170, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                   Column(children: [
//
//                     ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.asset(Images.animateDeliveryMan, fit: BoxFit.contain)),
//                     const SizedBox(height: Dimensions.paddingSizeDefault),
//
//                     Text('food_need_to_delivered_within'.tr, style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeDefault, color: Theme.of(context).disabledColor)),
//                     const SizedBox(height: Dimensions.paddingSizeExtraSmall),
//
//                     Center(
//                       child: Row(mainAxisSize: MainAxisSize.min, children: [
//
//                         Text(
//                           "hhhhhhhhhhhhhhhhhhh",
//                           style: poppinsBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge),
//                         ),
//                         const SizedBox(width: Dimensions.paddingSizeExtraSmall),
//
//                         Text('min'.tr, style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeLarge, color: Theme.of(context).primaryColor)),
//                       ]),
//                     ),
//                     const SizedBox(height: Dimensions.paddingSizeExtraLarge),
//
//                   ]),
//
//                   Row(children: [
//                     Text('${'order_id'.tr}:', style: poppinsRegular),
//                     const SizedBox(width: Dimensions.paddingSizeExtraSmall),
//                     Text("order!.id.toString()", style: poppinsRegular),
//                     const SizedBox(width: Dimensions.paddingSizeExtraSmall),
//                     const Expanded(child: SizedBox()),
//                     const Icon(Icons.watch_later, size: 17),
//                     const SizedBox(width: Dimensions.paddingSizeExtraSmall),
//                     Text(
//                      "fgd",
//                       style: poppinsRegular,
//                     ),
//                   ]),
//                   const SizedBox(height: Dimensions.paddingSizeSmall),
//
//                   Row(children: [
//                     Text("order.orderType!".tr, style: poppinsMedium),
//                     const Expanded(child: SizedBox()),
//                     Container(
//                       padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall, vertical: Dimensions.paddingSizeExtraSmall),
//                       decoration: BoxDecoration(
//                         color: Theme.of(context).primaryColor.withOpacity(0.1), borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
//                       ),
//                       child: Text(
//                         "Cash",
//                         style: poppinsRegular.copyWith(color: Theme.of(context).primaryColor, fontSize: Dimensions.fontSizeExtraSmall),
//                       ),
//                     ),
//                   ]),
//                   const Divider(height: Dimensions.paddingSizeLarge),
//
//
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeExtraSmall),
//                     child: Row(children: [
//                       Text('${'item'.tr}:', style: poppinsRegular),
//                       const SizedBox(width: Dimensions.paddingSizeExtraSmall),
//                       Text(
//                         "4",
//                         style: poppinsRegular.copyWith(color: Theme.of(context).primaryColor),
//                       ),
//                       const Expanded(child: SizedBox()),
//                       Container(height: 7, width: 7, decoration: BoxDecoration(
//                           color: (order.orderStatus == 'failed' || order.orderStatus == 'canceled' || order.orderStatus == 'refund_request_canceled')
//                               ? Colors.red : order.orderStatus == 'refund_requested' ? Colors.yellow : Colors.green, shape: BoxShape.circle),
//                       ),
//                       const SizedBox(width: Dimensions.paddingSizeExtraSmall),
//                       Text(
//                         order.orderStatus == 'delivered' ? '${'delivered_at'.tr} ${order.delivered != null ? DateConverter.dateTimeStringToDateTime(order.delivered!) : ''}'
//                             : order.orderStatus!.tr,
//                         style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSmall),
//                       ),
//                     ]),
//                   ),
//                   const Divider(height: Dimensions.paddingSizeLarge),
//
//                   order.cutlery != null ? Row(children: [
//                     Text('${'cutlery'.tr}: ', style: poppinsRegular),
//                     const Expanded(child: SizedBox()),
//
//                     Text(
//                       order.cutlery! ? 'yes'.tr : 'no'.tr,
//                       style: robotoRegular,
//                     )poppinsRegular
//                   ]) : const SizedBox(),
//                   const Divider(height: Dimensions.paddingSizeLarge),
//
//                   order.unavailableItemNote != null ? Row(children: [
//                     Text('${'if_item_is_not_available'.tr}: ', style: poppinsRegular),
//
//                     Text(
//                       order.unavailableItemNote!.tr,
//                       style: poppinsRegular,
//                     ),
//                   ]) : const SizedBox(),
//                   order.unavailableItemNote != null ? const Divider(height: Dimensions.paddingSizeLarge) : const SizedBox(),
//
//                   order.deliveryInstruction != null ? Row(children: [
//                     Text('${'delivery_instruction'.tr}: ', style: poppinsRegular),
//
//                     Text(
//                       order.deliveryInstruction!.tr,
//                       style: poppinsRegular,
//                     ),
//                   ]) : const SizedBox(),
//                   order.deliveryInstruction != null ? const Divider(height: Dimensions.paddingSizeLarge) : const SizedBox(),
//
//                   SizedBox(height: order.deliveryInstruction != null ? Dimensions.paddingSizeSmall : 0),
//
//                   const SizedBox(height: Dimensions.paddingSizeSmall),
//
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: orderController.orderDetailsModel!.length,
//                     itemBuilder: (context, index) {
//                       return OrderProductWidget(order: order, orderDetails: orderController.orderDetailsModel![index]);
//                     },
//                   ),
//
//                   (order.orderNote  != null && order.orderNote!.isNotEmpty) ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                     Text('additional_note'.tr, style: poppinsRegular),
//                     const SizedBox(height: Dimensions.paddingSizeSmall),
//
//                     Container(
//                       width: 1170,
//                       padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
//                         border: Border.all(width: 1, color: Theme.of(context).disabledColor),
//                       ),
//                       child: Text(
//                         order.orderNote!.tr,
//                         style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).disabledColor),
//                       ),
//                     ),
//                     const SizedBox(height: Dimensions.paddingSizeLarge),
//
//                   ]) : const SizedBox(),
//
//                   Row(children: [
//                     Text('customer_details'.tr, style: poppinsRegular),
//                     order.isGuest! ? Text(' (${'guest_user'.tr})', style: poppinsRegular.copyWith(color: Colors.green)) : const SizedBox(),
//                   ]),
//                   const SizedBox(height: Dimensions.paddingSizeSmall),
//
//                   Row(children: [
//                     ClipOval(child: CustomImage(
//                       image: order.customer != null ?'${Get.find<SplashController>().configModel!.baseUrls!.customerImageUrl}/${order.customer!.image}' : '',
//                       height: 35, width: 35, fit: BoxFit.cover,
//                     )),
//                     const SizedBox(width: Dimensions.paddingSizeSmall),
//
//                     Expanded(child: order.deliveryAddress != null ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                       Text(
//                         order.deliveryAddress!.contactPersonName!, maxLines: 1, overflow: TextOverflow.ellipsis,
//                         style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSmall),
//                       ),
//                       Text(
//                         order.deliveryAddress!.address != null ? order.deliveryAddress!.address! : '', maxLines: 1, overflow: TextOverflow.ellipsis,
//                         style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).disabledColor),
//                       ),
//
//                       Wrap(children: [
//                         (order.deliveryAddress?.streetNumber != null && order.deliveryAddress!.streetNumber!.isNotEmpty)
//                             ? Text(
//                           '${'street_number'.tr}: ${order.deliveryAddress!.streetNumber!}${(order.deliveryAddress?.house != null && order.deliveryAddress!.house!.isNotEmpty) ? ', ' : ' '}',
//                           style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeExtraSmall, color: Theme.of(context).disabledColor),
//                           maxLines: 1, overflow: TextOverflow.ellipsis,
//                         ) : const SizedBox(),
//
//                         (order.deliveryAddress?.house != null && order.deliveryAddress!.house!.isNotEmpty) ? Text('${'house'.tr}: ${order.deliveryAddress!.house!}${(order.deliveryAddress!.floor != null && order.deliveryAddress!.floor!.isNotEmpty) ? ', ' : ' '}',
//                           style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeExtraSmall, color: Theme.of(context).disabledColor), maxLines: 1, overflow: TextOverflow.ellipsis,
//                         ) : const SizedBox(),
//
//                         (order.deliveryAddress?.floor != null && order.deliveryAddress!.floor!.isNotEmpty) ? Text('${'floor'.tr}: ${order.deliveryAddress!.floor!}' ,
//                           style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeExtraSmall, color: Theme.of(context).disabledColor), maxLines: 1, overflow: TextOverflow.ellipsis,
//                         ) : const SizedBox(),
//                       ]),
//
//                     ]) : Text('walking_customer'.tr, style: poppinsMedium)),
//
//                     (order.orderType == 'take_away' && (order.orderStatus == 'pending' || order.orderStatus == 'confirmed'
//                         || order.orderStatus == 'processing')) ? TextButton.icon(
//                       onPressed: () async {
//                         String url ='https://www.google.com/maps/dir/?api=1&destination=${order.deliveryAddress?.latitude}'
//                             ',${order.deliveryAddress?.longitude}&mode=d';
//                         if (await canLaunchUrlString(url)) {
//                           await launchUrlString(url, mode: LaunchMode.externalApplication);
//                         }else {
//                           showCustomSnackBar('unable_to_launch_google_map'.tr);
//                         }
//                       },
//                       icon: const Icon(Icons.directions), label: Text('direction'.tr),
//                     ) : const SizedBox(),
//                     const SizedBox(width: Dimensions.paddingSizeSmall),
//
//                     (controllerOrderModel.orderStatus != 'delivered' && controllerOrderModel.orderStatus != 'failed'
//                         && controllerOrderModel.orderStatus != 'canceled' && controllerOrderModel.orderStatus != 'refunded' && orderController.orderModel!.customer?.id != null) ? InkWell(
//                       onTap: () async {
//                    /*     if(Get.find<AuthController>().profileModel!.subscription != null && Get.find<AuthController>().profileModel!.subscription!.chat == 0 && Get.find<AuthController>().profileModel!.restaurants![0].restaurantModel == 'subscription') {
//
//                           showCustomSnackBar('you_have_no_available_subscription'.tr);
//
//                         }else{
//                           _timer.cancel();
//                           await Get.toNamed(RouteHelper.getChatRoute(
//                             notificationBody: NotificationBody(
//                               orderId: orderController.orderModel!.id,
//                               customerId: orderController.orderModel!.customer!.id,
//                             ),
//                             user: User(
//                               id: orderController.orderModel!.customer!.id,
//                               fName: orderController.orderModel!.customer!.fName,
//                               lName: orderController.orderModel!.customer!.lName,
//                               image: orderController.orderModel!.customer!.image,
//                             ),
//                           ));
//                           _startApiCalling();
//                         }*/
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: 7),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
//                           color: Theme.of(context).primaryColor,
//                         ),
//                         child: Center(
//                           child: Text('chat'.tr, style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).cardColor)),
//                         ),
//                       ),
//                     ) : const SizedBox(),
//
//                   ]),
//                   const SizedBox(height: Dimensions.paddingSizeLarge),
//
//                   ///Deliver Man Assign
//                   ///
//                   // Total
//                   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                     Text('item_price'.tr, style: poppinsRegular),
//                     Text(PriceConverter.convertPrice(itemsPrice), style: poppinsRegular, textDirection: TextDirection.ltr),
//                   ]),
//                   const SizedBox(height: 10),
//
//                   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                     Text('addons'.tr, style: poppinsRegular),
//                     Text('(+) ${PriceConverter.convertPrice(addOns)}', style: poppinsRegular, textDirection: TextDirection.ltr,),
//                   ]),
//
//                   Divider(thickness: 1, color: Theme.of(context).hintColor.withOpacity(0.5)),
//
//                   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                     Text('${'subtotal'.tr} ${taxIncluded ? '(${'tax_included'.tr})' : ''}', style: poppinsRegular),
//                     Text(PriceConverter.convertPrice(subTotal), style: poppinsRegular, textDirection: TextDirection.ltr),
//                   ]),
//                   const SizedBox(height: 10),
//
//                   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                     Text('discount'.tr, style: poppinsRegular),
//                     Text('(-) ${PriceConverter.convertPrice(discount)}', style: poppinsRegular, textDirection: TextDirection.ltr),
//                   ]),
//                   const SizedBox(height: 10),
//
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                     Text('delivery_man_tips'.tr, style: poppinsRegular),
//                     Text('(+) ${PriceConverter.convertPrice(dmTips)}', style: poppinsRegular, textDirection: TextDirection.ltr),
//                   ],
//                   ),
//                   const SizedBox(height: 10),
//
//                   couponDiscount > 0 ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                     Text('coupon_discount'.tr, style: poppinsRegular),
//                     Text(
//                       '(-) ${PriceConverter.convertPrice(couponDiscount)}',
//                       style: poppinsRegular, textDirection: TextDirection.ltr,
//                     ),
//                   ]) : const SizedBox(),
//                   SizedBox(height: couponDiscount > 0 ? 10 : 0),
//
//                   !taxIncluded ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                     Text('vat_tax'.tr, style: poppinsRegular),
//                     Text('(+) ${PriceConverter.convertPrice(tax)}', style: poppinsRegular, textDirection: TextDirection.ltr),
//                   ]) : const SizedBox(),
//                   SizedBox(height: taxIncluded ? 0 : 10),
//
//                   (order.additionalCharge != null && order.additionalCharge! > 0) ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                     Text(Get.find<SplashController>().configModel!.additionalChargeName!, style: poppinsRegular),
//                     Text('(+) ${PriceConverter.convertPrice(order.additionalCharge)}', style: poppinsRegular, textDirection: TextDirection.ltr),
//                   ]) : const SizedBox(),
//                   (order.additionalCharge != null && order.additionalCharge! > 0) ? const SizedBox(height: 10) : const SizedBox(),
//
//                   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                     Text('delivery_fee'.tr, style: poppinsRegular),
//                     Text('(+) ${PriceConverter.convertPrice(deliveryCharge)}', style: poppinsRegular, textDirection: TextDirection.ltr),
//                   ]),
//
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
//                     child: Divider(thickness: 1, color: Theme.of(context).hintColor.withOpacity(0.5)),
//                   ),
//
//                   order.paymentMethod == 'partial_payment' ? DottedBorder(
//                     color: Theme.of(context).primaryColor,
//                     strokeWidth: 1,
//                     strokeCap: StrokeCap.butt,
//                     dashPattern: const [8, 5],
//                     padding: const EdgeInsets.all(0),
//                     borderType: BorderType.RRect,
//                     radius: const Radius.circular(Dimensions.radiusDefault),
//                     child: Ink(
//                       padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
//                       color: restConfModel ? Theme.of(context).primaryColor.withOpacity(0.05) : Colors.transparent,
//                       child: Column(children: [
//
//                         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                           Text('total_amount'.tr, style: poppinsRegular.copyWith(
//                             fontSize: Dimensions.fontSizeLarge, color: Theme.of(context).primaryColor,
//                           )),
//                           Text(
//                             PriceConverter.convertPrice(total),
//                             style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeLarge, color: Theme.of(context).primaryColor),
//                           ),
//                         ]),
//                         const SizedBox(height: 10),
//
//                         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                           Text('paid_by_wallet'.tr, style: restConfModel ? poppinsRegular : poppinsRegular),
//                           Text(
//                             PriceConverter.convertPrice(order.payments![0].amount),
//                             style: restConfModel ? poppinsRegular : poppinsRegular,
//                           ),
//                         ]),
//                         const SizedBox(height: 10),
//
//                         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                           Text('${order.payments![1].paymentStatus == 'paid' ? 'paid_by'.tr : 'due_amount'.tr} (${order.payments![1].paymentMethod?.tr})', style: restConfModel ? robotoMedium : robotoRegular),
//                           Text(
//                             PriceConverter.convertPrice(order.payments![1].amount),
//                             style: restConfModel ? poppinsRegular : poppinsRegular,
//                           ),
//                         ]),
//                       ]),
//                     ),
//                   ) : const SizedBox(),
//
//                   order.paymentMethod != 'partial_payment' ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                     Text('total_amount'.tr, style: poppinsRegular.copyWith(
//                       fontSize: Dimensions.fontSizeLarge, color: Theme.of(context).primaryColor,
//                     )),
//                     Text(
//                       PriceConverter.convertPrice(total), textDirection: TextDirection.ltr,
//                       style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeLarge, color: Theme.of(context).primaryColor),
//                     ),
//                   ]) : const SizedBox(),
//
//
//                 ]))),
//               ))),
//
//
//             ]),
//           );
//         }
//     );
//   }
//
//
// }


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nvc_restaurant_app/utils/images.dart';
import 'package:nvc_restaurant_app/utils/styles.dart';
import 'package:nvc_restaurant_app/view/widgets/custom_app_bar.dart';

import '../../../../utils/sizedboxes.dart';
import '../../../widgets/commons.dart';
import '../../../widgets/custom_listview_widget.dart';
import '../../../widgets/items_details_card.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomAppBar(title: "Order Details"),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset(Images.orderDetails,width: 240,)),
            Text("Your food to be delivered within",maxLines: 2,
              style:poppinsRegular.copyWith(fontSize: 14,color: Colors.black),),
            Text("20-30 Min.",style: poppinsMedium.copyWith(fontSize: 16, color: Theme.of(context).primaryColor),),
            const MainSpaceRow(title1: 'Order ID: ', text: '17 march 2024, 2:49 PM', title2: '34343',),
            const MainSpaceRow(title1: 'Payment Type ', text: 'Cash on Delivery', title2: '',),
            const MainSpaceRow(title1: 'Items: ', text: 'To be Delivered', title2: '2',),
            sizedBox15(),
            CustomListView(
              count: 2,
              itemBuilder: (index) {
                return const ItemDetailsCard(img: 'assets/images/food_deno.png', title: 'Chicken Biryani',
                  disc: 'Bone-in | Large Cuts | Curry Cuts', price: '329',);
              },
            ),
            Text('Customer Details', style: poppinsRegular.copyWith(fontSize: 14,color:Colors.black)),
           /* Row(
              children: [
                ClipOval(child: ),
              ],
            )*/






          ],
        ),
      ),

    );
  }
}
