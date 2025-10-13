import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/SRC/Presentation/Common/Textfield/search_field.dart';
import 'package:news_app/SRC/Presentation/Widgets/components/home%20PageUi/home_page_all_tabs.dart';
import 'package:news_app/SRC/Presentation/Widgets/components/home%20PageUi/trandding_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> builder = [
      TabViewBuilder(),
      TabViewBuilder(),
      TabViewBuilder(),
      TabViewBuilder(),
      TabViewBuilder(),
      TabViewBuilder(),
      TabViewBuilder(),
      TabViewBuilder(),
      TabViewBuilder(),
      TabViewBuilder(),
    ];
    final List tabLable = [
      'All',
      'Sports',
      'Politics',
      'Bussiness',
      'Health',
      'Travel',
      'Science',
      'Fashion',
      'Fashion',
      'Fashion',
    ];

    final TextEditingController _sreachController = TextEditingController();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
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
                        child: SvgPicture.asset(
                          'assets/icons/notification_icon.svg',
                          color: Theme.of(context).colorScheme.onSurface,
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
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.0.w,
                vertical: 10.0.h,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Tranding"), Text("See all")],
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    height: 330.h,
                    width: 390.w,

                    // direction: Axis.horizontal,
                    child: TranddingHomePage(),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: DefaultTabController(
                length: tabLable.length,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Latest"), Text("See all")],
                    ),
                    SizedBox(height: 20.h),

                    // ✅ TAB BAR
                    TabBar(
                      tabAlignment: TabAlignment.start,
                      labelPadding: EdgeInsets.only(left: 10),
                      isScrollable: true,
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                      tabs: List.generate(
                        tabLable.length,
                        (index) => Text(tabLable[index].toString()),
                      ),
                    ),

                    // ✅ Make TabView expand with content
                    SizedBox(
                      height:
                          MediaQuery.of(context).size.height *
                          2.2, // ensures full height
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(
                          tabLable.length,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TabViewBuilder(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
