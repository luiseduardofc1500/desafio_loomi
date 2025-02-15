class PosterModel {
  final int id;
  final String name;
  final int width;
  final int height;
  final String url;

  PosterModel({
    required this.id,
    required this.name,
    required this.width,
    required this.height,
    required this.url,
  });

  factory PosterModel.fromJson(Map<String, dynamic> json) {
    final attributes = json['attributes'];
    return PosterModel(
      id: json['id'],
      name: attributes['name'],
      width: attributes['width'],
      height: attributes['height'],
      url: attributes['url'],
    );
  }
}
