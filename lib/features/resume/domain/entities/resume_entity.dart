import 'package:equatable/equatable.dart';

class ResumeEntity extends Equatable {
  final int? id;
  final String? resumeUrl;
  final String? createdAt;
  final String? updatedAt;
  const ResumeEntity({
    this.id,
    this.resumeUrl,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props =>
      [id, resumeUrl, createdAt, updatedAt];

  @override
  bool? get stringify => true;
}
