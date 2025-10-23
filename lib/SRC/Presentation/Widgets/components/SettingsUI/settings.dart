import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/SRC/Presentation/Widgets/components/Notification/notification_Screen.dart';
import 'package:provider/provider.dart';

import '../../../Common/Login&SignUP Screen/common_app_bar.dart';
import 'Theme Convertion/theme_provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List data = [
    {'title': 'notificatons', 'icon': Icons.notifications},
    {'title': 'Secutrity', 'icon': Icons.lock},
    {'title': 'Help', 'icon': Icons.help},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarCommon(screenTitle: 'Settings'),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.0.w,
                vertical: 10.0.h,
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationPage(),
                        ),
                      );
                    },
                    child: ContentContainer(
                      title: data[0]['title'],
                      icon: data[0]['icon'],
                    ),
                  ),
                  SizedBox(height: 40.0.h),
                  ContentContainer(
                    title: data[1]['title'],
                    icon: data[1]['icon'],
                  ),
                  SizedBox(height: 40.0.h),
                  ContentContainer(
                    title: data[2]['title'],
                    icon: data[2]['icon'],
                  ),
                  SizedBox(height: 40.0.h),
                  SizedBox(
                    height: 30.0.h,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.dark_mode_outlined),
                            Text(
                              'Dark Mode',
                              style: Theme.of(context).textTheme.labelSmall
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface,
                                  ),
                            ),
                          ],
                        ),
                        Consumer<ThemeProvider>(
                          builder: (context, value, child) {
                            return Row(
                              children: [
                                Switch(
                                  value: value.light,
                                  // focusColor: LightThemeColors.C12,
                                  onChanged: (_) {
                                    value.toggleTheme();
                                    if (kDebugMode) {
                                      print(value.light);
                                    }
                                    if (kDebugMode) {
                                      print('===================');
                                    }
                                    if (kDebugMode) {
                                      print(ThemeProvider().light);
                                    }
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.0.h),
                  SizedBox(
                    height: 30.0.h,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Icon(Icons.logout),
                        Text(
                          'Logout',
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContentContainer extends StatelessWidget {
  final String title;
  final IconData icon;

  const ContentContainer({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.0.h,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Row(
              children: [
                Icon(icon),
                SizedBox(width: 10.0.w),
                Text(
                  title,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_right, size: 25),
        ],
      ),
    );
  }
}
