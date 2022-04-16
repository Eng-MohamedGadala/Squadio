
import 'dart:convert';

class PersonImagesModel {
    PersonImagesModel({
        this.id,
        this.profiles,
    });

    final int? id;
    final List<Profile>? profiles;

    factory PersonImagesModel.fromJson(String str) => PersonImagesModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PersonImagesModel.fromMap(Map<String, dynamic> json) => PersonImagesModel(
        id: json["id"],
        profiles: json["profiles"] == null ? null : List<Profile>.from(json["profiles"].map((x) => Profile.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "profiles": profiles == null ? null : List<dynamic>.from(profiles!.map((x) => x.toMap())),
    };
}

class Profile {
    Profile({
        this.aspectRatio,
        this.height,
        this.iso6391,
        this.filePath,
        this.voteAverage,
        this.voteCount,
        this.width,
    });

    final double? aspectRatio;
    final int? height;
    final dynamic iso6391;
    final String? filePath;
    final double? voteAverage;
    final int? voteCount;
    final int? width;

    factory Profile.fromJson(String str) => Profile.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Profile.fromMap(Map<String, dynamic> json) => Profile(
        aspectRatio: json["aspect_ratio"] == null ? null : json["aspect_ratio"].toDouble(),
        height: json["height"],
        iso6391: json["iso_639_1"],
        filePath: json["file_path"],
        voteAverage: json["vote_average"] == null ? null : json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
        width: json["width"],
    );

    Map<String, dynamic> toMap() => {
        "aspect_ratio": aspectRatio,
        "height": height,
        "iso_639_1": iso6391,
        "file_path": filePath,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "width": width,
    };
}
