class Movie {
  final int id;
  final String name;
  final String type;
  final int? year;
  final String? imdbId;
  final int tmdbId;
  final String tmdbType;
  final String? description;
  final String? poster;
  final String? trailer;
  final double? userScore;
  final double? criticScore;
  final String? genres;
  final DateTime? releaseDate;
  String? imageUrl;

  Movie({
    required this.id,
    required this.name,
    required this.type,
    this.year,
    this.imdbId,
    required this.tmdbId,
    required this.tmdbType,
    this.description,
    this.poster,
    this.trailer,
    this.userScore,
    this.criticScore,
    this.genres,
    this.releaseDate,
    this.imageUrl,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      year: json['year'],
      imdbId: json['imdb_id'],
      tmdbId: json['tmdb_id'],
      tmdbType: json['tmdb_type'] ?? '',
      description: json['description'],
      poster: json['poster'],
      trailer: json['trailer'],
      userScore: json['user_score']?.toDouble(),
      criticScore: json['critic_score']?.toDouble(),
      genres: json['genres']?.join(', '),
      releaseDate: json['release_date'] != null
          ? DateTime.parse(json['release_date'])
          : null,
      imageUrl: json['poster'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'year': year,
      'imdb_id': imdbId,
      'tmdb_id': tmdbId,
      'tmdb_type': tmdbType,
      'description': description,
      'poster': poster,
      'trailer': trailer,
      'user_score': userScore,
      'critic_score': criticScore,
      'genres': genres,
      'release_date': releaseDate?.toIso8601String(),
      'imageUrl': imageUrl,
    };
  }

  void setImageUrl(String url) {
    imageUrl = url;
  }
}
