import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:hyrule/controller/dao_controller.dart';
import 'package:hyrule/domain/models/entry.dart';
import 'package:hyrule/utils/consts/details.dart';

class Details extends StatelessWidget {
  Details({super.key, required this.entry});
  final Entry entry;

  final DaoController daoController = DaoController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(details),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              entry.name.toUpperCase(),
              style: const TextStyle(fontSize: 18),
            ),
            Wrap(
              children: entry
                  .commonLocationsConverter()
                  .map((e) => Chip(label: Text(e)))
                  .toList(),
            ),
            Image.network(entry.image),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(entry.description),              
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          daoController.saveEntry(entry: entry);
          showToast(saveItens,
            context: context,
            animation: StyledToastAnimation.scale,
          );
        },
        child: const Icon(Icons.save),
      ),
    ));
  }
}
