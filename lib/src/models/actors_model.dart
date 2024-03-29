class Cast {
  List<Actor> actors = [];
  Cast.fromJsonList(List<dynamic> jsonList) {
    jsonList.forEach((jsonActor) {
      final actor = Actor.fromJsonMap(jsonActor);
      actors.add(actor);
    });
  }
}

class Actor {
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  int? castId;
  String? character;
  String? creditId;
  int? order;
  String? department;
  String? job;

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

  get uniqueId {
    return '$id-sapo';
  }

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

  String getActorPhoto() {
    return profilePath == null
        ? 'https://storage.contextoganadero.com/s3fs-public/agricultura/field_image/2016-03/chiguiro.jpg'
        : 'https://image.tmdb.org/t/p/w500/$profilePath';
  }
}
