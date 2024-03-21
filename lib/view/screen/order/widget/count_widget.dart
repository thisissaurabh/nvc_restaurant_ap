
import 'package:flutter/material.dart';
import 'package:nvc_restaurant_app/utils/styles.dart';

import '../../../../utils/dimensions.dart';

class CountWidget extends StatelessWidget {
  final String title;
  final int? count;
  const CountWidget({Key? key, required this.title, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
        child: Column(children: [

          Text(title, style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeExtraSmall, color: Theme.of(context).cardColor)),
          const SizedBox(height: Dimensions.paddingSizeExtraSmall),

          Row(mainAxisAlignment: MainAxisAlignment.center, children: [

            Text('₹ ${count.toString()}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: poppinsMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraLarge, color: Theme.of(context).cardColor,
            )),

          ]),

        ]),
      ),
    );
  }
}
