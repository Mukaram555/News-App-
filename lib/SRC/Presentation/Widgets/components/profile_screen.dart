import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/SRC/Presentation/Common/Button/custom_button.dart';
import 'package:news_app/SRC/Presentation/Common/Textfield/text_field.dart';
import 'package:news_app/SRC/Presentation/Widgets/components/bottom_navigation.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> titleNames = [
      'Username',
      'Full Name',
      'Emal Address',
      'Phone Number',
    ];
    final List<TextEditingController> _controllers = List.generate(
      4,
      (_) => TextEditingController(),
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back),
                    ),
                    Text(
                      'Fill Your Profile',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(width: 24),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  height: 150.h,
                  child: Center(
                    child: Stack(
                      alignment: AlignmentGeometry.directional(1, 0.9),
                      children: [
                        Container(
                          height: 130.h,
                          width: 130.w,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/chanl_logo_1.jpg',
                              ),
                              fit: BoxFit.cover,
                            ),
                            color: Colors.blueAccent,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Positioned(
                          child: IconButton(
                            onPressed: () {},
                            icon: Container(
                              height: 28.h,
                              width: 28.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Wrap(
                  children: List.generate(titleNames.length, (index) {
                    return Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFieldCustom(
                        lable: titleNames[index],
                        textController: _controllers[index],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20.0),
        child: InkWell(
          onTap: () {
            if (_controllers.isEmpty) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('the field is empty')));
            } else {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => BottomNavigationPage()),
                (Route<dynamic> route) => false,
              );
            }
          },
          child: CustomButton(text: 'Next'),
        ),
      ),
    );
  }
}
