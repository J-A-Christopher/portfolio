import 'package:equatable/equatable.dart';

class BlogEntity extends Equatable {
  final int? id;
  final String? title;
  final String? blogDescription;
  final String? blogUrl;
  final String? createdAt;
  final String? updatedAt;
  const BlogEntity(
      {this.id,
      this.title,
      this.blogDescription,
      this.blogUrl,
      this.createdAt,
      this.updatedAt});

  @override
  List<Object?> get props =>
      [id, title, blogDescription, blogUrl, createdAt, updatedAt];

  @override
  bool? get stringify => true;
}
