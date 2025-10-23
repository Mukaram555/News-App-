import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/SRC/Presentation/Common/Button/custom_button.dart';
import 'package:news_app/SRC/Presentation/Common/Textfield/text_field.dart';
import 'package:news_app/SRC/Presentation/Widgets/Auth/Login/Forget%20Password/forget_password.dart';
import 'package:news_app/SRC/Presentation/Widgets/Auth/Login/controller/Providers/password_visibility_provider.dart';
import 'package:news_app/SRC/Presentation/Widgets/Auth/signup/UI%20Screen/signup.dart';
import 'package:news_app/SRC/Presentation/Widgets/Auth/signup/prefrence/countory_pref.dart';
import 'package:provider/provider.dart';

import '../../Widgets/Auth/Login/UI Screens/login_screen.dart';
import '../../Widgets/components/bottom_navigation.dart';
import '../Textfield/text_field_pass.dart';

// ignore: must_be_immutable
class LoginSignupCommonScreen extends StatefulWidget {
  const LoginSignupCommonScreen({super.key, required this.buttontext});

  @override
  State<LoginSignupCommonScreen> createState() => _LoginScreenState();

  final String buttontext;
}

class _LoginScreenState extends State<LoginSignupCommonScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  ValueNotifier<bool> isChecked = ValueNotifier(true);

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.0.h),
        child: Form(
          key: _formkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Text(
                widget.buttontext == 'Login' ? 'Hello' : 'Hello !',
                style: widget.buttontext == 'Login'
                    ? Theme.of(context).textTheme.displayMedium
                    : Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
              ),
              SizedBox(height: 16.h),
              widget.buttontext == 'Login'
                  ? Text(
                      'Again !',
                      style: Theme.of(context).textTheme.displayMedium
                          ?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    )
                  : Container(),
              SizedBox(height: 20.h),
              Text(
                widget.buttontext == 'Login'
                    ? 'Welcome back you’ve \nbeen missed'
                    : 'Signup to get Started',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(height: 40.h),
              Consumer<EmailVisibilityProvider>(
                builder: (context, value, child) {
                  return TextFieldCustom(
                    textController: emailController,
                    lable: 'Email',
                    // key: ValueKey('password'),
                    isRequired: true,
                    // textFocusNode: focusNode,
                    validate: value.emailvalid,
                    // validate: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     print('==== kar kai');
                    //     return "email ";
                    //   } else {
                    //     print('==== na kai kai');

                    //     return null;
                    //   }
                    // },

                    // val: value,
                    icons: value.show == true ? Icons.cancel_outlined : null,
                  );
                },
              ),
              SizedBox(height: 16.h),
              TextFieldPassCustom(
                lable: 'Password',
                textController: passwordController,
                validate: (x) {
                  if (x == null || x.isEmpty) {
                    print('==== kar kai');
                    return "Password is Empty";
                  } else if (passwordController.text != '1234') {
                    print('==== na kai kai');

                    return 'Passowrd is incorrect';
                  } else {
                    print('==== na kai kai');

                    return null;
                  }
                },
              ),
              // TextFieldCustom(
              //   lable: 'Password',

              //   // isRequired: true,
              //   // isTrue: true,
              //   // validate: (x) {
              //   //   if (x == null || x.isEmpty) {
              //   //     print('==== kar kai');
              //   //     return "sam sha";
              //   //   } else {
              //   //     print('==== na kai kai');

              //   //     return null;
              //   //   }
              //   // },
              //   // EmailVisibilityProvider().emailvalid(
              //   //           textEditingController.text,
              //   //         ) ==
              //   //         null ||
              //   //     EmailVisibilityProvider()
              //   //         .emailvalid(textEditingController.text)
              //   //         .toString()
              //   //         .isEmpty
              //   // ? value.passwordvalid
              //   // : value.waitpasswordvalid,
              //   // key: ValueKey('password'),
              //   // value: value,
              //   // icons: value.isVisibility == false
              //   //     ? Icons.visibility
              //   //     : Icons.visibility_off,
              //   textController: passwordController,
              //   // textFocusNode: focusNode,
              // ),
              // Consumer<PasswordVisibilityProvider>(
              //   builder: (context, value, child) {
              //     return
              //       TextFieldCustom(
              //       lable: 'Password',
              //       // isRequired: true,
              //       isTrue: true,
              //
              //       // validate: (x) {
              //       //   if (x == null || x.isEmpty) {
              //       //     print('==== kar kai');
              //       //     return "sam sha";
              //       //   } else {
              //       //     print('==== na kai kai');
              //
              //       //     return null;
              //       //   }
              //       // },
              //       validate:
              //           EmailVisibilityProvider().emailvalid(
              //                     emailController.text,
              //                   ) ==
              //                   null ||
              //               EmailVisibilityProvider()
              //                   .emailvalid(emailController.text)
              //                   .toString()
              //                   .isEmpty
              //           ? value.passwordvalid
              //           : value.waitpasswordvalid,
              //       // key: ValueKey('password'),
              //       value: value,
              //       icons: value.isVisibility == false
              //           ? Icons.visibility
              //           : Icons.visibility_off,
              //       textController: passwordController,
              //       // textFocusNode: focusNode,
              //     );
              //   },
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ValueListenableBuilder(
                          valueListenable: isChecked,
                          builder: (context, value, child) {
                            return SizedBox(
                              height: 24.h,
                              width: 24.w,
                              child: Checkbox(
                                value: isChecked.value,
                                onChanged: (_) {
                                  isChecked.value = !isChecked.value;
                                },
                              ),
                            );
                          },
                        ),
                        Text(
                          'Remember me',
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(fontSize: 10.sp),
                        ),
                      ],
                    ),
                  ),
                  widget.buttontext == 'Login'
                      ? InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgetPassword(),
                              ),
                            );
                          },
                          child: Text(
                            'Forgot the password ?',
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  fontSize: 10.sp,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                        )
                      : SizedBox(width: 10.w),
                ],
              ),
              SizedBox(height: 16.h),
              InkWell(
                onTap: () {
                  if (widget.buttontext == 'Login') {
                    if (_formkey.currentState!.validate()) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavigationPage(),
                        ),
                        (Route<dynamic> route) => false,
                      );
                    }
                  } else {
                    // if (_formkey.currentState!.validate()) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(content: Text('account Created')),
                    //   );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CountoryPref()),
                    );
                    // }
                  }
                  // if (textEditingController.value.text == "ABCD") {
                  //   isvalid.value = true;
                  //   if (isvalid.value == true &&
                  //       textEditingController1.value.text == '1234') {
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       SnackBar(
                  //         content: Text(
                  //           'Email & Password is Correct !',
                  //           style: Theme.of(context).textTheme.bodySmall,
                  //         ),
                  //       ),
                  //     );
                  //   }
                  // } else if (textEditingController.value.text == "ABCD" &&
                  //     textEditingController1.value.text == '1234') {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(
                  //       content: Text(
                  //         'Email & Password is Correct !',
                  //         style: Theme.of(context).textTheme.bodySmall,
                  //       ),
                  //     ),
                  //   );
                  // } else if (textEditingController.value.text.isEmpty ||
                  //     textEditingController1.value.text.isEmpty) {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(
                  //       content: Text(
                  //         'Email & Password is Empty? Fill them !',
                  //         style: Theme.of(context).textTheme.bodySmall,
                  //       ),
                  //     ),
                  //   );
                  //   print('isEmpty');
                  // } else {
                  //   isvalid.value = false;
                  // }
                },
                child: CustomButton(text: widget.buttontext),
              ),
              SizedBox(height: 16.h),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'or continue with',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                height: 50.h,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 45.h,
                      width: 140.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),

                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/facebook_logo.svg',
                            width: 24.w,
                            height: 24.h,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            'Facebook',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),

                        color: Colors.white,
                      ),
                      height: 45.h,
                      width: 140.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/google_logo.svg',
                            width: 24.w,
                            height: 24.h,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            'Google',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.buttontext == 'Login'
                          ? 'don’t have an account ?'
                          : 'Already have an account ?',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(width: 10.w),
                    InkWell(
                      onTap: () {
                        if (widget.buttontext == 'Login') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Singup()),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        }
                      },
                      child: Text(
                        widget.buttontext == 'Login' ? 'Sign Up' : 'Login',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
