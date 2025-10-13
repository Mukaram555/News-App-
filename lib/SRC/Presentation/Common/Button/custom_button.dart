import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Center(
        child: Text(text, style: Theme.of(context).textTheme.labelSmall),
      ),
    );
  }
}
