import '../models/exports.dart';

abstract class MediaRepositoryI {
  Future<PhotosResponse> fetchImages({
    String? search,
    required int perPage,
    required int page,
  });

  Future<List<T>> fetchVideos<T>({
    String? search,
    required int perPage,
    required int page,
  });
}
