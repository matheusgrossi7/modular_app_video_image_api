import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_modular_app_video_image_api/app/shared/animations/animations_parameters.dart';

import 'modules/main/main_molule.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => AnimationsParameters()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/',
          module: MainModule(),
        ),
      ];
}
