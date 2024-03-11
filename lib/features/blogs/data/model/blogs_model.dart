import 'package:equatable/equatable.dart';
import 'package:portfolio/features/blogs/domain/entities/blog_entity.dart';

class BlogsModel extends BlogEntity with EquatableMixin {
  BlogsModel(
      {this.blogDescription,
      this.blogUrl,
      this.createdAt,
      this.id,
      this.title,
      this.updatedAt});
  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? blogDescription;
  @override
  final String? blogUrl;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  factory BlogsModel.fromJson(Map<String, dynamic> json) {
    return BlogsModel(
      id: json['id'],
      title: json['title'],
      blogDescription: json['blogDescription'],
      blogUrl: json['blogUrl'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      "title": title,
      "blogDescription": blogDescription,
      'blogUrl': blogUrl,
      "createdAt": createdAt,
      "updatedAt": updatedAt
    };
  }

  // BlogsModel copyWith({
  //   int? id,
  //   String? title,
  // }) {
  //   return BlogsModel(
  //       blogDescription: blogDescription,
  //       blogUrl: blogUrl,
  //       createdAt: createdAt,
  //       id: id ?? this.id,
  //       title: title ?? this.title,
  //       updatedAt: updatedAt);
  // }

  @override
  List<Object?> get props =>
      [id, title, blogDescription, blogUrl, createdAt, updatedAt];

  @override
  bool? get stringify => true;
}
