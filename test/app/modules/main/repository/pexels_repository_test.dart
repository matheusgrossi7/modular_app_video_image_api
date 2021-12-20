import 'package:flutter_test/flutter_test.dart';
import 'package:test_modular_app_video_image_api/app/modules/main/models/exports.dart';
import 'package:test_modular_app_video_image_api/app/modules/main/repository/exports.dart';

main() {
  test("Pexels repository | Fetch images (initial search)", () async {
    PhotosResponse response =
        await PexelsRepository().fetchImages(perPage: 1, page: 1);
    expect(200, response.statusCode);
    expect(1, response.photos.length);
  });
}
