import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:squadio/src/features/People/presentation/people_screen.dart';
import 'package:squadio/src/features/download/presentation/download_screen.dart';

final rootProvider = ChangeNotifierProvider((ref) {
  return RootState();
});
class RootState extends ChangeNotifier {
  RootState() : super();
 List pages = [const PeopleScreen(), const DownloadScreen()];
  int index = 0;
 
  void navigationTapped(int page) {
    // print(page);
    if (page == index) {
      return;
    } else {
       index = page;
       notifyListeners();
       
    }
  }
}
