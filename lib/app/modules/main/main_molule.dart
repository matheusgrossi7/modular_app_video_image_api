import 'package:flutter_modular/flutter_modular.dart';

import 'home/home_module.dart';
import 'favorites/favorites_module.dart';
import 'main_controller.dart';
import 'main_page.dart';

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
          children: [
            ModuleRoute(
              '/home',
              module: HomeModule(),
              transition: TransitionType.noTransition,
            ),
            ModuleRoute(
              '/favorites',
              module: FavoritesModule(),
              transition: TransitionType.noTransition,
            ),
          ],
        ),
      ];
}
