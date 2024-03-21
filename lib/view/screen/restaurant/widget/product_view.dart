import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nvc_restaurant_app/utils/sizedboxes.dart';
import 'package:nvc_restaurant_app/utils/styles.dart';
import 'package:nvc_restaurant_app/view/widgets/customized_image_asset_widget.dart';

import '../../../../utils/dimensions.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomImageAssetWidget(
          radius: Dimensions.paddingSizeExtraSmall,
          height: 70,
            width: 70,
            image: "assets/images/food_deno.png"),
        sizedBoxW15(),
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Chicken Biryani",style: poppinsRegular.copyWith(fontSize: 12,),),
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
        )

      ],
    );
  }
}
