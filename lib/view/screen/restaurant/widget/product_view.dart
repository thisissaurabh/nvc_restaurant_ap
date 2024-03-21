import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nvc_restaurant_app/utils/sizedboxes.dart';
import 'package:nvc_restaurant_app/utils/styles.dart';
import 'package:nvc_restaurant_app/view/widgets/custom_listview_widget.dart';
import 'package:nvc_restaurant_app/view/widgets/customized_image_asset_widget.dart';

import '../../../../utils/dimensions.dart';
import '../../../../utils/images.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      physics: const  NeverScrollableScrollPhysics(),
      paddingVertical: Dimensions.paddingSizeSmall,
      separator: const Divider(),
      count: 10, itemBuilder: (int index) {
      return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 4,
            child: Row(
              children: [
                Flexible(
                  child: const CustomImageAssetWidget(
                      radius: Dimensions.paddingSizeExtraSmall,
                      height: 70,
                      width: 70,
                      image: "assets/images/food_deno.png"),
                ),
                sizedBoxW15(),
                Flexible(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Chicken Biryani",
                        maxLines: 2,
                        style: poppinsRegular.copyWith(fontSize: 12,),),
                      sizedBox5(),
                      RatingBar.builder(
                        itemSize: Dimensions.paddingSizeDefault,
                        initialRating: 3,
                        minRating: 1,
                        unratedColor: Theme.of(context).disabledColor,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemBuilder: (context, _) =>const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                        },
                      ),
                      sizedBox5(),
                      Text("₹ 329",style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSmall,),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                Flexible(child: Image.asset(Images.pencil,width: 25,)),
                sizedBoxW5(),
                Flexible(child: Image.asset(Images.trash,width: 25,))
              ],
            ),
          )

        ],
      );
    },

    );
  }
}
