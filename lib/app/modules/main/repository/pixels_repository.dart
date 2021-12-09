import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:test_modular_app_video_image_api/app/shared/exports.dart';

import 'media_repository_interface.dart';
import 'credentials.dart';
import '../models/exports.dart';

class PixelsRepository extends MediaRepositoryI {
  PhotosResponse? _loadedPhotos;

  @override
  Future<PhotosResponse> fetchImages({
    required String search,
    required int perPage,
    required int page,
    bool update = false,
  }) async {
    int? _responseHeight;
    int? _responseWidth;
    PhotosResponse? _photosResponse;
    List<dynamic> _jsonPhotos;
    http.Response _response;
    List<PhotoModel> _photos = [];
    if (_loadedPhotos == null || update == true) {
      final String _url = "https://api.pexels.com/v1/search?query=" +
          search +
          "&page=" +
          page.toString() +
          "&per_page=" +
          perPage.toString();
      try {
        _response = await http.get(
          Uri.parse(_url),
          headers: {
            HttpHeaders.authorizationHeader:
                HomeRepositoryCredentials.pixelsApiKey,
          },
        );
        if (_response.statusCode == 200) {
          _jsonPhotos = jsonDecode(_response.body)["photos"];
          for (var map in _jsonPhotos) {
            _responseHeight = map["height"]!;
            _responseWidth = map["width"]!;
            _photos.add(
              PhotoModel(
                avgHexColor: map["avg_color"]!,
                height: _responseHeight!.toDouble(),
                source: "pexels.com",
                url: map["src"]["medium"],
                width: _responseWidth!.toDouble(),
                urlPhotoPage: map["url"]!,
              ),
            );
          }
        }
      } on Exception {
        _response = http.Response("", 400);
      }
      _photosResponse = PhotosResponse(
        photos: _photos,
        responseStatusCode: _response.statusCode,
      );
      _loadedPhotos = _photosResponse;
    } else {
      _photosResponse = _loadedPhotos;
    }
    return Future.value(_photosResponse);
  }

  @override
  Future<List<T>> fetchVideos<T>({
    required String search,
    required int perPage,
    required int page,
    bool update = false,
  }) {
    // TODO: implement fetchVideos
    throw UnimplementedError();
  }
}
