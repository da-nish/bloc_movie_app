import 'package:wework_app/app/core/local_db/table/top_rated_table.dart';

class TopRatedModel {
  final int? page;
  final List<TopRatedResult>? results;
  final int? totalPages;
  final int? totalResults;

  TopRatedModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  TopRatedModel copyWith({
    int? page,
    List<TopRatedResult>? results,
    int? totalPages,
    int? totalResults,
  }) =>
      TopRatedModel(
        page: page ?? this.page,
        results: results ?? this.results,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );

  factory TopRatedModel.fromJson(Map<String, dynamic> json) => TopRatedModel(
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<TopRatedResult>.from(
                json["results"]!.map((x) => TopRatedResult.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

class TopRatedResult {
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final DateTime? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  TopRatedResult({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory TopRatedResult.fromJson(Map<String, dynamic> json) => TopRatedResult(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"]!.map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

  TopRatedTableModel toTableModel() => TopRatedTableModel(
      title: originalTitle ?? "",
      content: overview ?? "",
      image: posterPath ?? "",
      rating: (voteAverage ?? "").toString(),
      voteCount: voteCount,
      isFavorite: false,
      number: id,
      createdTime: DateTime.now());
}
