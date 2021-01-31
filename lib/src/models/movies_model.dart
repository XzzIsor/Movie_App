class Movies {
  List<Movie> movies = new List();

  Movies.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final movie = new Movie.fromJsonMap(item);
      movies.add(movie);
    }
  } 
}

class Movie {

  String uniqueId;
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  Movie({
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

  Movie.fromJsonMap(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    adult = json['adult'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'] / 1;
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'] / 1;
    voteCount = json['vote_count'];
  }

  String getPosterImage() {
    return posterPath == null
        ? "https://st.depositphotos.com/1730367/3477/i/600/depositphotos_34771537-stock-photo-dead-rat.jpg"
        : 
        'https://image.tmdb.org/t/p/w500/$posterPath';
  }

  String getBackGroundImage() {
    return posterPath == null
        ? "https://st.depositphotos.com/1730367/3477/i/600/depositphotos_34771537-stock-photo-dead-rat.jpg"
        : 
        'https://image.tmdb.org/t/p/w500/$backdropPath';
  }  
}
