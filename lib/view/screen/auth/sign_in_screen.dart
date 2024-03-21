
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nvc_restaurant_app/utils/styles.dart';
import 'package:nvc_restaurant_app/view/screen/dashboard/dashboard_Screen.dart';

import '../../../controller/auth_controller.dart';
import '../../../helper/route_helper.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/images.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield_widget.dart';

class SignInScreen extends StatelessWidget {
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // _emailController.text = Get.find<AuthController>().getUserNumber();
    // _passwordController.text = Get.find<AuthController>().getUserPassword();

    return Scaffold(
      body: SafeArea(child: Center(
        child: Scrollbar(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
            child: Center(
              child: SizedBox(
                width: 1170,
                child: GetBuilder<AuthController>(builder: (authController) {
                  return Column(children: [

                    const SizedBox(height: Dimensions.paddingSizeExtraSmall),
                    Image.asset(Images.logo, width: 220),
                    const SizedBox(height: Dimensions.paddingSizeSmall),
                    Text('SIGN IN', style: poppinsSemiBold.copyWith(fontSize: 32,
                        color: Theme.of(context).primaryColor)),
                    const SizedBox(height: Dimensions.paddingSizeExtraSmall),



                    Column(children: [
                      CustomTextField(
                        hintText: 'E-Mail',
                        controller: _emailController,
                        focusNode: _emailFocus,
                        nextFocus: _passwordFocus,
                        inputType: TextInputType.emailAddress,
                        prefixIcon: Icons.mail_outline_rounded,
                        divider: false,
                        showBorder: false,
                      ),
                      const SizedBox(height: Dimensions.paddingSizeExtraSmall),

                      CustomTextField(
                        hintText: 'Password',
                        controller: _passwordController,
                        focusNode: _passwordFocus,
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.visiblePassword,
                        prefixIcon: Icons.lock,
                        isPassword: true,
                        showBorder: false,
                        divider: false,
                        // onSubmit: (text) => GetPlatform.isWeb ? _login(authController) : null,
                      ),

                    ]),
                    const SizedBox(height: 10),

                    Row(children: [
                      Expanded(
                        child: ListTile(
                          onTap: () {
                            // =>
                            //     authController.toggleRememberMe()
                          },
                          leading: Checkbox(
                            activeColor: Theme.of(context).primaryColor,
                            value: authController.isActiveRememberMe,
                            onChanged: (bool? isChecked) => authController.toggleRememberMe(),
                          ),
                          title: Text('Remember Me'),
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          horizontalTitleGap: 0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                         /* =>
                          Get.toNamed(RouteHelper.getForgotPassRoute()*/},
                        child: const Text('Forgot password?',
                        ),
                      ),
                    ]),
                    const SizedBox(height: 50),

                   CustomButton(
                      buttonText: 'Sign In',
                      onPressed: () =>  Get.offAllNamed(RouteHelper.getMainRoute()) /*=> _login(authController)*/,
                    ) ,
                  TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: const Size(1, 40),
                      ),
                      onPressed: () async {
                        Get.toNamed(RouteHelper.getSignUPRoute());
                       /* Get.toNamed(RouteHelper.getRestaurantRegistrationRoute());*/
                      },
                      child: RichText(text: TextSpan(children: [
                        TextSpan(text: 'join as ', style: poppinsRegular.copyWith(color: Theme.of(context).disabledColor)),
                        TextSpan(text: 'restaurant', style: poppinsRegular.copyWith(color: Theme.of(context).textTheme.bodyLarge!.color)),
                      ])),
                    ) /*: const SizedBox(),*/

                  ]);
                }),
              ),
            ),
          ),
        ),
      )),
    );
  }

/*  void _login(AuthController authController) async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    if (email.isEmpty) {
      showCustomSnackBar('enter_email_address'.tr);
    }else if (!GetUtils.isEmail(email)) {
      showCustomSnackBar('enter_a_valid_email_address'.tr);
    }else if (password.isEmpty) {
      showCustomSnackBar('enter_password'.tr);
    }else if (password.length < 6) {
      showCustomSnackBar('password_should_be'.tr);
    }else {
      authController.login(email, password).then((status) async {
        if(status != null) {
          if (status.isSuccess) {
            if (authController.isActiveRememberMe) {
              authController.saveUserNumberAndPassword(email, password);
            } else {
              authController.clearUserNumberAndPassword();
            }
            await Get.find<AuthController>().getProfile();
            Get.offAllNamed(RouteHelper.getInitialRoute());
          }else {
            if(status.message != 'no') {
              showCustomSnackBar(status.message);
            }
          }
        }
      });
    }

    *//*print('------------1');
    final _imageData = await Http.get(Uri.parse('https://cdn.dribbble.com/users/1622791/screenshots/11174104/flutter_intro.png'));
    print('------------2');
    String _stringImage = base64Encode(_imageData.bodyBytes);
    print('------------3 {$_stringImage}');
    SharedPreferences _sp = await SharedPreferences.getInstance();
    _sp.setString('image', _stringImage);
    print('------------4');
    Uint8List _uintImage = base64Decode(_sp.getString('image'));
    authController.setImage(_uintImage);
    //await _thetaImage.writeAsBytes(_imageData.bodyBytes);
    print('------------5');*//*
  }*/
}

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Color color1 = const Color(0xFF00ACB3);
    Color color2 = const Color(0xFF044042);
    var paint = Paint()
    // ..color = Colors.teal
      ..shader = RadialGradient(
        colors: [
          color1,
          color2,
        ],
      ).createShader(Rect.fromCircle(
        center: const Offset(0,0),
        radius: 10,
      ));
    // ..shader = ui.Gradient.linear(
    //   Offset(0,0),
    //   Offset(1,1),
    //   [
    //     color1,
    //     color2,
    //   ],
    // );

    // ..strokeWidth = 15;

    var path = Path();

    path.moveTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.7,
        size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9,
        size.width * 1.0, size.height * 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}