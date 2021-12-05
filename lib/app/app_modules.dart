import 'package:flutter_modular/flutter_modular.dart';

import 'modules/main/main_molule.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: MainModule()),
      ];
}
