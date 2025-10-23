import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/SRC/Presentation/Widgets/See%20All%20Tabs/latest_see_all.dart';
import 'package:news_app/SRC/Presentation/Widgets/components/Notification/notification_Screen.dart';

import 'home_page_all_tabs.dart';
import 'trending_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // ignore: unused_field
  final TextEditingController _sreachController = TextEditingController();
  // ignore: unused_field
  String _searchQuery = '';
  late TabController tabController;
  ValueNotifier<int> currentIndex = ValueNotifier(0);
  ValueNotifier<bool> isChanging = ValueNotifier(false);
  final List tabLable = [
    'All',
    'Sports',
    'Politics',
    'US',
    'Business',
    'Health',
    'Travel',
    'Science',
    'Books',
    'Food',
    'Movies',
    'Fashion',
  ];
  // Future _change(int index) async {
  //   await Future.delayed(Duration(seconds: 2), () {
  //     setState(() {
  //       isChange = true;
  //     });
  //   });
  //   // setState(() {
  //   //   isChange = false;
  //   // });
  // }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabLable.length, vsync: this);
    tabController.addListener(() async {
      if (!tabController.indexIsChanging) return;

      if (isChanging.value) return; // prevent multiple triggers

      isChanging.value = true;

      // Wait for 2 seconds before updating
      await Future.delayed(const Duration(seconds: 2));

      if (kDebugMode) {
        print(currentIndex.value);
      }
      if (mounted) {
        isChanging.value = false;
        currentIndex.value = tabController.index;
        // print("======== current Index ===============");

        // print(currentIndex.value);
      }
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: EdgeInsets.all(5.0.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/news_logo_image.png',
                        height: 200.h,
                      ),
                      Container(
                        height: 30.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: Theme.of(context).colorScheme.surface,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(-1, 0.9),
                              color: Theme.of(context).colorScheme.onSurface,
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(5.0.r),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NotificationPage(),
                                ),
                              );
                            },
                            child: SvgPicture.asset(
                              'assets/icons/notification_icon.svg',
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverAppBar(
              // backgroundColor: Colors.green,
              expandedHeight: 90.h,
              floating: true,
              flexibleSpace:
                  //  Container(
                  //   child: SearchField(
                  //     onChange: (val) {},
                  //     sreachController: _sreachController,
                  //   ),
                  // ),
                  FlexibleSpaceBar(
                    // background: Container(
                    //   child: SearchField(
                    //     onChange: (val) {},
                    //     sreachController: _sreachController,
                    //   ),
                    // ),
                    title: Container(
                      height: 35.0.h,
                      width: 225.w,
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        // color: Colors.blue,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: SearchBar(
                        textStyle: WidgetStateProperty.all(
                          Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(fontSize: 12),
                        ),
                        surfaceTintColor: WidgetStateProperty.all(
                          Theme.of(context).colorScheme.tertiaryContainer,
                        ),
                        trailing: [
                          SvgPicture.asset(
                            'assets/icons/menu_icon.svg',
                            height: 12.h,
                            width: 12.w,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ],
                        leading: SvgPicture.asset(
                          height: 12.h,
                          width: 12.w,
                          'assets/icons/search_icons.svg',
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        hintText: 'Search',

                        hintStyle: WidgetStateProperty.all(
                          Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(fontSize: 12),
                        ),
                        backgroundColor: WidgetStateProperty.all(
                          Theme.of(context).colorScheme.surface,
                        ),
                        shadowColor: WidgetStateProperty.all(Colors.grey[750]),
                        elevation: WidgetStateProperty.all(4.0),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0.r),
                          ),
                        ),

                        // padding: WidgetStateProperty.all(EdgeInsets.all(5)),
                      ),
                      // child: TextField(
                      //   style: Theme.of(context).textTheme.bodySmall,
                      //   cursorColor: Colors.grey,
                      //   cursorHeight: 15.h,
                      //   cursorWidth: 0.5.w,

                      //   decoration: InputDecoration(
                      //     prefixIcon: Container(
                      //       height: 5.h,
                      //       width: 5.w,
                      //       color: Colors.amber,
                      //       child: Padding(
                      //         padding: const EdgeInsets.all(8.0),
                      //         child: SvgPicture.asset(
                      //           'assets/icons/search_icons.svg',
                      //           fit: BoxFit.cover,
                      //         ),
                      //       ),
                      //     ),
                      //     focusedBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(color: Colors.black),
                      //       borderRadius: BorderRadius.circular(10.r),
                      //     ),
                      //     border: OutlineInputBorder(
                      //       borderSide: BorderSide(
                      //         width: 0.5,
                      //         color: Colors.black,
                      //       ),
                      //       borderRadius: BorderRadius.circular(10.r),
                      //     ),
                      //   ),
                      // ),
                    ),
                    centerTitle: true,
                  ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Trending",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    LatestSeeAll(isTrending: true),
                              ),
                            );
                          },
                          child: Text(
                            "See all",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: 330.h,
                    width: 390.w,

                    // direction: Axis.horizontal,
                    child: TrendingHomePage(isAxis: true),
                  ),
                ],
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Latest",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),

                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    LatestSeeAll(isTrending: false),
                              ),
                            );
                          },
                          child: Text(
                            "See all",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),

            SliverPersistentHeader(
              delegate: SliverTabBarDelegate(
                TabBar(
                  // onFocusChange: (value, index) => _change,
                  // onTap: _change,
                  tabAlignment: TabAlignment.start,
                  labelPadding: EdgeInsets.only(left: 10),
                  isScrollable: true,
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  controller: tabController,
                  dividerColor: Theme.of(context).colorScheme.surface,
                  labelColor: Theme.of(context).colorScheme.onSurface,
                  unselectedLabelColor: Theme.of(
                    context,
                  ).colorScheme.onSecondary,
                  indicatorColor: Theme.of(context).colorScheme.onSurface,
                  tabs: List.generate(
                    tabLable.length,
                    (index) => Tab(text: tabLable[index]),
                  ),
                ),
              ),
            ),
          ];
        },
        body: ValueListenableBuilder(
          valueListenable: isChanging,
          builder: (context, value, child) {
            return Container(
              child: isChanging.value
                  ? const Center(child: CupertinoActivityIndicator())
                  : TabBarView(
                      controller: tabController,
                      children: List.generate(
                        tabLable.length,
                        (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TabViewBuilder(textLabel: tabLable[index]),
                        ),
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }
}

class SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  SliverTabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(SliverTabBarDelegate oldDelegate) => false;
}
// body: CustomScrollView(
//   slivers: [
//     SliverAppBar(
//       flexibleSpace: FlexibleSpaceBar(
//         background: Padding(
//           padding: EdgeInsets.all(5.0.r),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Image.asset(
//                 'assets/images/news_logo_image.png',
//                 height: 200.h,
//               ),
//               Container(
//                 height: 30.h,
//                 width: 30.w,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5.r),
//                   color: Theme.of(context).colorScheme.surface,
//                   boxShadow: [
//                     BoxShadow(
//                       offset: Offset(-1, 0.9),
//                       color: Theme.of(context).colorScheme.onSurface,
//                       blurRadius: 1,
//                     ),
//                   ],
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.all(5.0.r),
//                   child: SvgPicture.asset(
//                     'assets/icons/notification_icon.svg',
//                     color: Theme.of(context).colorScheme.onSurface,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//     SliverAppBar(
//       // backgroundColor: Colors.green,
//       expandedHeight: 90.h,
//       floating: true,
//       flexibleSpace:
//           //  Container(
//           //   child: SearchField(
//           //     onChange: (val) {},
//           //     sreachController: _sreachController,
//           //   ),
//           // ),
//           FlexibleSpaceBar(
//             // background: Container(
//             //   child: SearchField(
//             //     onChange: (val) {},
//             //     sreachController: _sreachController,
//             //   ),
//             // ),
//             title: Container(
//               height: 35.0.h,
//               width: 225.w,
//               padding: EdgeInsets.all(2),
//               decoration: BoxDecoration(
//                 // color: Colors.blue,
//                 borderRadius: BorderRadius.circular(10.r),
//               ),
//               child: SearchBar(
//                 surfaceTintColor: WidgetStateProperty.all(
//                   Theme.of(context).colorScheme.tertiaryContainer,
//                 ),
//                 trailing: [
//                   SvgPicture.asset(
//                     'assets/icons/menu_icon.svg',
//                     height: 12.h,
//                     width: 12.w,
//                     color: Theme.of(context).colorScheme.onSurface,
//                   ),
//                 ],
//                 leading: SvgPicture.asset(
//                   height: 12.h,
//                   width: 12.w,
//                   'assets/icons/search_icons.svg',
//                   color: Theme.of(context).colorScheme.onSurface,
//                 ),
//                 hintText: 'Search',
//                 hintStyle: WidgetStateProperty.all(
//                   Theme.of(
//                     context,
//                   ).textTheme.bodyMedium?.copyWith(fontSize: 12),
//                 ),
//                 backgroundColor: WidgetStateProperty.all(
//                   Theme.of(context).colorScheme.surface,
//                 ),
//                 shadowColor: WidgetStateProperty.all(Colors.grey[750]),
//                 elevation: WidgetStateProperty.all(4.0),
//                 shape: WidgetStateProperty.all(
//                   RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(5.0.r),
//                   ),
//                 ),

//                 // padding: WidgetStateProperty.all(EdgeInsets.all(5)),
//               ),
//               // child: TextField(
//               //   style: Theme.of(context).textTheme.bodySmall,
//               //   cursorColor: Colors.grey,
//               //   cursorHeight: 15.h,
//               //   cursorWidth: 0.5.w,

//               //   decoration: InputDecoration(
//               //     prefixIcon: Container(
//               //       height: 5.h,
//               //       width: 5.w,
//               //       color: Colors.amber,
//               //       child: Padding(
//               //         padding: const EdgeInsets.all(8.0),
//               //         child: SvgPicture.asset(
//               //           'assets/icons/search_icons.svg',
//               //           fit: BoxFit.cover,
//               //         ),
//               //       ),
//               //     ),
//               //     focusedBorder: OutlineInputBorder(
//               //       borderSide: BorderSide(color: Colors.black),
//               //       borderRadius: BorderRadius.circular(10.r),
//               //     ),
//               //     border: OutlineInputBorder(
//               //       borderSide: BorderSide(
//               //         width: 0.5,
//               //         color: Colors.black,
//               //       ),
//               //       borderRadius: BorderRadius.circular(10.r),
//               //     ),
//               //   ),
//               // ),
//             ),
//             centerTitle: true,
//           ),
//     ),

//     SliverToBoxAdapter(
//       child: Padding(
//         padding: EdgeInsets.symmetric(
//           horizontal: 15.0.w,
//           vertical: 10.0.h,
//         ),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [Text("Tranding"), Text("See all")],
//             ),
//             SizedBox(height: 20.h),
//             Container(
//               height: 330.h,
//               width: 390.w,

//               // direction: Axis.horizontal,
//               child: TranddingHomePage(),
//             ),
//           ],
//         ),
//       ),
//     ),
//     SliverToBoxAdapter(
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 10.0),
//         child: DefaultTabController(
//           length: tabLable.length,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [Text("Latest"), Text("See all")],
//               ),
//               SizedBox(height: 20.h),

//               // ✅ TAB BAR
//               TabBar(
//                 tabAlignment: TabAlignment.start,
//                 labelPadding: EdgeInsets.only(left: 10),
//                 isScrollable: true,
//                 labelStyle: Theme.of(context).textTheme.bodyMedium,
//                 tabs: List.generate(
//                   tabLable.length,
//                   (index) => Text(tabLable[index].toString()),
//                 ),
//               ),

//               // ✅ Make TabView expand with content
//               SizedBox(
//                 height:
//                     MediaQuery.of(context).size.height *
//                     10, // ensures full height
//                 child: TabBarView(
//                   physics: const NeverScrollableScrollPhysics(),

//                   children: List.generate(
//                     tabLable.length,
//                     (index) => Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TabViewBuilder(textLable: tabLable[index]),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   ],
// ),
