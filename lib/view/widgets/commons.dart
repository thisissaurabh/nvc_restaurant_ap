import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../utils/dimensions.dart';
import '../../utils/styles.dart';


class MainSpaceRow extends StatelessWidget {
  final String title1;
  final String text;
  final String  title2;
  final TextStyle? style1;
  final TextStyle? style2;
  final TextStyle? style3;

  final bool row2;
  const MainSpaceRow({Key? key,   this.row2 = true, required this.title1, required this.text, required this.title2, this.style1, this.style2, this.style3,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Row(
            children: [
              Text(title1,style: style1 ?? poppinsRegular.copyWith(fontSize: 12,color: Theme.of(context).disabledColor),),
              row2 ? Text(title2,style: style2 ?? poppinsRegular.copyWith(fontSize: 14,color: Colors.black),) : SizedBox(),
            ],
          ),
        ),
        Flexible(child: Text(text , overflow:TextOverflow.ellipsis, style: style3 ?? poppinsRegular.copyWith(fontSize: 12,color: Colors.black),))
      ],
    );
  }
}

class CustomMainSpaceRow extends StatelessWidget {
  final String title;
  final String text;
  final TextStyle? titleStyle;
  final TextStyle? textStyle;
  const CustomMainSpaceRow({super.key, required this.title, required this.text, this.titleStyle, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(title,style:titleStyle ?? poppinsMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall,color: Theme.of(context).disabledColor),),
        ),
        Flexible(
          child: Text(text,style: textStyle?? poppinsMedium.copyWith(
              fontSize: Dimensions.fontSizeLarge,color: Theme.of(context).primaryColor),),
        ),
      ],
    );
  }
}
