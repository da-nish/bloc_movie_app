class NowPlayingTableFields {
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

class NowPlayingTableModel {
  final int? id;
  final int? number;
  final int? voteCount;
  final String title;
  final String content;
  final String image;
  final String rating;
  final bool isFavorite;
  final DateTime? createdTime;
  NowPlayingTableModel({
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

  factory NowPlayingTableModel.fromJson(Map<String, Object?> json) =>
      NowPlayingTableModel(
        id: json[NowPlayingTableFields.id] as int?,
        number: json[NowPlayingTableFields.number] as int?,
        title: json[NowPlayingTableFields.title] as String,
        content: json[NowPlayingTableFields.content] as String,
        image: json[NowPlayingTableFields.image] as String,
        rating: json[NowPlayingTableFields.rating] as String,
        voteCount: json[NowPlayingTableFields.voteCount] as int,
        isFavorite: json[NowPlayingTableFields.isFavorite] == 1,
        createdTime: DateTime.tryParse(
            json[NowPlayingTableFields.createdTime] as String? ?? ''),
      );

  Map<String, Object?> toJson() => {
        NowPlayingTableFields.id: id,
        NowPlayingTableFields.number: number,
        NowPlayingTableFields.title: title,
        NowPlayingTableFields.content: content,
        NowPlayingTableFields.image: image,
        NowPlayingTableFields.voteCount: voteCount,
        NowPlayingTableFields.rating: rating,
        NowPlayingTableFields.isFavorite: isFavorite ? 1 : 0,
        NowPlayingTableFields.createdTime: createdTime?.toIso8601String(),
      };

  NowPlayingTableModel copy({
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
      NowPlayingTableModel(
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
}
