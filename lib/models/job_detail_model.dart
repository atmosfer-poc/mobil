import 'dart:convert';

class JobDetailModel {
  int id;
  String content;
  String image;
  JobDetailModel({
    required this.id,
    required this.content,
    required this.image,
  });

  JobDetailModel copyWith({
    int? id,
    String? content,
    String? image,
  }) {
    return JobDetailModel(
      id: id ?? this.id,
      content: content ?? this.content,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'content': content});
    result.addAll({'image': image});

    return result;
  }

  factory JobDetailModel.fromMap(Map<String, dynamic> map) {
    return JobDetailModel(
      id: map['id']?.toInt() ?? 0,
      content: map['content'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory JobDetailModel.fromJson(String source) => JobDetailModel.fromMap(json.decode(source));

  @override
  String toString() => 'JobDetailModel(id: $id, content: $content, image: $image)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is JobDetailModel && other.id == id && other.content == content && other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ content.hashCode ^ image.hashCode;
}
