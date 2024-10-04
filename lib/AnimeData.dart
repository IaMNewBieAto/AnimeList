class AnimeData {
  String? title;
  String? year;
  String? description;
  List<String>? genres;
  String? director;
  double? rating;
  String? imageurl;

  AnimeData(
      {this.title,
      this.year,
      this.description,
      this.genres,
      this.director,
      this.rating,
      this.imageurl});

  AnimeData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    year = json['year'];
    description = json['description'];
    genres = (json['genres'] as List<dynamic>).cast<String>();
    director = json['director'];
    rating = json['rating'];
    imageurl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['year'] = year;
    data['description'] = description;
    data['genres'] = genres;
    data['director'] = director;
    data['rating'] = rating;
    data['image_url'] = imageurl;
    return data;
  }
}
