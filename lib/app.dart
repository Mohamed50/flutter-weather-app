import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:weather_app/data/services/localization_service.dart';
import 'package:weather_app/view/splash.dart';
import 'config/const.dart';
import 'utils/binding.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: const Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 50.0,
        ),
      ),
      child: GetMaterialApp(
        initialBinding: Binding(),
        debugShowCheckedModeBanner: false,
        home: const SplashPage(),
        translations: LocalizationService(),
        locale: LocalizationService.locale,
        fallbackLocale: LocalizationService.fallbackLocale,
        theme: ThemeData(
          primaryColor: primaryColor,
          fontFamily: "Montserrat",
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
    );
  }

}
