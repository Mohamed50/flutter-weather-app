import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/data/models/language.dart';
import 'package:weather_app/view/splash.dart';
import 'package:weather_app/view/widgets/home/gradient_background.dart';

class LanguagesPage extends StatelessWidget {
  final List<LanguageModel> languages;

  const LanguagesPage({Key? key, required this.languages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: languages.length,
          itemBuilder: (context, index) => ListTile(
            onTap: (){
              Get.updateLocale(Locale(languages[index].code));
              Get.offAll(() => const SplashPage());
            },
            title: Text(languages[index].title),
            trailing: Text(languages[index].code),
          ),
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
    );
  }
}
