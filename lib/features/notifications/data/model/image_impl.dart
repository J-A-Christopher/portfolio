class StringImageGotten {
  StringImageGotten(
      {required this.createdAt,
      required this.id,
      required this.updatedAt,
      required this.imageUrl});
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final String? imageUrl;

  factory StringImageGotten.fromJson(Map<String, dynamic> json) {
    return StringImageGotten(
        createdAt: json['createdAt'],
        id: json['id'],
        updatedAt: json['updatedAt'],
        imageUrl: json['imageString']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      "createdAt":createdAt,
      "updatedAt": updatedAt,
      "imageUrl": imageUrl
    };
  }
}
