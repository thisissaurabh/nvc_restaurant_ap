// import 'dart:convert';
// import 'dart:io';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:nvc_restaurant_app/utils/styles.dart';
//
// import '../../../controller/auth_controller.dart';
// import '../../../helper/responsive_helper.dart';
// import '../../../utils/dimensions.dart';
// import '../../widgets/custom_appbar.dart';
// import '../../widgets/custom_textfield_widget.dart';
// import '../../widgets/custom_time_picker.dart';
// import '../../widgets/pass_view_widget.dart';
//
// class RestaurantRegistrationScreen extends StatefulWidget {
//   const RestaurantRegistrationScreen({Key? key}) : super(key: key);
//
//   @override
//   State<RestaurantRegistrationScreen> createState() => _RestaurantRegistrationScreenState();
// }
//
// class _RestaurantRegistrationScreenState extends State<RestaurantRegistrationScreen> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   final TextEditingController _vatController = TextEditingController();
//   final TextEditingController _fNameController = TextEditingController();
//   final TextEditingController _lNameController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();
//   TextEditingController _c = TextEditingController();
//   final FocusNode _nameFocus = FocusNode();
//   final FocusNode _addressFocus = FocusNode();
//   final FocusNode _vatFocus = FocusNode();
//   final FocusNode _fNameFocus = FocusNode();
//   final FocusNode _lNameFocus = FocusNode();
//   final FocusNode _phoneFocus = FocusNode();
//   final FocusNode _emailFocus = FocusNode();
//   final FocusNode _passwordFocus = FocusNode();
//   final FocusNode _confirmPasswordFocus = FocusNode();
//   final bool _canBack = false;
//   bool firstTime = true;
//   final ScrollController _scrollController = ScrollController();
//
//
//   String? _countryDialCode;
//
//
//   @override
//   void initState() {
//     super.initState();
//
//
//
//
//
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AuthController>(builder: (authController) {
//       return WillPopScope(
//         onWillPop: () async{
//           // if(_canBack) {
//           //   return true;
//           // }else {
//           //   authController.showBackPressedDialogue('your_registration_not_setup_yet'.tr);
//           //   return false;
//           // }
//         },
//         child: Scaffold(
//           appBar: CustomAppBar(title: 'restaurant_application'.tr,
//               onBackPressed: () {} /*=>  authController.showBackPressedDialogue('your_registration_not_setup_yet'.tr)*/),
//           body: SafeArea(
//             child: Center(child: SizedBox(width: context.width, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//
//               // const SizedBox(height: Dimensions.paddingSizeDefault),
//               // const RegistrationStepperWidget(status: '0'),
//
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge, vertical:  Dimensions.paddingSizeSmall),
//                 child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                   Text(
//                     "sdmmsdks",
//                     // authController.storeStatus == 0.4 ? 'provide_store_information_to_proceed_next'.tr : 'provide_owner_information_to_confirm'.tr,
//                     style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).hintColor),
//                   ),
//
//                   const SizedBox(height: Dimensions.paddingSizeSmall),
//
//                   LinearProgressIndicator(
//                     backgroundColor: Theme.of(context).disabledColor, minHeight: 2,
//                     // value: authController.storeStatus,
//                   ),
//                 ]),
//               ),
//
//
//
//
//               Expanded(
//                   child: SingleChildScrollView(
//                     controller: _scrollController,
//                     padding: ResponsiveHelper.isDesktop(context) ? EdgeInsets.zero : const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall, horizontal: Dimensions.paddingSizeDefault),
//                     child: SizedBox(
//                       width: Dimensions.webMaxWidth,
//                       child: Column(children: [
//
//                         Visibility(
//                           // visible: authController.storeStatus == 0.4,
//                           child: Column(children: [
//
//                             Row(children: [
//                               Expanded(flex: 4, child:  Align(alignment: Alignment.center, child: Stack(children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(5.0),
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
//                                     child: authController.pickedLogo != null ? GetPlatform.isWeb ? Image.network(
//                                       authController.pickedLogo!.path, width: 150, height: 120, fit: BoxFit.cover,
//                                     ) : Image.file(
//                                       File(authController.pickedLogo!.path), width: 150, height: 120, fit: BoxFit.cover,
//                                     ) : SizedBox(
//                                       width: 150, height: 120,
//                                       child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//
//                                         Icon(Icons.camera_alt, size: 38, color: Theme.of(context).disabledColor),
//                                         const SizedBox(height: Dimensions.paddingSizeSmall),
//
//                                         Text(
//                                           'select_restaurant_logo'.tr,
//                                           style: poppinsMedium.copyWith(color: Theme.of(context).disabledColor), textAlign: TextAlign.center,
//                                         ),
//                                       ]),
//                                     ),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   bottom: 0, right: 0, top: 0, left: 0,
//                                   child: InkWell(
//                                     onTap: () => authController.pickImageForReg(true, false),
//                                     child: DottedBorder(
//                                       color: Theme.of(context).primaryColor,
//                                       strokeWidth: 1,
//                                       strokeCap: StrokeCap.butt,
//                                       dashPattern: const [5, 5],
//                                       padding: const EdgeInsets.all(0),
//                                       borderType: BorderType.RRect,
//                                       radius: const Radius.circular(Dimensions.radiusDefault),
//                                       child: Center(
//                                         child: Visibility(
//                                           visible: authController.pickedLogo != null,
//                                           child: Container(
//                                             padding: const EdgeInsets.all(25),
//                                             decoration: BoxDecoration(
//                                               border: Border.all(width: 2, color: Colors.white),
//                                               shape: BoxShape.circle,
//                                             ),
//                                             child: const Icon(Icons.camera_alt, color: Colors.white),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ])),),
//                               const SizedBox(width: Dimensions.paddingSizeSmall),
//
//                               Expanded(flex: 6, child: Stack(children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(5.0),
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
//                                     child: authController.pickedCover != null ? GetPlatform.isWeb ? Image.network(
//                                       authController.pickedCover!.path, width: context.width, height: 120, fit: BoxFit.cover,
//                                     ) : Image.file(
//                                       File(authController.pickedCover!.path), width: context.width, height: 120, fit: BoxFit.cover,
//                                     ) : SizedBox(
//                                       width: context.width, height: 120,
//                                       child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//
//                                         Icon(Icons.camera_alt, size: 38, color: Theme.of(context).disabledColor),
//                                         const SizedBox(height: Dimensions.paddingSizeSmall),
//
//                                         Text(
//                                           'select_restaurant_cover_photo'.tr,
//                                           style: poppinsMedium.copyWith(color: Theme.of(context).disabledColor), textAlign: TextAlign.center,
//                                         ),
//                                       ]),
//                                     ),
//                                   ),
//                                 ),
//
//                                 Positioned(
//                                   bottom: 0, right: 0, top: 0, left: 0,
//                                   child: InkWell(
//                                     onTap: () => authController.pickImageForReg(false, false),
//                                     child: DottedBorder(
//                                       color: Theme.of(context).primaryColor,
//                                       strokeWidth: 1,
//                                       strokeCap: StrokeCap.butt,
//                                       dashPattern: const [5, 5],
//                                       padding: const EdgeInsets.all(0),
//                                       borderType: BorderType.RRect,
//                                       radius: const Radius.circular(Dimensions.radiusDefault),
//                                       child: Center(
//                                         child: Visibility(
//                                           visible: authController.pickedCover != null,
//                                           child: Container(
//                                             padding: const EdgeInsets.all(25),
//                                             decoration: BoxDecoration(
//                                               border: Border.all(width: 3, color: Colors.white),
//                                               shape: BoxShape.circle,
//                                             ),
//                                             child: const Icon(Icons.camera_alt, color: Colors.white, size: 50),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ]),),
//                             ]),
//                             const SizedBox(height: Dimensions.paddingSizeExtraLarge),
//
//
//                        Padding(
//                         padding: const EdgeInsets.only(bottom: Dimensions.paddingSizeExtraLarge),
//                         child: CustomTextField(
//                           hintText: '${'restaurant_name'.tr} ',
//                           controller: _nameController,
//                           focusNode: _nameFocus,
//                           nextFocus: _addressFocus,
//                           inputType: TextInputType.name,
//                           capitalization: TextCapitalization.words,
//                         ),
//                       ),
//                             // const SizedBox(height: Dimensions.paddingSizeExtraLarge),
//                     const SizedBox(height: Dimensions.paddingSizeLarge),
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: Dimensions.paddingSizeExtraLarge),
//                       child: CustomTextField(
//                         hintText: '${'restaurant_address'.tr} ',
//                         controller: _addressController,
//                         focusNode: _addressFocus,
//                         nextFocus: _vatFocus,
//                         inputType: TextInputType.text,
//                         capitalization: TextCapitalization.sentences,
//                         maxLines: 3,
//                       ),
//                     ),
//
//                             CustomTextField(
//                               hintText: 'vat_tax'.tr,
//                               controller: _vatController,
//                               focusNode: _vatFocus,
//                               inputAction: TextInputAction.done,
//                               inputType: TextInputType.number,
//                               isAmount: true,
//                             ),
//                             const SizedBox(height: Dimensions.paddingSizeLarge),
//
//                             // InkWell(
//                             //   onTap: () {
//                             //     Get.dialog(const CustomTimePicker());
//                             //   },
//                             //   child: Container(
//                             //     height: 50,
//                             //     decoration: BoxDecoration(
//                             //       color: Theme.of(context).cardColor,
//                             //       borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
//                             //       border: Border.all(color: Theme.of(context).primaryColor, width: 0.5),
//                             //     ),
//                             //     padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
//                             //     child: Row(children: [
//                             //       Expanded(child: Text(
//                             //         '${authController.storeMinTime} : ${authController.storeMaxTime} ${authController.storeTimeUnit}',
//                             //         style: robotoMedium,
//                             //       )),
//                             //       Icon(Icons.access_time_filled, color: Theme.of(context).primaryColor,)
//                             //     ]),
//                             //   ),
//                             // )
//
//                           ]),
//                         ),
//
//                         Visibility(
//                           // visible: authController.storeStatus != 0.4,
//                           child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
//
//                             Row(children: [
//                               Expanded(child: CustomTextField(
//                                 hintText : 'first_name'.tr,
//                                 controller: _fNameController,
//                                 focusNode: _fNameFocus,
//                                 nextFocus: _lNameFocus,
//                                 inputType: TextInputType.name,
//                                 capitalization: TextCapitalization.words,
//                               )),
//                               const SizedBox(width: Dimensions.paddingSizeSmall),
//
//                               Expanded(child: CustomTextField(
//                                 hintText : 'last_name'.tr,
//                                 controller: _lNameController,
//                                 focusNode: _lNameFocus,
//                                 nextFocus: _phoneFocus,
//                                 inputType: TextInputType.name,
//                                 capitalization: TextCapitalization.words,
//                               )),
//                             ]),
//
//                             const SizedBox(height: Dimensions.paddingSizeExtraLarge),
//
//                             CustomTextField(
//                               hintText : ResponsiveHelper.isDesktop(context) ? 'phone'.tr : 'enter_phone_number'.tr,
//                               controller: _phoneController,
//                               focusNode: _phoneFocus,
//                               nextFocus: _emailFocus,
//                               inputType: TextInputType.phone,
//                               isPhone: true,
//                               showTitle: ResponsiveHelper.isDesktop(context),
//                               // onCountryChanged: (CountryCode countryCode) {
//                               //   _countryDialCode = countryCode.dialCode;
//                               // },
//                               // countryDialCode: _countryDialCode != null ? CountryCode.fromCountryCode(Get.find<SplashController>().configModel!.country!).code
//                               //     : Get.find<LocalizationController>().locale.countryCode,
//                             ),
//                             const SizedBox(height: Dimensions.paddingSizeExtraLarge),
//
//                             CustomTextField(
//                               hintText: 'email'.tr,
//                               controller: _emailController,
//                               focusNode: _emailFocus,
//                               nextFocus: _passwordFocus,
//                               inputType: TextInputType.emailAddress,
//                             ),
//                             const SizedBox(height: Dimensions.paddingSizeExtraLarge),
//
//                             CustomTextField(
//                               hintText: 'password'.tr,
//                               controller: _passwordController,
//                               focusNode: _passwordFocus,
//                               nextFocus: _confirmPasswordFocus,
//                               inputType: TextInputType.visiblePassword,
//                               isPassword: true,
//                               onChanged: (value){
//                                 if(value != null && value.isNotEmpty){
//                                   if(!authController.showPassView){
//                                     authController.showHidePass();
//                                   }
//                                   authController.validPassCheck(value);
//                                 }else{
//                                   if(authController.showPassView){
//                                     authController.showHidePass();
//                                   }
//                                 }
//                               },
//                             ),
//                             authController.showPassView ? const PassView() : const SizedBox(),
//
//                             const SizedBox(height: Dimensions.paddingSizeExtraLarge),
//
//                             CustomTextField(
//                               hintText: 'confirm_password'.tr,
//                               controller: _confirmPasswordController,
//                               focusNode: _confirmPasswordFocus,
//                               inputType: TextInputType.visiblePassword,
//                               isPassword: true,
//                               // nextFocus: authController.focusList[0],
//                             ),
//                             const SizedBox(height: Dimensions.paddingSizeExtraLarge),
//
//                             AdditionalDataSection(authController: authController, scrollController: _scrollController),
//
//                           ]),
//                         ),
//
//                       ]),
//                     ),
//                   )
//               ),
//
//
//               !authController.isLoading ? CustomButton(
//                 margin: EdgeInsets.all((ResponsiveHelper.isDesktop(context) || ResponsiveHelper.isWeb()) ? 0 : Dimensions.paddingSizeSmall),
//                 buttonText: authController.storeStatus == 0.4 && !ResponsiveHelper.isDesktop(context) ? 'next'.tr : 'submit'.tr,
//                 onPressed: () {
//                   bool defaultNameNull = false;
//                   bool defaultAddressNull = false;
//                   bool customFieldEmpty = false;
//                   for(int index=0; index<_languageList!.length; index++) {
//                     if(_languageList![index].key == 'en') {
//                       if (_nameController[index].text.trim().isEmpty) {
//                         defaultNameNull = true;
//                       }
//                       if(_addressController[index].text.trim().isEmpty){
//                         defaultAddressNull = true;
//                       }
//                       break;
//                     }
//                   }
//
//                   Map<String, dynamic> additionalData = {};
//                   List<FilePickerResult> additionalDocuments = [];
//                   List<String> additionalDocumentsInputType = [];
//
//                   if(authController.storeStatus != 0.4) {
//                     for (Data data in authController.dataList!) {
//                       bool isTextField = data.fieldType == 'text' || data.fieldType == 'number' || data.fieldType == 'email' || data.fieldType == 'phone';
//                       bool isDate = data.fieldType == 'date';
//                       bool isCheckBox = data.fieldType == 'check_box';
//                       bool isFile = data.fieldType == 'file';
//                       int index = authController.dataList!.indexOf(data);
//                       bool isRequired = data.isRequired == 1;
//
//                       if(isTextField) {
//                         print('=====check text field : ${authController.additionalList![index].text == ''}');
//                         if(authController.additionalList![index].text != '') {
//                           additionalData.addAll({data.inputData! : authController.additionalList![index].text});
//                         } else {
//                           if(isRequired) {
//                             customFieldEmpty = true;
//                             showCustomSnackBar('${data.placeholderData} ${'can_not_be_empty'.tr}');
//                             break;
//                           }
//                         }
//                       } else if(isDate) {
//                         print('---check date : ${authController.additionalList![index]}');
//                         if(authController.additionalList![index] != null) {
//                           additionalData.addAll({data.inputData! : authController.additionalList![index]});
//                         } else {
//                           if(isRequired) {
//                             customFieldEmpty = true;
//                             showCustomSnackBar('${data.placeholderData} ${'can_not_be_empty'.tr}');
//                             break;
//                           }
//                         }
//                       } else if(isCheckBox) {
//                         List<String> checkData = [];
//                         bool noNeedToGoElse = false;
//                         for(var e in authController.additionalList![index]) {
//                           if(e != 0) {
//                             checkData.add(e);
//                             customFieldEmpty = false;
//                             noNeedToGoElse = true;
//                           } else if(!noNeedToGoElse) {
//                             customFieldEmpty = true;
//                           }
//                         }
//                         if(customFieldEmpty && isRequired) {
//                           showCustomSnackBar( '${'please_set_data_in'.tr} ${authController.dataList![index].inputData!.replaceAll('_', ' ')} ${'field'.tr}');
//                           break;
//                         } else {
//                           additionalData.addAll({data.inputData! : checkData});
//                         }
//
//                       } else if(isFile) {
//                         print('---check file : ${authController.additionalList![index]}');
//                         if(authController.additionalList![index].length == 0 && isRequired) {
//                           customFieldEmpty = true;
//                           showCustomSnackBar('${'please_add'.tr} ${authController.dataList![index].inputData!.replaceAll('_', ' ')}');
//                           break;
//                         } else {
//                           authController.additionalList![index].forEach((file) {
//                             additionalDocuments.add(file);
//                             additionalDocumentsInputType.add(authController.dataList![index].inputData!);
//                           });
//
//                         }
//                       }
//
//                     }
//                   }
//
//
//                   String vat = _vatController.text.trim();
//                   String minTime = authController.storeMinTime;
//                   String maxTime = authController.storeMaxTime;
//                   String fName = _fNameController.text.trim();
//                   String lName = _lNameController.text.trim();
//                   String phone = _phoneController.text.trim();
//                   String email = _emailController.text.trim();
//                   String password = _passwordController.text.trim();
//                   String confirmPassword = _confirmPasswordController.text.trim();
//
//                   bool valid = false;
//                   try {
//                     double.parse(maxTime);
//                     double.parse(minTime);
//                     valid = true;
//                   } on FormatException {
//                     valid = false;
//                   }
//                   if(authController.storeStatus == 0.4){
//                     if(authController.pickedLogo == null) {
//                       showCustomSnackBar('select_restaurant_logo'.tr);
//                     }else if(authController.pickedCover == null) {
//                       showCustomSnackBar('select_restaurant_cover_photo'.tr);
//                     }else if(defaultNameNull) {
//                       showCustomSnackBar('enter_restaurant_name'.tr);
//                     }else if(defaultAddressNull) {
//                       showCustomSnackBar('enter_restaurant_address'.tr);
//                     }else if(vat.isEmpty) {
//                       showCustomSnackBar('enter_vat_amount'.tr);
//                     }else if(minTime.isEmpty) {
//                       showCustomSnackBar('enter_minimum_delivery_time'.tr);
//                     }else if(maxTime.isEmpty) {
//                       showCustomSnackBar('enter_maximum_delivery_time'.tr);
//                     }else if(!valid) {
//                       showCustomSnackBar('please_enter_the_max_min_delivery_time'.tr);
//                     }else if(valid && double.parse(minTime) > double.parse(maxTime)) {
//                       showCustomSnackBar('maximum_delivery_time_can_not_be_smaller_then_minimum_delivery_time'.tr);
//                     }else if(authController.restaurantLocation == null) {
//                       showCustomSnackBar('set_restaurant_location'.tr);
//                     } else{
//                       authController.storeStatusChange(0.8);
//                       firstTime = true;
//                     }
//                   } else {
//                     if(fName.isEmpty) {
//                       showCustomSnackBar('enter_your_first_name'.tr);
//                     }else if(lName.isEmpty) {
//                       showCustomSnackBar('enter_your_last_name'.tr);
//                     }else if(phone.isEmpty) {
//                       showCustomSnackBar('enter_your_phone_number'.tr);
//                     }else if(email.isEmpty) {
//                       showCustomSnackBar('enter_your_email_address'.tr);
//                     }else if(!GetUtils.isEmail(email)) {
//                       showCustomSnackBar('enter_a_valid_email_address'.tr);
//                     }else if(password.isEmpty) {
//                       showCustomSnackBar('enter_password'.tr);
//                     }else if(password.length < 6) {
//                       showCustomSnackBar('password_should_be'.tr);
//                     }else if(password != confirmPassword) {
//                       showCustomSnackBar('confirm_password_does_not_matched'.tr);
//                     }else if(customFieldEmpty) {
//                       print('not provide addition data');
//                     }else {
//                       List<Translation> translation = [];
//                       for(int index=0; index<_languageList!.length; index++) {
//                         translation.add(Translation(
//                           locale: _languageList![index].key, key: 'name',
//                           value: _nameController[index].text.trim().isNotEmpty ? _nameController[index].text.trim()
//                               : _nameController[0].text.trim(),
//                         ));
//                         translation.add(Translation(
//                           locale: _languageList![index].key, key: 'address',
//                           value: _addressController[index].text.trim().isNotEmpty ? _addressController[index].text.trim()
//                               : _addressController[0].text.trim(),
//                         ));
//                       }
//
//                       List<String> cuisines = [];
//                       for (var index in authController.selectedCuisines!) {
//                         cuisines.add(authController.cuisineModel!.cuisines![index].id.toString());
//                       }
//                       customPrint('-----cuisines------: $cuisines');
//
//                       Map<String, String> data = {};
//
//                       data.addAll(RestaurantBody(
//                         deliveryTimeType: authController.storeTimeUnit,
//                         translation: jsonEncode(translation), vat: vat, minDeliveryTime: minTime,
//                         maxDeliveryTime: maxTime, lat: authController.restaurantLocation!.latitude.toString(), email: email,
//                         lng: authController.restaurantLocation!.longitude.toString(), fName: fName, lName: lName, phone: phone,
//                         password: password, zoneId: authController.zoneList![authController.selectedZoneIndex!].id.toString(),
//                         cuisineId: cuisines,
//                       ).toJson());
//
//                       data.addAll({
//                         'additional_data': jsonEncode(additionalData),
//                       });
//
//                       print('-------final data-- :  $data');
//                       print('-------additional document-- :  $additionalDocuments');
//                       print('-------additional document type-- :  $additionalDocumentsInputType');
//
//                       authController.registerRestaurant(data, additionalDocuments, additionalDocumentsInputType);
//
//                     }}
//                 },
//               ) : const Center(child: CircularProgressIndicator()),
//
//
//             ]),
//             )),
//           ),
//         ),
//       );
//     }
//     );
//   }
// }