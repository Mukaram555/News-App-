import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallCustomButton extends StatelessWidget {
  final String buttonTitle;
  const SmallCustomButton({super.key, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(top: 15.0.h),

        child: Container(
          height: 50.0.h,
          width: 150.0.w,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(10.0.r),
            border: BoxBorder.all(color: Theme.of(context).colorScheme.primary),
          ),
          child: Center(child: Text(buttonTitle, style: Theme.of(context).textTheme.labelSmall,)),
        ),
      );
  }
}
