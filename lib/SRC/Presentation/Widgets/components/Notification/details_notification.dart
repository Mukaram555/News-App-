import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsNotification extends StatefulWidget {
  const DetailsNotification({super.key});

  @override
  State<DetailsNotification> createState() => _DetailsNotificationState();
}

class _DetailsNotificationState extends State<DetailsNotification> {
  ValueNotifier<bool> isCancel = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                        child: Icon(Icons.arrow_back)),
                    SizedBox()
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ValueListenableBuilder(
                  valueListenable: isCancel,
                  builder: (context, value, child) {
                    return value ? SizedBox() : Stack(
                      children: [


                        Container(
                          height: 100.0.h,
                          decoration: BoxDecoration(
                            color:Colors.black12,
                            borderRadius: BorderRadius.circular(20.0),

                          ),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 60.0.h,
                                width: 60.0.w,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle,

                                ),
                                child: Center(child: Icon(Icons.notification_add_outlined,size: 40,)),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              // ignore: sized_box_for_whitespace
                              Container(
                                width: 230.0.h,
                                child: Text('You have a new notification!'),
                              )
                            ],
                          ),
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                  onTap: (){
                                    // print("===========================");
                                    isCancel.value = true;
                                  },
                                  child: Icon(Icons.cancel_outlined)),
                            )),
                      ],
                    );
                  }
                ),
              ),
              Container(
                height: 80.0.h,
                width: 80.0.w,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  shape: BoxShape.circle,

                ),
                child: Center(child: Icon(CupertinoIcons.envelope_open_fill,size: 40,color: Colors.orange,)),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  width: 500.0.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0.r),
                    color: Colors.black12,
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(5.0),
                    child: Text("""Here are a few clean notification text options you can show in your app’s notification section when a rate limit error occurs:

🔔 Request limit reached. Please wait a moment and try again.

⚠️ Too many requests — please slow down.

📡 Server temporarily busy. Try again in a few seconds.

⏳ You’ve reached the request limit. Please refresh later.

🚧 Rate limit exceeded. Please try again shortly."""),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  width: 500.0.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0.r),
                    color: Colors.black12,
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(5.0),
                    child: Text("""Here are a few clean notification text options you can show in your app’s notification section when a rate limit error occurs:

🔔 Request limit reached. Please wait a moment and try again.

⚠️ Too many requests — please slow down.

📡 Server temporarily busy. Try again in a few seconds.

⏳ You’ve reached the request limit. Please refresh later.

🚧 Rate limit exceeded. Please try again shortly."""),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
