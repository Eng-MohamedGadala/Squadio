import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:squadio/src/features/People/application/people_provider.dart';
import 'package:squadio/src/features/People/domain/people_model.dart';
import 'package:squadio/src/features/People/presentation/people_detils_screen.dart';

class PeopleScreen extends ConsumerWidget {
  const PeopleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final people = ref.watch(peopleProvider);
    return Scaffold(
        appBar: AppBar(title: Text('People')),
        body: PagedListView<int, Result>(
          pagingController: people.pagingController,
          builderDelegate: PagedChildBuilderDelegate<Result>(
            itemBuilder: (context, item, index) => Card(
              child: ListTile(
                onTap: () => people.loadPersonDedils(item.id??0,context),
                leading: item.profilePath != null
                    ? Image.network(
                        '${people.basImageUrl}${item.profilePath}',
                        fit: BoxFit.cover,
                        width: 70,
                        // height: 100,
                      )
                    : const FlutterLogo(
                        size: 45,
                      ),
                title: Text(
                  '${item.name}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.gender == 1 ? 'Female' : 'Male'),
                      Text("${item.popularity}"),
                    ]),
                trailing: const Icon(Icons.double_arrow),
                isThreeLine: true,
              ),
            ),
          ),
        ));
  }
}
