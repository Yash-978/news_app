import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'View/Screens/DetailScreen.dart';
import 'View/Screens/HomeScreen.dart';

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
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/detail', page: () => const DetailPage()),
      ],
    );
  }
}

