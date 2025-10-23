import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/SRC/Presentation/Common/Button/custom_button.dart';
import 'package:news_app/SRC/Presentation/Widgets/Auth/Login/Forget%20Password/password_reset_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  final otpKey = GlobalKey<FormState>();
  ValueNotifier<int> counter = ValueNotifier(60);
  bool isValid = false;
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    count();
  }

  void count() {
    if (counter.value == 60) {
      Timer.periodic(const Duration(seconds: 1), (timer) {
        if (counter.value == 0) {
          timer.cancel();
        } else {
          counter.value--;
        }
      });
    }
  }

  @override
  void dispose() {
    for (final node in _focusNodes) {
      node.dispose();
    }
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onOtpChanged(String value, int index) {
    if (value.length == 1 && index < _focusNodes.length - 1) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  String? _validater(String? value) {
    if (_controllers[0].text != '4' || _controllers[0].text.isEmpty) {
      setState(() {
        isValid = true;
      });
      return "";
    } else if (_controllers[1].text != '8' || _controllers[1].text.isEmpty) {
      setState(() {
        isValid = true;
      });
      return "";
    } else if (_controllers[2].text != '7' || _controllers[2].text.isEmpty) {
      setState(() {
        isValid = true;
      });
      return " ";
    } else if (_controllers[3].text != '2' || _controllers[3].text.isEmpty) {
      setState(() {
        isValid = true;
      });
      return '';
    }
    setState(() {
      isValid = false;
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Form(
            key: otpKey,
            autovalidateMode: AutovalidateMode.onUnfocus,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                ),
                SizedBox(height: 20.0.h),
                Text(
                  'OTP Verification',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SizedBox(height: 20.0.h),
                Text(
                  'Enter the OTP sent to +67-1234-5678-9',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(height: 30.0.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        4,
                        (index) => OtpInputContainer(
                          controller: _controllers[index],
                          onValidate: _validater,
                          focusNode: _focusNodes[index],
                          onChanged: (val) => _onOtpChanged(val, index),
                        ),
                      ),
                    ),
                    isValid == true
                        ? Padding(
                            padding: EdgeInsets.only(left: 14.0.w),
                            child: Text(
                              '! Invalid OTP or Empty',
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                          )
                        : SizedBox.shrink(),
                    SizedBox(height: 20.0.h),
                    ValueListenableBuilder(
                      valueListenable: counter,
                      builder: (context, value, child) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Send code in ',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            counter.value == 0
                                ? InkWell(
                                    onTap: () {
                                      counter.value = 60;
                                      count();
                                    },
                                    child: Text(
                                      'Resend',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.error,
                                          ),
                                    ),
                                  )
                                : Text(
                                    '${counter.value}s',
                                    style: Theme.of(context).textTheme.bodySmall
                                        ?.copyWith(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.error,
                                        ),
                                  ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.all(20.0),
        child: InkWell(
          onTap: () {
            if (otpKey.currentState!.validate()) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('OTP IS valide')));

              setState(() {
                isValid = false;
              });
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => PasswordResetScreen()),
                (Route<dynamic> route) => false,
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('OTP IS  not valide')),
              );
              setState(() {
                isValid = true;
              });
            }
          },
          child: CustomButton(text: 'Verify'),
        ),
      ),
    );
  }
}

class OtpInputContainer extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final String? Function(String?)? onValidate;

  const OtpInputContainer({
    super.key,
    required this.focusNode,
    required this.controller,
    required this.onChanged,
    required this.onValidate,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64.0.w,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleSmall,
        maxLength: 1,
        onChanged: onChanged,
        validator: onValidate,
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          focusColor: Theme.of(context).colorScheme.outline,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
        ),
      ),
    );
  }
}
