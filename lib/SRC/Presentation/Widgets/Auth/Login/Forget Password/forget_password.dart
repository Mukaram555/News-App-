import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/SRC/Presentation/Common/Forget%20pass%20card/forget_card.dart';
import 'package:news_app/SRC/Presentation/Widgets/Auth/Login/Forget%20Password/forget_pass_address.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> radioSelect = ValueNotifier(1);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 40.0.h),
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
            SizedBox(
              width: 300.0.w,
              child: Text(
                '''Don’t worry! it happens. Please select the email or number associated with your account.''',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            SizedBox(height: 30.0.h),
            ValueListenableBuilder(
              valueListenable: radioSelect,
              builder: (context, value, child) {
                return InkWell(
                  onTap: () {
                    radioSelect.value = 1;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgetPassAddress(),
                      ),
                    );
                  },
                  child: ForgetCard(
                    select: radioSelect.value,
                    isMail: true,
                    change: (val) {
                      val = radioSelect.value;
                      radioSelect.value = 1;
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 30.0.h),
            ValueListenableBuilder(
              valueListenable: radioSelect,
              builder: (context, value, child) {
                return InkWell(
                  onTap: () {
                    radioSelect.value = 2;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgetPassAddress(),
                      ),
                    );
                  },
                  child: ForgetCard(
                    select: radioSelect.value,
                    isMail: false,
                    change: (val) {
                      radioSelect.value = 2;
                      val = radioSelect.value;
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
