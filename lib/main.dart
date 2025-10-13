import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/SRC/Data/Resources/ThemesData/dark_theme_data.dart';
import 'package:news_app/SRC/Data/Resources/ThemesData/light_theme_data.dart';
import 'package:news_app/SRC/Presentation/Widgets/Auth/Login/controller/Providers/password_visibility_provider.dart';
import 'package:news_app/SRC/Presentation/Widgets/components/bottom_navigation.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => PasswordVisibilityProvider()),
            ChangeNotifierProvider(create: (_) => EmailVisibilityProvider()),
          ],
          child: MaterialApp(
            title: 'News APP',
            theme: darkTheme,
            debugShowCheckedModeBanner: false,
            home: Scaffold(body: SafeArea(child: BottomNavigationPage())),
          ),
        );
      },
    );
  }
}
