import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:test_modular_app_video_image_api/app/shared/exports.dart';

import 'media_repository_interface.dart';
import 'credentials.dart';
import '../models/exports.dart';

class PexelsRepository extends MediaRepositoryI {
  PhotosResponse? _loadedPhotosResponse;

  @override
  Future<PhotosResponse> fetchImages({
    String? search,
    required int perPage,
    required int page,
  }) async {
    int? _responseImageHeight;
    int? _responseImageWidth;
    String? _responseImageAvgHexColor;
    PhotosResponse? _photosResponse;
    List<dynamic> _jsonPhotos;
    String? _url;
    http.Response _httpResponse;
    List<PhotoModel> _photos = [];
    if (_loadedPhotosResponse == null || search != null) {
      if (search == null) {
        _url = "https://api.pexels.com/v1/curated?page=" +
            page.toString() +
            "&per_page=" +
            perPage.toString();
      } else {
        _url = "https://api.pexels.com/v1/search?query=" +
            search +
            "&page=" +
            page.toString() +
            "&per_page=" +
            perPage.toString();
      }
      try {
        _httpResponse = await http.get(
          Uri.parse(_url),
          headers: {
            HttpHeaders.authorizationHeader:
                HomeRepositoryCredentials.pixelsApiKey,
          },
        );
        if (_httpResponse.statusCode == 200) {
          _jsonPhotos = jsonDecode(_httpResponse.body)["photos"];
          for (var map in _jsonPhotos) {
            _responseImageHeight = map["height"]!;
            _responseImageWidth = map["width"]!;
            _responseImageAvgHexColor = map["avg_color"]!;
            _photos.add(
              PhotoModel(
                avgHexColor: int.parse(
                  "0xFF" + _responseImageAvgHexColor!.substring(1),
                ),
                height: _responseImageHeight!.toDouble(),
                source: "pexels.com",
                urlMediumSize: map["src"]["medium"],
                urlOriginalSize: map["src"]["original"],
                urlLargeSize: map["src"]["large"],
                width: _responseImageWidth!.toDouble(),
                urlPhotoPage: map["url"]!,
              ),
            );
          }
        }
      } on Exception {
        _httpResponse = http.Response("", 400);
      }
      _photosResponse = PhotosResponse(
        photos: _photos,
        responseStatusCode: _httpResponse.statusCode,
      );
      _loadedPhotosResponse = _photosResponse;
    } else {
      _photosResponse = _loadedPhotosResponse;
    }
    return Future.value(_photosResponse);
  }

  @override
  Future<List<T>> fetchVideos<T>({
    String? search,
    required int perPage,
    required int page,
  }) {
    // TODO: implement fetchVideos
    throw UnimplementedError();
  }
}
