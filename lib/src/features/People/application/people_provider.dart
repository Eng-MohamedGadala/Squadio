import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:squadio/src/features/People/data/people_repositories.dart';
import 'package:squadio/src/features/People/domain/people_model.dart';
import 'package:squadio/src/features/People/domain/person_detils_model.dart';
import 'package:squadio/src/features/People/domain/person_images_model.dart';
import 'package:squadio/src/features/People/presentation/people_detils_screen.dart';

final peopleProvider = ChangeNotifierProvider((ref) {
  return PeopleProvider();
});

class PeopleProvider extends ChangeNotifier {
  final PagingController<int, Result> pagingController =
      PagingController(firstPageKey: 1);
  int pageIndex = 1;
  List<Result> peopleList = [];
  int _sellectedPersonId = 0;
  PersonDetailModel? personDetails;
  PersonImagesModel? personImages;
  int get sellectedPersonId => _sellectedPersonId;

  set sellectedPersonId(int sellectedPersonId) {
    _sellectedPersonId = sellectedPersonId;
  }

  PeopleProvider() : super() {
    pagingController.addPageRequestListener((pageKey) {
      loadPeoples(pageKey);
    });
  }
  String basImageUrl = "https://image.tmdb.org/t/p/original";
  PeopleRepositories peopleRepositories = PeopleRepositories();

  Future<void> loadPeoples(int page) async {
    PeopleModel? peopleRespons = await peopleRepositories.getPeople(page);
    peopleList = peopleRespons?.results ?? [];

    final isLastPage = peopleRespons?.page == peopleRespons?.totalPages;
    if (isLastPage) {
      pagingController.appendLastPage(peopleList);
    } else {
      final nextPageKey = peopleRespons!.page! + 1;
      pagingController.appendPage(peopleList, nextPageKey);
    }
  }

  Future<void> loadPersonDedils(int personId, BuildContext context) async {
    personDetails = await peopleRepositories.getPrsonDetils(personId);
    personImages = await peopleRepositories.getPrsonImages(personId);
    if (personDetails != null && personImages != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PeopleDetils()),
      );
    }
  }

  Future<void> downloadImage(String url) async {
    final taskId = await FlutterDownloader.enqueue(
      url: url,
      savedDir: 'the path of directory where you want to save downloaded files',
      showNotification:
          true, // show download progress in status bar (for Android)
      openFileFromNotification:
          true, // click on notification to open downloaded file (for Android)
    );
  }
}
