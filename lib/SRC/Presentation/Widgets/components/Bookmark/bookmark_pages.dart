import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/SRC/Data/Models/news_model.dart';

import '../home PageUi/news_detail_page.dart';

class BookmarkPages extends StatefulWidget {
  const BookmarkPages({super.key});

  @override
  State<BookmarkPages> createState() => _BookmarkPagesState();
}

class _BookmarkPagesState extends State<BookmarkPages> {
  final databaseRef = FirebaseDatabase.instance.ref('bookmarks/');
  ValueNotifier<bool> isData = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _setupRealtimeListener();
  }

  void _setupRealtimeListener() {
    // Listen for real-time changes
    databaseRef.onValue.listen((DatabaseEvent event) {
      if (mounted) {
        isData.value = event.snapshot.exists && event.snapshot.value != null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isData,
      builder: (context, val, child) {
        if (kDebugMode) {
          print('====== ==== == =  ===== $val');
        }

        if (!val) {
          return _buildEmptyState();
        } else {
          return _buildBookmarkList();
        }
      },
    );
  }

  Widget _buildEmptyState() {
    return SizedBox(
      child: Center(
        child: SizedBox(
          width: 300.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.bookmark_add_outlined,
                size: 50,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              SizedBox(
                width: 250.w,
                height: 100.h,
                child: Center(
                  child: Text(
                    'No Bookmark Added !. Please Add the Bookmark',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBookmarkList() {
    return FirebaseAnimatedList(
      query: databaseRef,
      defaultChild: Center(child: CircularProgressIndicator()),
      itemBuilder:
          (
            BuildContext context,
            DataSnapshot snapshot,
            Animation<double> animation,
            int index,
          ) {
            // Your existing item builder code...
            if (!snapshot.exists) {
              return _buildEmptyState();
            } else {
              final result =
                  jsonDecode(jsonEncode(snapshot.value))
                      as Map<String, dynamic>;
              final data = Result.fromJson(result);

              return _buildBookmarkItem(data, snapshot.key!);
            }
          },
    );
  }

  Widget _buildBookmarkItem(Result data, String key) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  NewsDetailPage(inDex: data, isFirebase: true),
            ),
          );
        },
        child: Container(
          height: 120.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: Theme.of(context).colorScheme.surface,
            boxShadow: [
              BoxShadow(
                offset: Offset(-1, 0.9),
                color: Theme.of(
                  context,
                ).colorScheme.surface.withAlpha((255 * 0.2).toInt()),
                blurRadius: 1,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Container(
                  width: 90.w,
                  height: 90.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                      image: NetworkImage(
                        // snapshot.child('image').value.toString()
                        data.multimedia!.first.url.toString(),
                      ),
                      fit: BoxFit.cover,
                    ),
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
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'THE NEW YORK TIMES',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.error,
                              ),
                        ),
                        SizedBox(
                          height: 43.h,
                          width: 210,

                          child: Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            data.title.toString(),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 100.0.w,
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                data.publishedDate.toString(),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              data.section.toString(),
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
          // child: Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     // Your existing item UI code...
          //     Padding(
          //       padding: EdgeInsets.only(left: 10.0),
          //       child: Container(
          //         width: 90.w,
          //         height: 90.h,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(10.r),
          //           image: DecorationImage(
          //             image: NetworkImage(data.multimedia!.first.url.toString()),
          //             fit: BoxFit.cover,
          //           ),
          //         ),
          //       ),
          //     ),
          //     // ... rest of your item UI
          //   ],
          // ),
        ),
      ),
    );
  }
}

// class _BookmarkPagesState extends State<BookmarkPages> {
//   final databaseRef = FirebaseDatabase.instance.ref('bookmarks/');
//
//   ValueNotifier<bool> isData = ValueNotifier(false);
//   // _onDataExiste();
//
//  @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _onDataExiste();
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(valueListenable: isData, builder: (context, val, child){
//       print('====== ==== == =  ===== ${val}');
//
//       if (!val) {
//         return SizedBox(
//           child: Center(child: SizedBox(
//             width: 300.w,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Icon(Icons.bookmark_add_outlined, size: 50, color: Theme
//                     .of(context)
//                     .colorScheme
//                     .onSurface,),
//                 SizedBox(
//
//                     width: 250.w,
//                     height: 100.h,
//                     child: Center(child: Text(
//                       'No Bookmark Added !. Place Add the Bookmark', style: Theme
//                         .of(context)
//                         .textTheme
//                         .labelSmall
//                         ?.copyWith(color: Theme
//                         .of(context)
//                         .colorScheme
//                         .onSurface), textAlign: TextAlign.center,)))
//
//               ],
//             ),
//           ),),
//         );
//       }
//       else {
//         return FirebaseAnimatedList(
//           query: databaseRef,
//           defaultChild: Center(child: CircularProgressIndicator()),
//           itemBuilder: (BuildContext context, DataSnapshot snapshot,
//               Animation<double> animation, int index)
//           {
//             print(snapshot.value);
//             // print('====== ==== == =  ===== bilud${snapshot.key!}');
//
//             if (!snapshot.exists) {
//               return Center(child: Column(
//                 children: [
//                   Icon(Icons.bookmark_add_outlined, size: 50, color: Theme
//                       .of(context)
//                       .colorScheme
//                       .onSurface,)
//                   , Text('No Bookmark Added !. Place Add the Bookmark')
//                 ],
//               ),);
//             }
//             else {
//               final result = jsonDecode(jsonEncode(snapshot.value)) as Map<
//                   String,
//                   dynamic>;
//               final data = Result.fromJson(result);
//
//
//               return Padding(
//                 padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                         context, MaterialPageRoute(builder: (context) =>
//                         NewsDetailPage(inDex: data, isFirebase: true,)));
//                   },
//                   child: Container(
//                     height: 120.h,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20.r),
//                       color: Theme.of(context).colorScheme.surface,
//                       boxShadow: [
//                         BoxShadow(
//                           offset: Offset(-1, 0.9),
//                           color: Theme.of(context).colorScheme.surface
//                               .withAlpha((255 * 0.2).toInt()),
//                           blurRadius: 1,
//                         ),
//                       ],
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.only(left: 10.0),
//                           child: Container(
//                             width: 90.w,
//                             height: 90.h,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10.r),
//                               image: DecorationImage(
//                                 image: NetworkImage(
//                                   // snapshot.child('image').value.toString()
//                                   data.multimedia!.first.url.toString(),
//                                 ),
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(left: 8.0),
//                           child: Container(
//                             width: 210.w,
//                             height: 90.h,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10.r),
//                               color: Theme
//                                   .of(context)
//                                   .colorScheme
//                                   .surface,
//                             ),
//                             child: Padding(
//                               padding: EdgeInsets.all(5.0),
//                               child: Column(
//                                 crossAxisAlignment:
//                                 CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'THE NEW YORK TIMES',
//                                     style: Theme
//                                         .of(context)
//                                         .textTheme
//                                         .bodySmall
//                                         ?.copyWith(
//                                       color: Theme
//                                           .of(
//                                         context,
//                                       )
//                                           .colorScheme
//                                           .error,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 43.h,
//                                     width: 210,
//
//                                     child: Text(
//                                       maxLines: 2,
//                                       overflow: TextOverflow.ellipsis,
//                                       data.title.toString(),
//                                       style: Theme
//                                           .of(
//                                         context,
//                                       )
//                                           .textTheme
//                                           .bodyMedium,
//                                     ),
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                     MainAxisAlignment.start,
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.center,
//                                     children: [
//                                       SizedBox(
//                                         width: 100.0.w,
//                                         child: Text(
//                                           overflow: TextOverflow.ellipsis,
//                                           data.publishedDate.toString()
//                                           ,
//                                           style: Theme
//                                               .of(
//                                             context,
//                                           )
//                                               .textTheme
//                                               .bodySmall,
//                                         ),
//                                       ),
//                                       SizedBox(width: 10.w),
//                                       Text(
//                                         data.section.toString(),
//                                         style: Theme
//                                             .of(
//                                           context,
//                                         )
//                                             .textTheme
//                                             .bodySmall,
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//
//             }
//           },
//
//         );
//       }
//     });
//
//
//   }
//
//   void _onDataExiste() async{
//     final snap =  await FirebaseDatabase.instance.ref('bookmarks').get();
//     if (snap.exists) {
//       isData.value = true;
//     } else {
//       isData.value = false;
//     }
//   }
// }
