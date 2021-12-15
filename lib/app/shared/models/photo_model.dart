class PhotoModel {
  const PhotoModel({
    required this.source,
    required this.urlPhotoPage,
    required this.urlMediumSize,
    required this.urlLargeSize,
    required this.urlOriginalSize,
    required this.width,
    required this.height,
    required this.avgColor,
  });
  final String source;
  final String urlPhotoPage;
  final String urlMediumSize;
  final String urlLargeSize;
  final String urlOriginalSize;
  final double width;
  final double height;
  final int avgColor;
}
