import 'package:flutter_modular/flutter_modular.dart';

import 'shared/exports.dart';
import 'modules/main/main_molule.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory(
          (i) => FadeThroughAnimationParameters(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/',
          module: MainModule(),
        ),
      ];
}
