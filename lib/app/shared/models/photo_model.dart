class PhotoModel {
  const PhotoModel({
    required this.avgHexColor,
    required this.height,
    required this.source,
    required this.urlPhotoPage,
    required this.url,
    required this.width,
  });

  final String urlPhotoPage;
  final String url;
  final String source;
  final String avgHexColor;
  final double width;
  final double height;
}
