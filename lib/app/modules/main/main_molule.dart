import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_modular_app_video_image_api/app/shared/exports.dart';

import 'main_controller.dart';
import 'main_page.dart';
import 'modules/favorites/favorites_module.dart';
import 'modules/home/home_module.dart';

class MainModule extends Module {
  static const String homePageRouteName = '/home/';
  static const String favoritesPageRouteName = '/favorites/';

  @override
  List<Bind> get binds => [
        Bind(
          (i) => MainController(i.get<AnimationsParametersI>()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const MainPage(),
          transition: TransitionType.noTransition,
          children: [
            ModuleRoute(
              homePageRouteName,
              module: HomeModule(),
            ),
            ModuleRoute(
              favoritesPageRouteName,
              module: FavoritesModule(),
            ),
          ],
        ),
      ];
}
