import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'View/Screens/DetailScreen.dart';
import 'View/Screens/HomeScreen.dart';
import 'View/Screens/SplashScreen.dart';

void main()
{
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => const SplashPage()),
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/detail', page: () => const DetailPage()),
      ],
    );
  }
}

