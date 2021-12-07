import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_modular_app_video_image_api/app/shared/exports.dart';

import 'favorites_controller.dart';
import 'favorites_page.dart';

class FavoritesModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton(
          (i) => FavoritesController(i.get<AnimationsParametersI>()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const FavoritesPage()),
      ];
}
