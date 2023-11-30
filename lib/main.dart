import 'package:agricultureapp/binding/binding_app.dart';
import 'package:agricultureapp/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'constants/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
    ));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AGRICULTUREAPP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors().primaryColor,
          secondary: AppColors().primaryColor,
        ),
      ),
      initialRoute: AppPages.INITIAL,
      initialBinding: BindingApp(),
      getPages: AppPages.routes,
    );
  }
}
