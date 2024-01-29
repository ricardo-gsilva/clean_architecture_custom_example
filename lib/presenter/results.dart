import 'package:flutter/material.dart';
import 'package:hyrule/controller/api_controller.dart';
import 'package:hyrule/presenter/components/entry_card.dart';
import 'package:hyrule/presenter/favorites.dart';
import 'package:hyrule/utils/consts/categories.dart';

class Results extends StatelessWidget {
  final String category;

  Results({
    Key? key,
    required this.category,
  }) : super(key: key);

  final ApiController apiController = ApiController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(categories[category] ?? ''),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Favorites(),
                  ),
                );
              },
              icon: const Icon(Icons.favorite))
        ],
      ),
      body: FutureBuilder(
        future: apiController.getEntriesByCategory(category: category),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              break;
            case ConnectionState.none:
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                return ListView.builder(
                  itemBuilder: (context, index) =>
                      EntryCard(entry: snapshot.data![index], isSaved: false,),
                  itemCount: snapshot.data!.length,
                );
              }
              break;
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
          }
          return Container();
        },
      ),
    ));
  }
}
