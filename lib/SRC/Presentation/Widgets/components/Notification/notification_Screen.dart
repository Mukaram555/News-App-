// ignore: file_names
// Notification
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/SRC/Presentation/Widgets/components/Notification/details_notification.dart';

class NotificationPage extends StatelessWidget  {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    List url = [
      'https://assets.bucketlistly.blog/sites/5adf778b6eabcc00190b75b1/content_entry5adf77af6eabcc00190b75b6/6075185986d092000b192d0a/files/best-free-travel-images-main-image-hd-op.webp'
      ,'https://media.istockphoto.com/id/814423752/photo/eye-of-model-with-colorful-art-make-up-close-up.jpg?s=612x612&w=0&k=20&c=l15OdMWjgCKycMMShP8UK94ELVlEGvt7GmB_esHWPYE=',
        'https://images.pexels.com/photos/1054655/pexels-photo-1054655.jpeg?cs=srgb&dl=pexels-hsapir-1054655.jpg&fm=jpg',
   'https://thumbs.dreamstime.com/b/beautiful-rain-forest-ang-ka-nature-trail-doi-inthanon-national-park-thailand-36703721.jpg', ];
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back)),
                      Text('Notification',style: Theme.of(context).textTheme.labelSmall,),
                      GestureDetector(
                        onTap: (){
                          showDialog(context: context, builder:(_) {
                            return AlertDialog(
                              icon: Icon(Icons.workspaces),
                              iconColor: Colors.green,
                              title: Text('Notification Settings in Progrss'),
                              titleTextStyle: Theme.of(context).textTheme.bodySmall,
                            );
                          });
                        },
                          child: Icon(Icons.menu,))
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Today ${DateTime.timestamp().day}/${DateTime.now().month}/${DateTime.now().year}'),
              )),
              SliverList.builder(
                            itemCount: url.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.all(10.0),
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsNotification()));
                                  },
                                  child: Container(
                                    height: 120,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).colorScheme.surface,
                                        borderRadius: BorderRadius.circular(10.0.r),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(1, 1),
                                          spreadRadius: 2,
                                          blurRadius: 2,
                                          color: Colors.black12
                                        )
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceEvenly,
                                      children: [
                                        Container(
                                          height: 90.0,
                                          width: 90.0,
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: NetworkImage(url[index]),
                                                  fit: BoxFit.cover)
                                          ),


                                        ),
                                        SizedBox(width: 10,),
                                        Padding(
                                          padding: EdgeInsets.all(2.0),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: SizedBox(
                                                    width: 200.w,
                                                    child: Text('The New York Times', style: Theme.of(context).textTheme.bodySmall,)),
                                              ),
                                              Padding(

                                                  padding: EdgeInsets.all(2.0),
                                                child:SizedBox(
                                                    width: 200.0.w,
                                                    height: 45.0.h,
                                                    child: Text(
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                      'Request limit reached. Please wait a moment and try again.', style: Theme.of(context).textTheme.bodySmall,)),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(2.0),
                                                child: SizedBox(
                                                    width: 200.w
                                                    ,
                                                    child: Text('2025 , 9 :00 AM', style: Theme.of(context).textTheme.bodySmall,)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 5.0),
                                          child: Container(

                                            height: 18.0.h,
                                            width: 18.0.w,
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                shape: BoxShape.circle
                                            ),
                                            child: Center(child: Icon(Icons.notifications_active, size: 15,)),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                        ),





            ];
          },body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('yesterday ${DateTime.timestamp().day}/${DateTime.now().month}/${DateTime.now().year}'),
            )),


              SliverList.builder(
                  itemCount: url.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsNotification()));
                        },
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(10.0.r),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(1, 1),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  color: Colors.black12
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height:90.0,
                                width: 90.0,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(image: NetworkImage(url[index]), fit: BoxFit.cover)
                                ),


                              ),
                              SizedBox(width: 10,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: SizedBox(
                                          width: 200.w,
                                          child: Text('The New York Times', style: Theme.of(context).textTheme.bodySmall,)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: SizedBox(
                                          width: 200.0.w,
                                          height: 45.0.h,
                                          child: Text(
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            'Too many requests — please slow down.', style: Theme.of(context).textTheme.bodySmall,)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: SizedBox(
                                          width: 200.w,
                                          child: Text('2025 , 9 :00 AM', style: Theme.of(context).textTheme.bodySmall,)),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 5.0),
                                child: Container(

                                  height: 18.0.h,
                                  width: 18.0.w,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle
                                  ),
                                  child: Center(child: Icon(Icons.notifications_active, size: 15,)),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    );
                  }

            ),
          ],
        ),),
      ),
    );
  }
}
