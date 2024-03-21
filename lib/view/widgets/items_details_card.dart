
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nvc_restaurant_app/utils/styles.dart';
import '../../utils/sizedboxes.dart';
import 'customized_image_asset_widget.dart';



class ItemDetailsCard extends StatelessWidget {
  final String img;
  final String title;
  final String disc;
  final String price;
  final Widget? widget;

  const ItemDetailsCard({super.key, required this.img, required this.title, required this.disc, required this.price,  this.widget});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CustomImageAssetWidget(
            height: 82,
            width: 87,
            radius: 5,
            image: img,
          ),
        ),
        sizedBoxW10(),
        Expanded(flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: poppinsRegular.copyWith(fontSize: 14,color: Colors.black),
              ),
              Text(
                disc,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:  poppinsRegular.copyWith(fontSize: 10,color: Theme.of(context).disabledColor),
              ),
              sizedBox10(),
              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                     '₹ ${price}',
                      style:  poppinsRegular.copyWith(fontSize: 16,color: Colors.black),
                    ),
                  ),
                  const Spacer(),
                  widget ?? const SizedBox()
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
