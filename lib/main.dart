import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/SRC/Data/Resources/ThemesData/dark_theme_data.dart';
import 'package:news_app/SRC/Data/Resources/ThemesData/light_theme_data.dart';
import 'package:news_app/SRC/Presentation/Widgets/Auth/Login/controller/Providers/password_visibility_provider.dart';
import 'package:news_app/SRC/Presentation/Widgets/components/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'SRC/Presentation/Widgets/components/SettingsUI/Theme Convertion/theme_provider.dart';
import 'SRC/Presentation/Widgets/components/home PageUi/controller/favorite_provider_controller.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
    url: 'https://ujidhugjwvogclvtouwx.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVqaWRodWdqd3ZvZ2NsdnRvdXd4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjMwMTAyMDYsImV4cCI6MjA3ODU4NjIwNn0.04hE0W4oVg0o84pbuSaNcUbTXuXKb4tdWT2Q7_XftEg ',
  );
  // await Supabase.initialize(
  //   url: 'https://ujidhugjwvogclvtouwx.supabase.co',
  //   // 👈 This is the Server URL
  //   anonKey:
  //       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVqaWRodWdqd3ZvZ2NsdnRvdXd4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjMwMTAyMDYsImV4cCI6MjA3ODU4NjIwNn0.04hE0W4oVg0o84pbuSaNcUbTXuXKb4tdWT2Q7_XftEg ', // 👈 This is the anon public key
  // );

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
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => ThemeProvider()),
            ChangeNotifierProvider(
              create: (context) => FavoriteProviderController(),
            ),
            ChangeNotifierProvider(
              create: (context) => PasswordVisibilityProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => EmailVisibilityProvider(),
            ),
          ],
          child: Consumer<ThemeProvider>(
            builder: (context, value, child) {
              return MaterialApp(
                title: 'News APP',
                theme: value.light ? darkTheme : lightTheme,
                debugShowCheckedModeBanner: false,
                home: Scaffold(body: SafeArea(child: SplashScreen())),
              );
            },
          ),
        );
      },
    );
  }
}
