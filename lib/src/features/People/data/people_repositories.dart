import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:squadio/src/features/People/domain/person_detils_model.dart';
import 'package:squadio/src/features/People/domain/people_model.dart';
import 'package:squadio/src/features/People/domain/person_images_model.dart';

class PeopleRepositories {
  Future<PeopleModel?> getPeople(int page) async {
    var url = Uri.parse(
        "https://api.themoviedb.org/3/person/popular?api_key=ee5128bdcf71a895a1a38509fbf94784&language=en-US&page=$page");
    try {
      final response = await http.get(url);

      final PeopleModel result =
          PeopleModel.fromMap((jsonDecode(response.body)));

      return result;
    } catch (ex, st) {
      print(ex);
      print(st);
      return null;
    }
  }

  Future<PersonDetailModel?> getPrsonDetils(int personId) async {
    var url = Uri.parse(
        "https://api.themoviedb.org/3/person/$personId?api_key=ee5128bdcf71a895a1a38509fbf94784&language=en-US");
    try {
      final response = await http.get(url);

      final PersonDetailModel result =
          PersonDetailModel.fromMap((jsonDecode(response.body)));

      return result;
    } catch (ex, st) {
      print(ex);
      print(st);
      return null;
    }
  }

  Future<PersonImagesModel?> getPrsonImages(int personId) async {
    var url = Uri.parse(
        "https://api.themoviedb.org/3/person/$personId/images?api_key=ee5128bdcf71a895a1a38509fbf94784");
    try {
      final response = await http.get(url);

      final PersonImagesModel result =
          PersonImagesModel.fromMap((jsonDecode(response.body)));

      return result;
    } catch (ex, st) {
      print(ex);
      print(st);
      return null;
    }
  }
}
