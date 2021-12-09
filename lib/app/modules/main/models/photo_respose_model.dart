import 'package:test_modular_app_video_image_api/app/shared/exports.dart';

class PhotosResponse {
  const PhotosResponse({
    required this.photos,
    required this.responseStatusCode,
  });
  final List<PhotoModel> photos;
  final int responseStatusCode;
}
