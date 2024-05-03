import 'package:wework_app/app/network/dto/top_rated_model.dart';

class TopRatedTableFields {
  static const String tableName = 'notesss';
  static const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
  static const String textType = 'TEXT NOT NULL';
  static const String intType = 'INTEGER NOT NULL';
  static const String id = '_id';
  static const String title = 'title';
  static const String number = 'number';
  static const String content = 'content';
  static const String image = 'image';
  static const String voteCount = 'vote_count';
  static const String rating = 'rating';
  static const String isFavorite = 'is_favorite';
  static const String createdTime = 'created_time';
}

class TopRatedTableModel {
  final int? id;
  final int? number;
  final int? voteCount;
  final String title;
  final String content;
  final String image;
  final String rating;
  final bool isFavorite;
  final DateTime? createdTime;
  TopRatedTableModel({
    this.id,
    this.number,
    required this.voteCount,
    required this.title,
    required this.content,
    required this.image,
    required this.rating,
    this.isFavorite = false,
    this.createdTime,
  });

  factory TopRatedTableModel.fromJson(Map<String, Object?> json) =>
      TopRatedTableModel(
        id: json[TopRatedTableFields.id] as int?,
        number: json[TopRatedTableFields.number] as int?,
        title: json[TopRatedTableFields.title] as String,
        content: json[TopRatedTableFields.content] as String,
        image: json[TopRatedTableFields.image] as String,
        rating: json[TopRatedTableFields.rating] as String,
        voteCount: json[TopRatedTableFields.voteCount] as int,
        isFavorite: json[TopRatedTableFields.isFavorite] == 1,
        createdTime: DateTime.tryParse(
            json[TopRatedTableFields.createdTime] as String? ?? ''),
      );

  Map<String, Object?> toJson() => {
        TopRatedTableFields.id: id,
        TopRatedTableFields.number: number,
        TopRatedTableFields.title: title,
        TopRatedTableFields.content: content,
        TopRatedTableFields.image: image,
        TopRatedTableFields.voteCount: voteCount,
        TopRatedTableFields.rating: rating,
        TopRatedTableFields.isFavorite: isFavorite ? 1 : 0,
        TopRatedTableFields.createdTime: createdTime?.toIso8601String(),
      };

  TopRatedTableModel copy({
    int? id,
    int? number,
    String? title,
    String? content,
    String? image,
    String? rating,
    int? voteCount,
    bool? isFavorite,
    DateTime? createdTime,
  }) =>
      TopRatedTableModel(
        id: id ?? this.id,
        number: number ?? this.number,
        title: title ?? this.title,
        content: content ?? this.content,
        image: image ?? this.image,
        rating: rating ?? this.rating,
        voteCount: voteCount ?? this.voteCount,
        isFavorite: isFavorite ?? this.isFavorite,
        createdTime: createdTime ?? this.createdTime,
      );

  // title: originalTitle ?? "",
  // content: overview ?? "",
  // image: posterPath ?? "",
  // rating: (voteAverage ?? "").toString(),
  // voteCount: voteCount,
  // isFavorite: false,
  // number: id,
  // createdTime: DateTime.now(),
  // );
}
