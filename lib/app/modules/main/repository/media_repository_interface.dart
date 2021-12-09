import '../models/exports.dart';

abstract class MediaRepositoryI {
  Future<PhotosResponse> fetchImages({
    required String search,
    required int perPage,
    required int page,
    bool update = false,
  });

  Future<List<T>> fetchVideos<T>({
    required String search,
    required int perPage,
    required int page,
    bool update = false,
  });
}
