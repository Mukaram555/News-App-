// import 'package:flutter/material.dart';
//
// class Tabs extends StatefulWidget {
//   const Tabs({super.key});
//
//   @override
//   State<Tabs> createState() => _TabsState();
// }
//
//
// class _TabsState extends State<Tabs> {
//   @override
//   late TabController tabController;
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return SliverPersistentHeader(
//       delegate: SliverTabBarDelegate(
//         TabBar(
// // onFocusChange: (value, index) => _change,
// // onTap: _change,
//           tabAlignment: TabAlignment.start,
//           labelPadding: EdgeInsets.only(left: 10),
//           isScrollable: true,
//           labelStyle: Theme.of(context).textTheme.bodyMedium,
//           controller: tabController,
//           dividerColor: Theme.of(context).colorScheme.surface,
//           labelColor: Theme.of(context).colorScheme.onSurface,
//           unselectedLabelColor: Theme.of(
//             context,
//           ).colorScheme.onSecondary,
//           indicatorColor: Theme.of(context).colorScheme.onSurface,
//           tabs: List.generate(
//             tabLable.length,
//                 (index) => Tab(text: tabLable[index]),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
//   final TabBar tabBar;
//   SliverTabBarDelegate(this.tabBar);
//
//   @override
//   double get minExtent => tabBar.preferredSize.height;
//   @override
//   double get maxExtent => tabBar.preferredSize.height;
//
//   @override
//   Widget build(
//       BuildContext context,
//       double shrinkOffset,
//       bool overlapsContent,
//       ) {
//     return Container(
//       color: Theme.of(context).colorScheme.surface,
//       child: tabBar,
//     );
//   }
//
//   @override
//   bool shouldRebuild(SliverTabBarDelegate oldDelegate) => false;
// }