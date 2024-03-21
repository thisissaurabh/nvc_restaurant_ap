import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nvc_restaurant_app/utils/dimensions.dart';
import 'package:nvc_restaurant_app/utils/images.dart';
import 'package:nvc_restaurant_app/utils/sizedboxes.dart';
import 'package:nvc_restaurant_app/utils/styles.dart';
import 'package:nvc_restaurant_app/view/widgets/commons.dart';
import 'package:nvc_restaurant_app/view/widgets/custom_app_bar.dart';
import 'package:nvc_restaurant_app/view/widgets/custom_listview_widget.dart';
import '../../../controller/bank_controller.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/order_button.dart';
import '../../widgets/transaction_card_widget.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomAppBar(title: "Wallet",isBackButtonExist: false,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: GetBuilder<BankController>(builder: (bankController) {
            return Column(
              children: [
                PaddedContainer(
                  borderRadius: Dimensions.paddingSizeExtraSmall,
                  color: Theme.of(context).primaryColor,
                  vertical: Dimensions.paddingSizeDefault,
                  horizontal:  Dimensions.paddingSizeDefault,
                  child: Row(
                    children: [
                      Image.asset(Images.wallet,height: 82,),
                      Expanded(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Balance Unadjusted",style: poppinsMedium.copyWith(fontSize: 10,color: Colors.white),),
                            sizedBox10(),
                            Text('₹ 0.00',style: poppinsMedium.copyWith(fontSize: 16,color:Colors.white),),
                            sizedBox10(),
                            Row(
                              children: [
                                PaddedContainer(vertical: 4,
                                  horizontal: 11,
                                  child: Text("Adjust Payments",style: poppinsRegular.copyWith(fontSize: 10),
                                  ),),
                                sizedBoxW5(),
                                PaddedContainer(vertical: 4,
                                  horizontal: 11,
                                  child: Text("Withdraw",style: poppinsRegular.copyWith(fontSize: 10),
                                  ),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                sizedBox20(),
                Row(
                  children: [
                    Expanded(
                      child: PaddedContainer(
                          vertical: Dimensions.fontSizeMedium,
                          borderRadius: Dimensions.paddingSizeExtraSmall,
                          borderColor: Theme.of(context).primaryColor,
                          horizontal: Dimensions.paddingSizeExtraSmall,
                          child: Column(
                            children: [
                              Text("₹ 0.00",style: poppinsMedium.copyWith(
                                  fontSize: Dimensions.fontSizeLarge,color: Theme.of(context).primaryColor),),
                              sizedBox5(),
                              Text("Cash in Hand",style: poppinsMedium.copyWith(
                                  fontSize: Dimensions.fontSizeExtraSmall,color: Theme.of(context).disabledColor),),
                            ],
                          )),
                    ),
                    sizedBoxW10(),
                    Expanded(
                      child: PaddedContainer(
                          vertical: Dimensions.fontSizeMedium,
                          borderRadius: Dimensions.paddingSizeExtraSmall,
                          borderColor: Theme.of(context).primaryColor,
                          horizontal: Dimensions.paddingSizeExtraSmall,
                          child: Column(
                            children: [
                              Text("₹ 0.00",style: poppinsMedium.copyWith(
                                  fontSize: Dimensions.fontSizeLarge,color: Theme.of(context).primaryColor),),
                              sizedBox5(),
                              Text("Cash in Hand",style: poppinsMedium.copyWith(
                                  fontSize: Dimensions.fontSizeExtraSmall,color: Theme.of(context).disabledColor),),
                            ],
                          )),
                    ),
                  ],
                ),
                sizedBox10(),
                PaddedContainer(
                    vertical: Dimensions.paddingSizeDefault,
                    borderRadius: Dimensions.paddingSizeExtraSmall,
                    borderColor: Theme.of(context).primaryColor,
                    horizontal: Dimensions.paddingSizeDefault,
                    child:
                    const CustomMainSpaceRow(title: 'Cash in Hand', text: '₹ 0.00',)
                ),
                sizedBox10(),
                PaddedContainer(
                    vertical: Dimensions.paddingSizeDefault,
                    borderRadius: Dimensions.paddingSizeExtraSmall,
                    borderColor: Theme.of(context).primaryColor,
                    horizontal: Dimensions.paddingSizeDefault,
                    child:
                    const CustomMainSpaceRow(title: 'Already Withdrawn', text: '₹ 0.00',)
                ),
                sizedBox10(),
                PaddedContainer(
                    vertical: Dimensions.paddingSizeDefault,
                    borderRadius: Dimensions.paddingSizeExtraSmall,
                    borderColor: Theme.of(context).primaryColor,
                    horizontal: Dimensions.paddingSizeDefault,
                    child:
                    const CustomMainSpaceRow(title: 'Total Earning', text: '₹ 0.00',)
                ),
                sizedBox20(),
                SizedBox(
                    height: 30,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: bankController.categoryList.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () => bankController.setCategoryIndex(index),
                            child: OrderButton(
                              isSelected:
                              index == bankController.categoryIndex,
                              txt: bankController.categoryList[index].name,)
                        );
                      },
                    )),
                sizedBox10(),
                 CustomMainSpaceRow(title: 'Transaction History',
                  titleStyle: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSmall),
                  text: 'View All',
                   textStyle: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeDefault,
                   color: Theme.of(context).primaryColor),
                 ),
                sizedBox10(),
                CustomListView(
                  count: 2,
                  separator: const Divider(),
                  itemBuilder: (index) {
                    return const TransactionCardWidget();
                  },
                ),
              ],
            );
          }),

        ),
      ),
    );
  }
}
