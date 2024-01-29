// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hyrule/controller/dao_controller.dart';

import 'package:hyrule/domain/models/entry.dart';
import 'package:hyrule/presenter/details.dart';

class EntryCard extends StatelessWidget {
  final Entry entry;
  final bool isSaved;

  EntryCard({
    Key? key,
    required this.entry,
    required this.isSaved,
  }) : super(key: key);

  final DaoController daoController = DaoController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Dismissible(
        key: ValueKey<int>(entry.id),
        direction: isSaved? DismissDirection.startToEnd : DismissDirection.none,
        onDismissed: (direction){
          daoController.deleteEntry(entry: entry);
        },
        child: Column(
          children: [
            InkWell(
              onTap: (){
                Navigator.push(
                  context,MaterialPageRoute(builder: (_) => Details(entry: entry)));
              },
              child: Ink(
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Image.network(entry.image)),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              entry.name.toUpperCase(),
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              entry.description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Wrap(
              children: entry.commonLocationsConverter().map(
                (e) => Chip(label: Text(e)),
              ).toList(),
            )
          ],
        ),
      ),
    );
  }
}
