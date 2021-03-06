import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_modular_app_video_image_api/app/shared/exports.dart';

import 'main_controller.dart';
import 'main_page.dart';
import 'modules/favorites/favorites_module.dart';
import 'modules/images/images_module.dart';
import 'repository/exports.dart';

class MainModule extends Module {
  static const String imagesModuleRouteName = '/images/';
  static const String favoritesModuleRouteName = '/favorites/';

  @override
  List<Bind> get binds => [
        Bind.singleton(
          (i) => PexelsRepository(),
        ),
        Bind.singleton(
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
              imagesModuleRouteName,
              module: ImagesModule(),
            ),
            ModuleRoute(
              favoritesModuleRouteName,
              module: FavoritesModule(),
            ),
          ],
        ),
      ];
}
