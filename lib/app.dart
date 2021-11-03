import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/const.dart';
import 'utils/binding.dart';
import 'view/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
          primaryColor: primaryColor,
          fontFamily: "Montserrat",
          appBarTheme: AppBarTheme(
              color: Colors.grey.shade50,
              titleTextStyle: const TextStyle(color: primaryColor),
              iconTheme: const IconThemeData(color: primaryColor))),
    );
  }
}
