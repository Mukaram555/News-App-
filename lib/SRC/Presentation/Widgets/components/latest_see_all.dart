import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/SRC/Presentation/Widgets/components/home%20PageUi/trending_home_page.dart';

import 'home PageUi/home_page_all_tabs.dart';


class LatestSeeAll extends StatefulWidget {
  final bool isTrending;
  const LatestSeeAll({super.key, required this.isTrending});

  @override
  State<LatestSeeAll> createState() => _LatestSeeAllState();
}

class _LatestSeeAllState extends State<LatestSeeAll> with SingleTickerProviderStateMixin {
  late TabController tabController;
  ValueNotifier<int> currentIndex = ValueNotifier(0);
  ValueNotifier<bool> isChanging = ValueNotifier(false);

  final List tabLabel = [
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
    tabController = TabController(length: tabLabel.length, vsync: this);
    tabController.addListener(() async {
      if (!tabController.indexIsChanging) return;

      if (isChanging.value) return; // prevent multiple triggers

      isChanging.value = true;

      // Wait for 2 seconds before updating
      await Future.delayed(const Duration(seconds: 2));

      print(currentIndex.value);
      if (mounted) {
        isChanging.value = false;
        currentIndex.value = tabController.index;
        print("======== current Index ===============");

        print(currentIndex.value);

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
    // final TextEditingController _sreachController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child:

        NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
        
        
              SliverToBoxAdapter(
        
                       child:    Center(child: Text(widget.isTrending ?'Trending News': "Latest", style: Theme.of(context).textTheme.displayLarge,)),
        
        
              ),

              widget.isTrending
              ?SliverToBoxAdapter()

              :SliverPersistentHeader(
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
                      tabLabel.length,
                          (index) => Tab(text: tabLabel[index]),
                    ),
                  ),
                ),
              ),
            ];
          },
          body:widget.isTrending?
           TrendingHomePage(isAxis: false)   
          :ValueListenableBuilder(
              valueListenable: isChanging,
              builder: (context, value, child) {
                return Container(
                  child: isChanging.value
                      ? const Center(child: CupertinoActivityIndicator())
                      : TabBarView(
                    controller: tabController,
                    children: List.generate(
                      tabLabel.length,
                          (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TabViewBuilder(textLabel: tabLabel[index]),
                      ),
                    ),
                  ),
                );
              }
          ),
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