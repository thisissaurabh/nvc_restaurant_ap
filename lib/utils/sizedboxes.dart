import 'package:flutter/cupertino.dart';
import 'dimensions.dart';

Widget sizedBox5()  {
  return const SizedBox(height: Dimensions.paddingSizeExtraSmall);
}
Widget sizedBox10() {
  return const SizedBox(height: Dimensions.paddingSizeSmall);
}

Widget sizedBox20() {
  return const SizedBox(height: Dimensions.paddingSizeLarge);
}
Widget sizedBox15() {
  return const SizedBox(height: Dimensions.paddingSizeDefault);
}
Widget sizedBoxW10() {
  return const SizedBox(width: Dimensions.paddingSizeSmall);
}
Widget sizedBoxW15() {
  return const SizedBox(width: Dimensions.paddingSizeDefault);
}
Widget sizedBoxW5() {
  return const SizedBox(width: Dimensions.paddingSizeExtraSmall);
}