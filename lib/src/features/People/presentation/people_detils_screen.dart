import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:squadio/src/features/People/application/people_provider.dart';
import 'package:squadio/src/features/People/domain/person_detils_model.dart';
import 'package:squadio/src/features/People/presentation/full_size_image_screen.dart';

class PeopleDetils extends ConsumerWidget {
  const PeopleDetils({Key? key, required}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final people = ref.watch(peopleProvider);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 350.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("${people.personDetails?.name}"),
              background: people.personDetails!.profilePath != null
                  ? Image.network(
                      '${people.basImageUrl}${people.personDetails?.profilePath}',
                      fit: BoxFit.cover,
                    )
                  : const FlutterLogo(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Basic information:",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "${people.personDetails?.biography}",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  Row(
                    children: [
                      const Text(
                        "Birthday:",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "${people.personDetails?.birthday}",
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Place of Birth:",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "${people.personDetails?.placeOfBirth}",
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const Text(
                    "Images:",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,

            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  FullSizeImageScreen(filePath:'${people.basImageUrl}${people.personImages?.profiles?[index].filePath}' ,)),
                  ),
                  child: Container(
                    child: people.personImages?.profiles != null
                        ? Image.network(
                            '${people.basImageUrl}${people.personImages?.profiles?[index].filePath}',
                            fit: BoxFit.cover,
                          )
                        : const FlutterLogo(),
                  ),
                );
              },
              childCount: people.personImages?.profiles?.length,
            ),
          )
        ],
      ),
    );
  }
}
