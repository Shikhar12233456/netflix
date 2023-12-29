class Movie {
  int id;
  String name;
  String type;
  String lang;
  List<dynamic> genres;
  String status;
  int? runtime;
  int? avgruntime;
  String? premiered;
  dynamic image;
  String summary;
  String? imdb;

  Movie(
      {required this.id,
      required this.name,
      required this.type,
      required this.lang,
      required this.genres,
      required this.status,
      required this.runtime,
      required this.avgruntime,
      required this.premiered,
      required this.image,
      required this.summary,
      required this.imdb});

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      lang: json['language'],
      genres: json['genres'],
      status: json['status'],
      runtime: json['runtime'],
      avgruntime: json['averageRuntime'],
      premiered: json['premiered'],
      image: json['image'],
      summary: json['summary'],
      imdb: json['externals']['imdb'] ?? '');
}
