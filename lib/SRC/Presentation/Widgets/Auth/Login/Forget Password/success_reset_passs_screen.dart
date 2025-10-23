import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/SRC/Presentation/Common/Button/custom_button.dart';

import '../UI Screens/login_screen.dart';

class SuccessResetPasssScreen extends StatelessWidget {
  const SuccessResetPasssScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 170.h,
              width: 315.w,
              child: Center(
                child: Image.asset('assets/images/news_logo_image.png'),
              ),
            ),
            SizedBox(height: 10.0.h),
            Text(
              'Congratulations!',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(height: 10.0.h),
            Text(
              'Your account is ready to use',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20.0),
        child: InkWell(
          onTap: () {
            if (kDebugMode) {
              print('=====================');
            }
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
              (Route<dynamic> route) => false,
            );
          },
          child: CustomButton(text: 'Go to HomePage'),
        ),
      ),
    );
  }
}
