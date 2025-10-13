import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetCard extends StatefulWidget {
  const ForgetCard({
    super.key,
    required this.select,
    required this.isMail,
    required this.change,
  });

  @override
  State<ForgetCard> createState() => _ForgetCardState();
  final int select;
  final bool isMail;
  final ValueChanged<Object?>? change;
}

class _ForgetCardState extends State<ForgetCard> {
  @override
  Widget build(BuildContext context) {
    var faker = new Faker();
    int? _selectedOption = widget.select;
    ValueChanged<Object?>? _change = widget.change;

    return Container(
      height: 100.0.h,
      width: 400.0.w,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(5.0.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 50.0.w,
            height: 50.0.h,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(5.0.r),
            ),
            child: Center(
              child: Icon(Icons.email_outlined, color: Colors.white),
            ),
          ),
          Container(
            height: 60.0.h,
            width: 200.0.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.isMail == true ? 'via Email:' : 'via SMS:',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
                SizedBox(height: 10.0.h),
                Text(
                  widget.isMail == true
                      ? faker.internet.email()
                      : faker.internet.userName(),
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
          widget.isMail == true
              ? Radio(
                  value: _selectedOption == 1 ? widget.select : false,
                  groupValue: widget.select,
                  onChanged: _change,
                )
              : Radio(
                  value: _selectedOption == 2 ? widget.select : false,
                  groupValue: widget.select,
                  onChanged: _change,
                ),
        ],
      ),
    );
  }
}
