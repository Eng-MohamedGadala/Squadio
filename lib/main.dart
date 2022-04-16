import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:squadio/src/features/root/presentation/root_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await FlutterDownloader.initialize(
  debug: true // optional: set false to disable printing logs to console
);
  initialization;
  runApp(const ProviderScope(child: MyApp()));
}

Future initialization(BuildContext? context) async {
  WidgetsBinding.instance?.addPostFrameCallback((_) {
    FlutterNativeSplash.remove();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: RootScreen(),
    );
  }
}
