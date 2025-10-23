import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_app/SRC/Presentation/Common/Button/custom_button.dart';
import 'package:news_app/SRC/Presentation/Common/Textfield/text_field.dart';
import 'package:news_app/SRC/Presentation/Widgets/components/bottom_navigation.dart';

class ProfileScreen extends StatefulWidget {
  final String title;
  const ProfileScreen({super.key, required this.title});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ValueNotifier<XFile?> pickerImage = ValueNotifier(null);
  final List<String> titleNames = [
    'Username',
    'Full Name',
    'Emal Address',
    'Phone Number',
  ];
  final TextEditingController boiController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final List<TextEditingController> controllers = List.generate(
    4,
        (_) => TextEditingController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back),
                    ),
                    Text(
                      widget.title,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    widget.title == 'Edit Profile'?  IconButton(onPressed: ()
                    {
                      showDialog(context: (context), builder: (_){
                        return AlertDialog(
                          icon: Icon(Icons.check_box),
                          iconColor: Colors.green,
                          title: Text('SuccessFully Save'),
                        );
                      });
                    }, icon: Icon(Icons.check)):SizedBox(width: 24),
                  ],
                ),
                SizedBox(height: 20),
                ValueListenableBuilder(
                  valueListenable: pickerImage,
                  builder: (context, value, child) {
                    return SizedBox(
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
                                  image:value == null ? AssetImage(
                                    'assets/images/profile_pic.png',
                                  ): FileImage(File(value.path)) as ImageProvider ,
                                  fit: BoxFit.cover,
                                ),
                                color: Colors.blueAccent,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Positioned(
                              child: IconButton(
                                onPressed: () async {
                                  ImagePicker image = ImagePicker();
                                  XFile? value = await image.pickImage(source: ImageSource.gallery);
                                  pickerImage.value = value;
                                  if (kDebugMode) {
                                    print(pickerImage.value);
                                  }
                                  if (kDebugMode) {
                                    print(value);
                                  }
                                },
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
                    );
                  }
                ),
                Wrap(
                  children: List.generate(titleNames.length, (index) {
                    return Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFieldCustom(
                        lable: titleNames[index],
                        textController: controllers[index],
                      ),
                    );
                  }),

                ),
                widget.title == 'Edit Profile'?
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFieldCustom(
                        lable: 'Bio',
                        textController: boiController,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFieldCustom(
                        lable: 'Website',
                        textController: websiteController,
                      ),
                    ),
                  ],
                ): SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: widget.title == 'Fill Your Profile'? Padding(
        padding: EdgeInsets.all(20.0),
        child: InkWell(
          onTap: () {
            if (controllers.isEmpty) {
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
      ): SizedBox.shrink(),

    );
  }
}
