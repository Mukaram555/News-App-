import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/SRC/Presentation/Widgets/components/Bookmark/bookmark_pages.dart';
import 'package:news_app/SRC/Presentation/Widgets/components/Explore/explore_page.dart';
import 'package:news_app/SRC/Presentation/Widgets/components/Profile/profile.dart';
// import 'package:news_app/SRC/Presentation/Widgets/components/home%20PageUi/example.dart';
import 'package:news_app/SRC/Presentation/Widgets/components/home%20PageUi/home_page.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _currentIndex = 0;

  final List<Widget> _selectPage = [
    HomePage(),
    // TabExample(),
    ExplorePage(),
    BookmarkPages(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectPage[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home_Icon.svg',
              height: 24.h,
              width: 24.w,
            ),
            label: 'Home',
            activeIcon: Column(
              children: [
                SvgPicture.asset(
                  'assets/icons/home_Icon.svg',
                  height: 24.h,
                  width: 24.w,
                  // colorFilter: ColorFilter.mode(Colors.green, BlendMode.src),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
          // BottomNavigationBarItem(
          //   icon: SvgPicture.asset(
          //     'assets/icons/home_Icon.svg',
          //     height: 24.h,
          //     width: 24.w,
          //   ),
          //   label: 'Home',
          //   activeIcon: Column(
          //     children: [
          //       SvgPicture.asset(
          //         'assets/icons/home_Icon.svg',
          //         height: 24.h,
          //         width: 24.w,
          //         // colorFilter: ColorFilter.mode(Colors.green, BlendMode.src),
          //         color: Theme.of(context).colorScheme.primary,
          //       ),
          //     ],
          //   ),
          // ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/explor_icons.svg',
              height: 24.h,
              width: 24.w,
            ),
            label: 'Explore',
            activeIcon: Column(
              children: [
                SvgPicture.asset(
                  'assets/icons/explor_icons.svg',
                  height: 24.h,
                  width: 24.w,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/bookmark_icon.svg',
              height: 24.h,
              width: 24.w,
            ),
            label: 'BookMark',
            activeIcon: Column(
              children: [
                SvgPicture.asset(
                  'assets/icons/bookmark_icon.svg',
                  height: 24.h,
                  width: 24.w,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/profile_icon.svg',
              height: 24.h,
              width: 24.w,
            ),
            label: 'Profile',
            activeIcon: Column(
              children: [
                SvgPicture.asset(
                  'assets/icons/profile_icon.svg',
                  height: 24.h,
                  width: 24.w,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
        ],
        selectedLabelStyle: Theme.of(context).textTheme.bodySmall,
        unselectedLabelStyle: Theme.of(context).textTheme.bodySmall,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface,
        selectedItemColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
