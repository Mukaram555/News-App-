import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/SRC/Data/repositories/api/api_service.dart';
import 'package:news_app/SRC/Presentation/Widgets/components/news_detail_page.dart';

class TrendingHomePage extends StatefulWidget {
  final bool isAxis;
  const TrendingHomePage({super.key , required this.isAxis});

  @override
  State<TrendingHomePage> createState() => _TranddingHomePageState();
}

class _TranddingHomePageState extends State<TrendingHomePage> {
  // NewsModel? _newsData;
  // bool _isLoading = true;
  // String? _errorMessage;

  // @override
  // void initState() {
  //   super.initState();
  //   ApiService().worldApiResponse();
  //   // _fetchNews();
  // }

  // Future<void> _fetchNews() async {
  //   try {
  //     final data = await ApiService().worldApiResponse();
  //     setState(() {
  //       _newsData = data;
  //       _isLoading = false;
  //     });
  //   } catch (e) {
  //     setState(() {
  //       _errorMessage = e.toString();
  //       _isLoading = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // if (_isLoading) {
    //   return const Center(child: CircularProgressIndicator());
    // }

    // if (_errorMessage != null) {
    //   return Center(child: Text('Error: $_errorMessage'));
    // }

    // if (_newsData == null ||
    //     _newsData!.results == null ||
    //     _newsData!.results!.isEmpty) {
    //   return const Center(child: Text('No news available'));
    // }

    // final results = _newsData!.results!;

    return FutureBuilder(
      future: ApiService().NewsApiResponse('world'),
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.data!.results != null &&
            snapshot.data!.numResults != 0) {
          return ListView.builder(
            scrollDirection:widget.isAxis ?Axis.horizontal :Axis.vertical ,
            itemCount: snapshot.data!.results!.length,
            itemBuilder: (context, index) {
              var result = snapshot.data!.results?[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> NewsDetailPage(inDex: result) ));
                      },
                      child: Container(
                        height: 200.h,
                        width: 325.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          image: DecorationImage(
                            image: NetworkImage(
                              result!.multimedia!.elementAt(1).url ?? "",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        // child:
                        // Column(
                        //   children: List.generate(result.multimedia.length, (
                        //     imageIndex,
                        //   ) {
                        //     return
                        // Image.network(
                        //   result!.multimedia!.elementAt(1).url ?? "",
                        //   fit: BoxFit.cover,
                        // ),
                        //   }),
                        // ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 90.h,
                      width: 325.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        // color: colors[index],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "The New York Times",
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                            ),
                            Container(
                              height: 43.h,
                              width: 300.w,
                              // color: images[index],
                              child: Text(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                result.title.toString(),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  result.publishedDate.toString(),
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  result.section.toString(),
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return ListView.builder(
            scrollDirection:widget.isAxis ?Axis.horizontal :Axis.vertical ,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 200.h,
                      width: 325.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: Colors.black26,
                      ),
                      child: Center(
                        child: CupertinoActivityIndicator(
                          animating:
                              true, // Set to false to freeze the animation
                          radius: 30.0, // Adjust the size
                        ),
                      ),
                      // Column(
                      //   children: List.generate(result.multimedia.length, (
                      //     imageIndex,
                      //   ) {
                      //     return
                      // Image.network(
                      //   result!.multimedia!.elementAt(1).url ?? "",
                      //   fit: BoxFit.cover,
                      // ),
                      //   }),
                      // ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 90.h,
                      width: 325.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        // color: colors[index],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CupertinoActivityIndicator(
                              animating:
                                  true, // Set to false to freeze the animation
                              radius: 10.0, // Adjust the size
                            ),

                            Container(
                              height: 43.h,
                              width: 300.w,
                              color: Colors.black26,
                              child: Center(
                                child: CupertinoActivityIndicator(
                                  animating:
                                      true, // Set to false to freeze the animation
                                  radius: 15.0, // Adjust the size
                                ),
                              ),
                            ),
                            CupertinoActivityIndicator(
                              animating:
                                  true, // Set to false to freeze the animation
                              radius: 10.0, // Adjust the size
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}

    // return ListView.builder(
    //   scrollDirection: Axis.horizontal,
    //   itemCount: results.length,
    //   itemBuilder: (context, index) {
    //     final result = results[index];
    //     return Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Column(
    //         children: [
    //           Container(
    //             height: 200.h,
    //             width: 325.w,
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(20.r),
    //               color: Colors.blueAccent,
    //               image:
    //                   (result.multimedia != null &&
    //                       result.multimedia!.isNotEmpty)
    //                   ? DecorationImage(
    //                       image: NetworkImage(""),
    //                       fit: BoxFit.cover,
    //                     )
    //                   : null,
    //             ),
    //           ),
    //           SizedBox(height: 20.h),
    //           Container(
    //             height: 90.h,
    //             width: 325.w,
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(20.r),
    //             ),
    //             child: Padding(
    //               padding: const EdgeInsets.all(5.0),
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     result.title ?? '',
    //                     maxLines: 2,
    //                     overflow: TextOverflow.ellipsis,
    //                     style: Theme.of(context).textTheme.bodyMedium,
    //                   ),
    //                   SizedBox(height: 5.h),
    //                   Row(
    //                     children: [
    //                       Text(
    //                         result.publishedDate?.toString() ?? '',
    //                         style: Theme.of(context).textTheme.bodySmall,
    //                       ),
    //                       SizedBox(width: 10.w),
    //                       Text(
    //                         result.section ?? '',
    //                         style: Theme.of(context).textTheme.bodySmall,
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    // );
  