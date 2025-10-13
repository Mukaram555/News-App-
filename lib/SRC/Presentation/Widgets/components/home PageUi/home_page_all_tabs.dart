import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/SRC/Data/Models/news_model.dart';
import 'package:news_app/SRC/Data/repositories/api/api_service.dart';

import '../news_detail_page.dart';

class TabViewBuilder extends StatefulWidget {
  const TabViewBuilder({super.key, required this.textLabel});

  final String textLabel;

  @override
  State<TabViewBuilder> createState() => _TabViewBuilderState();
}

class _TabViewBuilderState extends State<TabViewBuilder> {
  Future<NewsModel>? modelCall(textLabel) async {
    if (textLabel == 'All') {
      // await Future.delayed(Duration(seconds: 2));
      return ApiService().NewsApiResponse('home');
    } else if (textLabel == 'Sports') {
      // await Future.delayed(Duration(seconds: 2));
      return ApiService().NewsApiResponse('sports');
    } else if (textLabel == 'Politics') {
      // await Future.delayed(Duration(seconds: 2));
      return ApiService().NewsApiResponse('politics');
    } else if (textLabel == 'Bussiness') {
      // await Future.delayed(Duration(seconds: 2));
      return ApiService().NewsApiResponse('business');
    } else if (textLabel == 'Health') {
      // await Future.delayed(Duration(seconds: 2));
      return ApiService().NewsApiResponse('health');
    } else if (textLabel == 'Travel') {
      // await Future.delayed(Duration(seconds: 2));
      return ApiService().NewsApiResponse('travel');
    } else if (textLabel == 'Science') {
      // await Future.delayed(Duration(seconds: 2));
      return ApiService().NewsApiResponse('science');
    } else if (textLabel == 'region') {
      // await Future.delayed(Duration(seconds: 2));
      return ApiService().NewsApiResponse('nyregion');
    } else if (textLabel == 'Movies') {
      // await Future.delayed(Duration(seconds: 2));
      return ApiService().NewsApiResponse("movies");
    } else if (textLabel == 'world') {
      // await Future.delayed(Duration(seconds: 2));
      return ApiService().NewsApiResponse("world");
    } else if (textLabel == 'US') {
      // await Future.delayed(Duration(seconds: 2));
      return ApiService().NewsApiResponse('us');
    } else if (textLabel == 'Food') {
      // await Future.delayed(Duration(seconds: 2));
      return ApiService().NewsApiResponse('food');
    } else if (textLabel == 'Books') {
      // await Future.delayed(Duration(seconds: 2));
      return ApiService().NewsApiResponse('books');
    } else if (textLabel == 'Arts') {
      // await Future.delayed(Duration(seconds: 2));
      return ApiService().NewsApiResponse('arts');
    } else {
      // await Future.delayed(Duration(seconds: 2));
      return ApiService().NewsApiResponse('fashion');
    }
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: modelCall(widget.textLabel),
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.data != null &&
            snapshot.data!.results != null &&
            snapshot.data?.numResults != 0 &&
            snapshot.data!.results!.isNotEmpty) {
          return CustomScrollView(
            slivers: [
              SliverList.builder(
                itemCount: snapshot.data!.results?.length,
                itemBuilder: (context, index) {
                  var result = snapshot.data!.results![index];

                  if (result.title!.isEmpty && result.multimedia!.isEmpty) {
                    return SizedBox();
                  } else {
                    return Padding(
                      padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> NewsDetailPage(inDex: result,)));
                        },
                        child: Container(
                          height: 120.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Theme.of(context).colorScheme.surface,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(-1, 0.9),
                                color: Theme.of(context).colorScheme.surface
                                    .withAlpha((255 * 0.2).toInt()),
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
                                      image: result.multimedia!.isNotEmpty
                                          ? NetworkImage(
                                              result.multimedia?.first.url ??
                                                  'https://static01.nyt.com/images/2025/10/15/multimedia/15trav-goonies-06-bvlk/15trav-goonies-06-bvlk-superJumbo.jpg',
                                            )
                                          : NetworkImage(
                                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQMsHO6y4eGcYVu1inbdzx9CQ1GebW-yE0Ag&s',
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'THE NEW YORK TIMES',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: Theme.of(
                                                  context,
                                                ).colorScheme.error,
                                              ),
                                        ),
                                        Container(
                                          height: 43.h,
                                          width: 210,

                                          child: Text(
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            result.title ?? '',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyMedium,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 100.0.w,
                                              child: Text(
                                                overflow: TextOverflow.ellipsis,
                                                result.publishedDate.toString(),
                                                style: Theme.of(
                                                  context,
                                                ).textTheme.bodySmall,
                                              ),
                                            ),
                                            SizedBox(width: 10.w),
                                            Text(
                                              result.section ?? "",
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodySmall,
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
                      ),
                    );
                  }
                },
              ),
            ],
          );
        } else if (snapshot.hasData && snapshot.data?.numResults == 0 ||
            snapshot.data == null && snapshot.data?.results == null) {
          return Text('No News Available ${widget.textLabel}');
        } else {
          return ListView.builder(
            shrinkWrap: true,
            primary: false,
            physics: NeverScrollableScrollPhysics(parent: ScrollPhysics()),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(5.0),
                child: Container(
                  height: 120.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Theme.of(context).colorScheme.secondary,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(-1, 0.9),
                        color: Theme.of(context).colorScheme.onSurface,
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
                            color: Colors.black26,
                          ),
                          child: Center(
                            child: CupertinoActivityIndicator(
                              animating: true,
                              radius: 20.0.r,
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
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CupertinoActivityIndicator(
                                  animating: true,
                                  radius: 10.0.r,
                                ),
                                Container(
                                  height: 43.h,
                                  width: 210,

                                  child: CupertinoActivityIndicator(
                                    animating: true,
                                    radius: 10.0.r,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CupertinoActivityIndicator(
                                      animating: true,
                                      radius: 10.0.r,
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
      },
    );
  }
}
