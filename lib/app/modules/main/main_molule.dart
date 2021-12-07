import 'package:flutter_modular/flutter_modular.dart';

import 'main_controller.dart';
import 'main_page.dart';
import 'modules/favorites/favorites_module.dart';
import 'modules/home/home_module.dart';

class MainModule extends Module {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => MainController(),
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
              '/home/',
              module: HomeModule(),
            ),
            ModuleRoute(
              '/favorites/',
              module: FavoritesModule(),
            ),
          ],
        ),
      ];
}
