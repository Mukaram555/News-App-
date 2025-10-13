import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabViewBuilder extends StatelessWidget {
  const TabViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final List colors = [
      Colors.red,
      Colors.green,
      Colors.brown,
      Colors.deepPurple,
      Colors.grey,
      Colors.cyan,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.grey,
    ];
    final List images = [
      Colors.cyan,
      Colors.grey,
      Colors.green,
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.brown,
      Colors.deepPurple,
      Colors.grey,
      Colors.yellow,
    ];
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      physics: NeverScrollableScrollPhysics(parent: ScrollPhysics()),
      itemCount: colors.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
          child: Container(
            height: 120.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: colors[index],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Container(
                    width: 90.w,
                    height: 90.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: images[index],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Container(
                    width: 210.w,
                    height: 90.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: images[index],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'data',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Container(
                            height: 43.h,
                            width: 210,
                            color: colors[index],
                            child: Text(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              'data',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'data',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                'data',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
