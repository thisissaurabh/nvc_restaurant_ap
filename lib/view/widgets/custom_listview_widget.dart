import 'package:flutter/material.dart';
import 'package:nvc_restaurant_app/utils/sizedboxes.dart';

import '../../utils/dimensions.dart';

class CustomListView extends StatelessWidget {
  final int count;
  final Widget Function(int index) itemBuilder;
  final Widget? separator;
  final double? paddingVertical;
  final ScrollPhysics? physics;
  const CustomListView({
    Key? key,
    required this.count,
    required this.itemBuilder, this.separator,  this.paddingVertical, this.physics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: physics ?? BouncingScrollPhysics(),
      padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault,vertical:paddingVertical?? 0),
      itemCount: count,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return itemBuilder(index);
      }, separatorBuilder: (BuildContext context, int index) => separator ?? sizedBox10(),
    );
  }
}


