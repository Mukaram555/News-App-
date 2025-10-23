import 'package:flutter/material.dart';

class TabExample extends StatefulWidget {
  const TabExample({super.key});

  @override
  State<TabExample> createState() => _TabExampleState();
}

class _TabExampleState extends State<TabExample>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
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
            // 🟢 Top Sliver List
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) =>
                    ListTile(title: Text('Top List Item $index')),
                childCount: 5,
              ),
            ),

            // 🟡 TabBar (pinned)
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverTabBarDelegate(
                TabBar(
                  controller: tabController,
                  labelColor: Colors.red,
                  unselectedLabelColor: Colors.black,
                  indicatorColor: Colors.red,
                  tabs: const [
                    Tab(text: 'Tab 1', icon: Icon(Icons.person)),
                    Tab(text: 'Tab 2', icon: Icon(Icons.add)),
                    Tab(text: 'Tab 3', icon: Icon(Icons.deck)),
                  ],
                ),
              ),
            ),
          ];
        },

        // 🔴 Unified body: TabBarView → each tab has content + bottom list
        body: TabBarView(
          controller: tabController,
          children: const [
            _TabContent(tabTitle: 'Tab 1'),
            _TabContent(tabTitle: 'Tab 2'),
            _TabContent(tabTitle: 'Tab 3'),
          ],
        ),
      ),
    );
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  _SliverTabBarDelegate(this.tabBar);

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
    return Container(color: Colors.white, child: tabBar);
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) => false;
}

class _TabContent extends StatelessWidget {
  final String tabTitle;
  const _TabContent({required this.tabTitle});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // 🧱 Inner list for tab content
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(title: Text('$tabTitle Item $index')),
            childCount: 20,
          ),
        ),

        // 🔻 Another list after tab content
        // SliverList(
        //   delegate: SliverChildBuilderDelegate(
        //     (context, index) => ListTile(
        //       title: Text('After Tab $tabTitle — Extra Item $index'),
        //       tileColor: index.isEven ? Colors.grey.shade200 : Colors.white,
        //     ),
        //     childCount: 10,
        //   ),
        // ),
      ],
    );
  }
}
