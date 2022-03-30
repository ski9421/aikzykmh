import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1125, 2250),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.Initial,
        getPages: AppPages.pages,
      ),
    );
  }
}
