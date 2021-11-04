import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/config/keys.dart';
import 'package:weather_app/data/models/language.dart';
import 'package:weather_app/data/services/localization_service.dart';
import 'package:weather_app/view/splash.dart';
import 'package:weather_app/view/widgets/home/gradient_background.dart';

class LanguagesPage extends StatelessWidget {
  final List<LanguageModel> languages;

  const LanguagesPage({Key? key, required this.languages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      padding: const EdgeInsets.all(0.0),
      child: Scaffold(
        backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(selectLanguageMessage.tr),
      ),
      body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: languages.length,
                itemBuilder: (context, index) => ListTile(
                  onTap: (){
                    Get.offAll(() => const SplashPage());
                    LocalizationService.saveLocale(languages[index].code);
                  },
                  title: Text(languages[index].title),
                ),
                separatorBuilder: (context, index) => const Divider(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
