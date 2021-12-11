class PhotoModel {
  const PhotoModel({
    required this.avgHexColor,
    required this.height,
    required this.source,
    required this.urlPhotoPage,
    required this.urlMediumSize,
    required this.urlLargeSize,
    required this.urlOriginalSize,
    required this.width,
  });

  final String urlPhotoPage;
  final String urlMediumSize;
  final String urlLargeSize;
  final String urlOriginalSize;
  final String source;
  final String avgHexColor;
  final double width;
  final double height;
}
