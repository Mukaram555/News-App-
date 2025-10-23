import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/SRC/Data/Resources/ThemesData/light_theme_data.dart';
import 'package:news_app/SRC/Presentation/Widgets/Auth/Login/UI%20Screens/login_screen.dart';

class DescriptionScreen extends StatefulWidget {
  const DescriptionScreen({super.key});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  // List<Map<String, String>> images = [
  //   {'Image1': 'assets/images/first_screen_pic.jpg'},
  //   {'Image2': 'assets/images/2rd_description_pic.jpg'},
  //   {'Image3': 'assets/images/3rd_description_pic.jpg'},
  // ];
  int index = 0;

  // Future<void> _future() async {
  //   if(index == -1){
  //     Navigator.pop(context);
  //   }
  //   else if(index == 2)
  //   {
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
  //   }
  //   else{
  //     Tooltip(
  //       message: 'change',
  //     );
  //   }
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 450.h,
              child: Image.asset(
                index == 0
                    ? 'assets/images/first_screen_pic.jpg'
                    : index == 1
                    ? 'assets/images/2rd_description_pic.jpg'
                    : 'assets/images/3rd_description_pic.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 72.h,
                    width: 270.w,
                    child: Text(
                      maxLines: 2,
                      'Lorem Ipsum is simply dummy',
                      style: Theme.of(
                        context,
                      ).textTheme.displaySmall!.copyWith(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 45.h,
                    width: 270.w,
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 16.h,
                    width: 50.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PositionContainer(isColor: index == 0 ? true : false),
                        PositionContainer(isColor: index == 1 ? true : false),
                        PositionContainer(isColor: index == 2 ? true : false),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                    width: 130.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        index == 1 || index == 2
                            ? InkWell(
                                onTap: () {
                                  if (index == 1 || index == 2) {
                                    index--;
                                    // print(index);
                                  }
                                  setState(() {});
                                },
                                child: Text(
                                  'Back',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              )
                            : SizedBox(),
                        InkWell(
                          onTap: () {
                            index++;
                            if (index == 3) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            }
                            setState(() {});
                          },
                          child: Container(
                            height: 40.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: lightTheme.colorScheme.primary,
                            ),
                            child: Center(
                              child: Text(
                                'Next',
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PositionContainer extends StatelessWidget {
  const PositionContainer({super.key, required this.isColor});

  final bool isColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 14.h,
      width: 14.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isColor == true ? lightTheme.colorScheme.primary : Colors.grey,
      ),
    );
  }
}
