class Cast {
  List<Actor> _actors = new List();

  Cast.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    jsonList.forEach((jsonActor) {
      final actor  = Actor.fromJsonMap(jsonActor); 
      _actors.add(actor);
    });
  }
}

class Actor {
  bool adult;
  int gender;
  int id;
  String knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String profilePath;
  int castId;
  String character;
  String creditId;
  int order;
  String department;
  String job;

  Actor({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
    this.department,
    this.job,
  });

  Actor.fromJsonMap(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    order = json['order'];
    department = json['department'];
    job = json['job'];
  }

  String getPosterImage() {
    return profilePath == null
        ? "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.rcnradio.com%2Fclicks%2Fautoridad-ambiental-advierte-esta-prohibida-la-venta-carne-chiguiro&psig=AOvVaw3dnD0o861vWhI-QRo0rZAw&ust=1611979333997000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKDPko-hwO4CFQAAAAAdAAAAABAd"
        : 'https://image.tmdb.org/t/p/w500/$profilePath';
  }
}
