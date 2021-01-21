import 'package:flutter/material.dart';
import 'package:flutter_dev/controllers/controllers.dart';
import 'package:get/get.dart';
import 'package:flutter_dev/constants/constants.dart';
import 'package:get_storage/get_storage.dart';
import 'ui/components/components.dart';

void main() async {
  await GetStorage.init();

  Get.put(AuthController());

  runApp(App());
}

class AppController extends GetxController {
  static AppController get to => Get.find();
  final name = 'app'.obs;
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
        builder: (_) => Loading(
              child: GetMaterialApp(
                theme: Themes.lightTheme,
                darkTheme: Themes.darkTheme,
                themeMode: ThemeMode.system,
                getPages: Routes.routes,
                defaultTransition: Transition.zoom,
                initialRoute: "/",
                debugShowCheckedModeBanner: false,
              ),
            ));
  }
}
