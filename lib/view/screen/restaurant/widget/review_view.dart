
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:nvc_restaurant_app/utils/sizedboxes.dart';
import 'package:nvc_restaurant_app/utils/styles.dart';
import 'package:nvc_restaurant_app/view/widgets/custom_listview_widget.dart';

import '../../../../utils/dimensions.dart';

class ReviewWidget extends StatelessWidget {
  final bool hasDivider;

  const ReviewWidget({Key? key,  required this.hasDivider, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      CustomListView(
        physics: const  NeverScrollableScrollPhysics(),
    paddingVertical: Dimensions.paddingSizeSmall,
    count: 10, itemBuilder: (int index) {
          return Column(children: [
            Row(children: [

              ClipOval(
                child: Image.asset("assets/images/food_deno.png",
                height: 60,
                width: 60,
                fit: BoxFit.cover,),
              ),
              const SizedBox(width: Dimensions.paddingSizeSmall),

              Expanded(child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [

                Text(
                  "Chicken Biryani",
                  maxLines: 1, overflow: TextOverflow.ellipsis,
                  style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSmall,),
                ),


                RatingBar.builder(
                  itemSize: Dimensions.paddingSizeDefault,
                  initialRating: 4,
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

                Text(
                  "Customer Name",
                  maxLines: 1, overflow: TextOverflow.ellipsis,
                  style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeExtraSmall, color:  Theme.of(context).disabledColor),
                ) ,
                const SizedBox(height: Dimensions.paddingSizeExtraSmall),

                Text("Very Very Good Biryani !!", style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeExtraSmall, color: Theme.of(context).disabledColor)),

              ])),

            ]),

            hasDivider ? Padding(
              padding: const EdgeInsets.only(left: 70),
              child: Divider(color: Theme.of(context).disabledColor),
            ) : const SizedBox(),

          ]);
      });


  }
}
