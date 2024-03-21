import 'package:flutter/material.dart';
import 'package:nvc_restaurant_app/utils/sizedboxes.dart';

class CustomListView extends StatelessWidget {
  final int count;
  final Widget Function(int index) itemBuilder;
  final Widget? separator;
  const CustomListView({
    Key? key,
    required this.count,
    required this.itemBuilder, this.separator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: count,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return itemBuilder(index);
      }, separatorBuilder: (BuildContext context, int index) => separator ?? sizedBox10(),
    );
  }
}


