// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
//
// class TabController with ChangeNotifier {
//
//   late TabController tabController;
//   final int currentIndex = 0;
//   final bool isChanging = false;
//   final List tabLabel = [
//     'All',
//     'Sports',
//     'Politics',
//     'US',
//     'Business',
//     'Health',
//     'Travel',
//     'Science',
//     'Books',
//     'Food',
//     'Movies',
//     'Fashion',
//   ];
//
//   void TabChange( ) {
//     tabController = TabController(length: tabLabel.length, vsync: this);
//     tabController.addListener(() async {
//       if (!tabController.indexIsChanging) return;
//
//       if (isChanging) return; // prevent multiple triggers
//
//       isChanging = true;
//
//       // Wait for 2 seconds before updating
//       await Future.delayed(const Duration(seconds: 2));
//
//       print(currentIndex);
//       if (mounted) {
//         isChanging = false;
//         currentIndex = tabController.index;
//         print("======== current Index ===============");
//
//         print(currentIndex.value);
//
//       }
//     });
//   }
//
// }