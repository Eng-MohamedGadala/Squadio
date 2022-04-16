import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:squadio/src/features/root/aplication/root_provider.dart';

class RootScreen extends ConsumerWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final rootState = ref.watch(rootProvider);

    return 
    Scaffold(
      body: rootState.pages[rootState.index],
      bottomNavigationBar: BottomNavigationBar(
        items:const [
           BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "People",
          ),
           BottomNavigationBarItem(
            icon:  Icon(Icons.download),
            label: "Download",
          ),
          
        ],
        onTap: rootState.navigationTapped,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: const Color(0xff797979),
        fixedColor: const Color.fromARGB(255, 219, 61, 0),
        backgroundColor: const Color(0xffe2e2e2),
        currentIndex: rootState.index,
        showUnselectedLabels: true,
      ),
      
    );
  }
}
