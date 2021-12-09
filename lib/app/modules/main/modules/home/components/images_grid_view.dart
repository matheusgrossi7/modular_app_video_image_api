import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_modular_app_video_image_api/app/modules/main/models/exports.dart';
import 'package:test_modular_app_video_image_api/app/shared/exports.dart';

import '../home_controller.dart';

class ImagesGridView extends StatefulWidget {
  const ImagesGridView({
    Key? key,
  }) : super(key: key);

  @override
  State<ImagesGridView> createState() => _ImagesGridViewState();
}

class _ImagesGridViewState
    extends ModularState<ImagesGridView, HomeController> {
  Future<PhotosResponse>? _futurePhotosResponse;

  @override
  void initState() {
    super.initState();
    _futurePhotosResponse = controller.photos;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futurePhotosResponse,
      builder: (BuildContext context, AsyncSnapshot<PhotosResponse> snapshot) {
        Widget? _widget;
        if (snapshot.hasData) {
          PhotosResponse _photosResponse = snapshot.data!;
          List<PhotoModel> _photos = _photosResponse.photos;
          _widget = GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _photos.length,
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (BuildContext context, int index) => ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  _photos[index].url,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        } else {
          _widget = const Center(
            child: Text("No data"),
          );
        }
        return _widget;
      },
    );
  }
}
