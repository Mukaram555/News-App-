import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/SRC/Presentation/Common/Button/custom_button.dart';
import 'package:news_app/SRC/Presentation/Common/Textfield/text_field.dart';
import 'package:news_app/SRC/Presentation/Widgets/components/otp_screen.dart';

class ForgetPassAddress extends StatelessWidget {
  const ForgetPassAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailOrPhone = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 40.0.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios),
              ),
              SizedBox(height: 20.0.h),
              Text(
                'Forget\nPassword ?',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(height: 10.0.h),
              Container(
                width: 300.0.w,
                child: Text(
                  '''Don’t worry! it happens. Please enter the address associated with your account.''',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              SizedBox(height: 30.0.h),
              TextFieldCustom(
                lable: 'Email ID / Mobile Number',
                textController: emailOrPhone,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20.0),
        child: InkWell(
          onTap: () {
            print('=====================');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OtpScreen()),
            );
          },
          child: CustomButton(text: 'Submit'),
        ),
      ),
    );
  }
}
