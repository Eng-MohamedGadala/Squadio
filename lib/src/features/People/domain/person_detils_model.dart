
import 'dart:convert';

class PersonDetailModel {
  PersonDetailModel({
    this.adult,
    this.alsoKnownAs,
    this.biography,
    this.birthday,
    this.deathday,
    this.gender,
    this.homepage,
    this.id,
    this.imdbId,
    this.knownForDepartment,
    this.name,
    this.placeOfBirth,
    this.popularity,
    this.profilePath,
  });

  final bool? adult;
  final List<String>? alsoKnownAs;
  final String? biography;
  final String? birthday;
  final String? deathday;
  final int? gender;
  final dynamic? homepage;
  final int? id;
  final String? imdbId;
  final String? knownForDepartment;
  final String? name;
  final String? placeOfBirth;
  final double? popularity;
  final String? profilePath;

  factory PersonDetailModel.fromJson(String str) =>
      PersonDetailModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PersonDetailModel.fromMap(Map<String, dynamic> json) =>
      PersonDetailModel(
        adult: json["adult"],
        alsoKnownAs: json["also_known_as"] == null
            ? null
            : List<String>.from(json["also_known_as"].map((x) => x)),
        biography: json["biography"],
        birthday:
            json["birthday"],
        deathday:
            json["deathday"] ,
        gender: json["gender"],
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        placeOfBirth: json["place_of_birth"],
        popularity:
            json["popularity"] == null ? null : json["popularity"].toDouble(),
        profilePath: json["profile_path"],
      );

  Map<String, dynamic> toMap() => {
        "adult": adult,
        "also_known_as": alsoKnownAs == null
            ? null
            : List<dynamic>.from(alsoKnownAs!.map((x) => x)),
        "biography": biography,
        "birthday": birthday,
        "deathday": deathday,
        "gender": gender,
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "known_for_department": knownForDepartment,
        "name": name,
        "place_of_birth": placeOfBirth,
        "popularity": popularity,
        "profile_path": profilePath,
      };
}
