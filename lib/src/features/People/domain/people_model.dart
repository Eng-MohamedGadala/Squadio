
import 'dart:convert';

class PeopleModel {
    PeopleModel({
        this.page,
        this.results,
        this.totalPages,
        this.totalResults,
    });

    final int? page;
    final List<Result>? results;
    final int? totalPages;
    final int? totalResults;

    factory PeopleModel.fromJson(String str) => PeopleModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PeopleModel.fromMap(Map<String, dynamic> json) => PeopleModel(
        page: json["page"],
        results: json["results"] == null ? null : List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toMap() => {
        "page": page,
        "results": results == null ? null : List<dynamic>.from(results!.map((x) => x.toMap())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

class Result {
    Result({
        this.adult,
        this.gender,
        this.id,
        this.knownForDepartment,
        this.name,
        this.popularity,
        this.profilePath,
    });

    final bool ? adult;
    final int ? gender;
    final int ? id;
    final String ? knownForDepartment;
    final String ? name;
    final double ? popularity;
    final String ? profilePath;

    factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Result.fromMap(Map<String, dynamic> json) => Result(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        popularity: json["popularity"] == null ? null : json["popularity"].toDouble(),
        profilePath: json["profile_path"],
    );

    Map<String, dynamic> toMap() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for_department": knownForDepartment,
        "name": name,
        "popularity": popularity,
        "profile_path": profilePath,
    };
}
