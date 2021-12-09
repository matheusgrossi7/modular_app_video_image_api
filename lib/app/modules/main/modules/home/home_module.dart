import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_modular_app_video_image_api/app/modules/main/repository/exports.dart';
import 'package:test_modular_app_video_image_api/app/shared/exports.dart';

import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.instance(
          (i) => i.get<PixelsRepository>(),
        ),
        Bind.singleton(
          (i) => HomeController(
              i.get<AnimationsParametersI>(), i.get<MediaRepositoryI>()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const HomePage(),
        ),
      ];
}
