import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_modular_app_video_image_api/app/shared/exports.dart';
import 'package:test_modular_app_video_image_api/app/modules/main/repository/exports.dart';

import 'images_controller.dart';
import 'images_future_page.dart';

// Temporary workaround, because the Bind.singleton ImagesController is creating more than 1 instance
// This instance is currently in use in: search_bar_text_field.dart and images_future_page.dart
final ImagesController imagesController = ImagesController(
  Modular.get<AnimationsParametersI>(),
  Modular.get<MediaRepositoryI>(),
);

class ImagesModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.instance(
          (i) => i.get<MediaRepositoryI>(),
        ),
        /*
        Bind.singleton(
          (i) => ImagesController(
            i.get<AnimationsParametersI>(),
            i.get<MediaRepositoryI>(),
          ),
        ),
        */
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const ImagesFuturePage(),
        ),
      ];
}
