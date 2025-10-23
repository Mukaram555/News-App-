import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/SRC/Presentation/Common/Button/custom_button.dart';
import 'package:news_app/SRC/Presentation/Common/Textfield/text_field_pass.dart';
import 'package:news_app/SRC/Presentation/Widgets/components/success_reset_passs_screen.dart';

class PasswordResetScreen extends StatelessWidget {
  const PasswordResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController password = TextEditingController();
    final TextEditingController confermPassword = TextEditingController();
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
              'Reset\nPassword',
              style: Theme.of(context).textTheme.displayLarge,
            ),

            SizedBox(height: 30.0.h),
            TextFieldPassCustom(
              lable: 'New Password',
              textController: password,
            ),
            // Consumer<PasswordVisibilityProvider>(
            //   builder: (context, value, child) {
            //     return TextFieldCustom(
            //       lable: 'Password',
            //       isTrue: true,
            //       value: value,
            //       icons: value.isVisibility == false
            //           ? Icons.visibility
            //           : Icons.visibility_off,
            //       textController: password,
            //       // textFocusNode: focusNode,
            //     );
            //   },
            // ),
            SizedBox(height: 20.0.h),
            TextFieldPassCustom(
              lable: 'Conforam New Password',
              textController: confermPassword,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.all(20.0),
        child: InkWell(
          onTap: () {
            if (password.value.text == confermPassword.value.text &&
                password.value.text.isNotEmpty &&
                confermPassword.value.text.isNotEmpty) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => SuccessResetPasssScreen(),
                ),
                (Route<dynamic> route) => false,
              );
            } else if (password.value.text != confermPassword.value.text) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Password not Match we can not be Procesed'),
                ),
              );
            } else if (password.value.text.isEmpty ||
                confermPassword.value.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('The Password Is Empty')),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('The passwords not Matched')),
              );
            }
          },
          child: CustomButton(text: 'submilt'),
        ),
      ),
    );
  }
}
