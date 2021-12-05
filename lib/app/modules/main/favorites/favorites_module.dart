import 'package:flutter_modular/flutter_modular.dart';

import 'favorites_page.dart';

class FavoritesModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const FavoritesPage()),
      ];
}
