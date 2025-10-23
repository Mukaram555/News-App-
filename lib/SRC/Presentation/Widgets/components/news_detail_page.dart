


// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:firebase_database/firebase_database.dart';

import '../../../Data/Models/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Comment Screen Ui/comment_screen.dart';




class NewsDetailPage extends StatefulWidget {
  // final NewsModel newsModel;
  const NewsDetailPage({super.key,
    // required this.newsModel,
    this.inDex,required this.isFirebase,
    // this.data
  });

  final Result? inDex;
  // final DataSnapshot? data;
  final bool isFirebase;


  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  final DatabaseReference databaseRef = FirebaseDatabase.instance.ref('/bookmark');
   ValueNotifier<bool> isBookmark = ValueNotifier(false);

   ValueNotifier<bool> isFavorite = ValueNotifier(false);
   
   Future _BookMark() async{
  final databaseRef = FirebaseDatabase.instance.ref('/bookmarks');
  if(databaseRef.key!.isNotEmpty) {
  final query = databaseRef
      .orderByChild('title')
      .equalTo( widget.inDex?.title);

  final snapshot = await query.get();

  if (!snapshot.exists) {
  isBookmark.value = false;
  }
  else{
  isBookmark.value = true;
  }
  }
}
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _BookMark();


  }




  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse(widget.inDex?.url ??"");
    Future<void> LaunchUrl() async {
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 400.h,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(1, 1),
                    blurRadius: 1,
                    color: Theme.of(context).colorScheme.onSurface

                  )
                ],
                image: DecorationImage(image: NetworkImage(widget.inDex?.multimedia?[0].url ?? ''),fit: BoxFit.cover)
              ),

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 100.0.h,
                    width: 160.0.w,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(1, 1),
                              blurRadius: 1,
                              color: Theme.of(context).colorScheme.onSurface

                          )
                        ],

                        borderRadius: BorderRadius.all(Radius.circular(20.0.r)),
                        image: DecorationImage(image: NetworkImage(widget.inDex?.multimedia?[1].url ?? ''),fit: BoxFit.cover)
                    ),
                  ),
                  Container(
                    height: 100.0.h,
                    width: 160.0.w,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(1, 1),
                              blurRadius: 1,
                              color: Theme.of(context).colorScheme.onSurface

                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(20.0.r)),
                        image: DecorationImage(image: NetworkImage(widget.inDex?.multimedia?[2].url ?? ''),fit: BoxFit.cover)
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    width: 500.0.w,
                    child: Text(widget.inDex?.title ?? '',
                    style: Theme.of(context).textTheme.displaySmall,
                    ),

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Text( 'Time : ',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      SizedBox(
                        child: Text("${widget.inDex?.updatedDate?.hour} hours Ago " ,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Text(widget.inDex?.resultAbstract ??"",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Text(widget.inDex?.multimedia?[0].caption ??"",
                  style: Theme.of(context).textTheme.bodyMedium),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 8),
              child: Text("Copyright",
                  style: Theme.of(context).textTheme.displaySmall),
            ),
            SizedBox(height: 10.0.h,),
            Container(
              padding: EdgeInsets.only(left: 8),

              child: Text(widget.inDex?.multimedia?[0].copyright ??"",
                  style: Theme.of(context).textTheme.bodyMedium),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(

                    child: Text("More Details :",
                        style: Theme.of(context).textTheme.displaySmall),
                  ),
                  SizedBox(height: 10.0.h,),
                  SizedBox(
                      child:  InkWell(
                        onTap: (){
                          LaunchUrl();
                        },
                        child: Text('$url',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.primary)),
                    ),
                  ),
                  SizedBox(height: 20.0.h,),



            ],
          ),),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 50.0.h,
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ValueListenableBuilder(
                  valueListenable: isFavorite,
                  builder: (context, value, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                            onTap:(){
                              isFavorite.value = ! isFavorite.value;
                            },
                            child: Icon( isFavorite.value? Icons.favorite: Icons.favorite_border_rounded, color: isFavorite.value? Theme.of(context).colorScheme.error :Theme.of(context).colorScheme.onSurface,)),
                        SizedBox(width: 2.0.w,),
                        Text('25.2k'),
                      ],
                    );
                  }
              ),

              GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> CommentScreen(
                      articleId:  'unknown',
                      articleTitle: 'News Article',
                    )));
                  },
                  child: Icon(Icons.comment_outlined)),
              SizedBox(width: 40.0.w,),

              ValueListenableBuilder(
                  valueListenable: isBookmark,
                  builder: (context, value, child) {
                    return GestureDetector(
                        onTap: () async{
                          // if(widget.isFirebase == true){
                          //   showDialog(context: context, builder:(_){
                          //     return AlertDialog(
                          //       icon: Icon(Icons.delete_forever , size:50.0),
                          //       iconColor: Theme.of(context).colorScheme.error,
                          //       title: Text('Do you want to delete or remove from Bookmark !! ❌'),
                          //       titleTextStyle: Theme.of(context).textTheme.bodyMedium,
                          //       content: Row(
                          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //
                          //         children: [
                          //           GestureDetector(
                          //             onTap:() {
                          //               Navigator.pop(context);
                          //               isBookmark.value = true;
                          //
                          //             },
                          //             child: Container(
                          //               height: 30.0.h,
                          //               width: 60.0.w,
                          //               decoration: BoxDecoration(
                          //                 borderRadius: BorderRadius.circular(5.0.r),
                          //                 border: BoxBorder.all(color: Theme.of(context).colorScheme.primary,),
                          //               ),
                          //               child: Center(child: Text('Cancel', style:Theme.of(context).textTheme.bodySmall,),),
                          //             ),
                          //           ),
                          //           GestureDetector(
                          //             onTap:() async {
                          //               try {
                          //                 if (widget.data!.exists) {
                          //                   final databaseRef = FirebaseDatabase.instance.ref('bookmarks');
                          //
                          //                   await databaseRef.child(widget.data!.key.toString()).remove();
                          //
                          //                   // FirebaseDatabase.instance.ref('/bookmark').child(widget.data!.child('title').value.toString()).remove();
                          //                   isBookmark.value = false;
                          //                   Navigator.pop(context);
                          //                 }else{
                          //                   isBookmark.value = true;
                          //                   showDialog(context: context, builder:(_){
                          //                     return AlertDialog(
                          //                       icon: Icon(Icons.report_problem_outlined , size:50.0),
                          //                       iconColor: Theme.of(context).colorScheme.error,
                          //                       title:Text('delete or remove from Bookmark is cancel ! ❌'),
                          //
                          //                       titleTextStyle: Theme.of(context).textTheme.bodyMedium,);});
                          //                 }
                          //               } catch (e) {
                          //                 // TODO
                          //                 // print('==========error =${e.toString()}');
                          //               }
                          //               Navigator.pop(context);
                          //
                          //
                          //             },
                          //             child: Container(
                          //               height: 30.0.h,
                          //               width: 60.0.w,
                          //               decoration: BoxDecoration(
                          //                 borderRadius: BorderRadius.circular(5.0.r),
                          //                 border: BoxBorder.all(color: Theme.of(context).colorScheme.primary,),
                          //               ),
                          //               child: Center(child: Text('delete', style:Theme.of(context).textTheme.bodySmall,),),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //
                          //     );
                          //   });
                          // }
                          // else {
                          final databaseRef = FirebaseDatabase.instance.ref('bookmarks');
                          if(databaseRef.key!.isNotEmpty) {
                            final query = databaseRef
                                .orderByChild('title')
                                .equalTo(widget.inDex?.title);

                            final snapshot = await query.get();

                            if (!snapshot.exists) {


                              // int id = DateTime.now().microsecondsSinceEpoch;
                              await databaseRef.push().set(widget.inDex!.toJson()
                                // "image": widget.inDex?.multimedia?.first
                                //     .url ?? '',
                                // "title": widget.inDex?.title ?? '',
                                // "caption": widget.inDex?.multimedia?.first
                                //     .caption ?? '',
                                // "abstract": widget.inDex?.resultAbstract ??
                                //     "",
                                // "time": "${widget.inDex?.updatedDate
                                //     ?.hour} hours Ago",
                                // "link": '$url',
                                // "copyright": widget.inDex?.multimedia?[1]
                                //     .copyright ?? "",
                                // "section":widget.inDex?.section ?? "",
                                // "publish_date": " ${widget.inDex?.publishedDate ?? ""}",
                                // // 'id': id,


                              ).then((abc){
                                isBookmark.value = true;

                              });

                              showDialog(context: context, builder:(_){
                                return AlertDialog(
                                  icon: Icon(Icons.done , size:50.0),
                                  iconColor: Colors.green,
                                  title: Text('successfully add Bookmark ✅'),
                                  titleTextStyle: Theme.of(context).textTheme.bodyMedium,
                                );});
                              // print(" Bookmark added successfully!");


                            }
                            else {

                              showDialog(context: context, builder:(_){
                                return AlertDialog(
                                  icon: Icon(Icons.delete_forever , size:50.0),
                                  iconColor: Theme.of(context).colorScheme.error,
                                  title: Text('Do you want to delete or remove from Bookmark !! ❌'),
                                  titleTextStyle: Theme.of(context).textTheme.bodyMedium,
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                    children: [
                                      GestureDetector(
                                        onTap:() {
                                          Navigator.pop(context);
                                          isBookmark.value = true;

                                        },
                                        child: Container(
                                          height: 30.0.h,
                                          width: 60.0.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5.0.r),
                                            border: BoxBorder.all(color: Theme.of(context).colorScheme.primary,),
                                          ),
                                          child: Center(child: Text('Cancel', style:Theme.of(context).textTheme.bodySmall,),),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap:() async{
                                          if (snapshot.exists) {
                                            for (final child in snapshot.children) {
                                              await databaseRef.child(child.key!).remove(); // ✅ only removes the matching record
                                            }
                                            isBookmark.value = false;
                                            Navigator.pop(context);
                                          }
                                          else
                                          {
                                            isBookmark.value = true;
                                            showDialog(context: context, builder:(_){
                                              return AlertDialog(
                                                icon: Icon(Icons.report_problem_outlined , size:50.0),
                                                iconColor: Theme.of(context).colorScheme.error,
                                                title:Text('delete or remove from Bookmark is cancel ! ❌'),

                                                titleTextStyle: Theme.of(context).textTheme.bodyMedium,);});
                                          }
                                          Navigator.pop(context);


                                        },
                                        child: Container(
                                          height: 30.0.h,
                                          width: 60.0.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5.0.r),
                                            border: BoxBorder.all(color: Theme.of(context).colorScheme.primary,),
                                          ),
                                          child: Center(child: Text('delete', style:Theme.of(context).textTheme.bodySmall,),),
                                        ),
                                      ),
                                    ],
                                  ),

                                );
                              });
                              // print("⚠️ Bookmark already exists!");

                            }


                          }
                          else{


                            showDialog(context: context, builder:(_){
                              return AlertDialog(
                                icon: Icon(Icons.report_problem_outlined , size:50.0),
                                iconColor: Theme.of(context).colorScheme.error,
                                title:Text('adding Bookmark is cancel ! ❌'),


                                titleTextStyle: Theme.of(context).textTheme.bodyMedium,);});
                          }
                          // }
                        },
                        child: Icon( isBookmark.value? Icons.bookmark: Icons.bookmark_border, color :isBookmark.value? Theme.of(context).colorScheme.primary:Theme.of(context).colorScheme.onPrimary));
                  }
              ),

            ],
          ),
        ),
      ),
    );
  }
}
