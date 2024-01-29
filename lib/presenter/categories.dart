import 'package:flutter/material.dart';
import 'package:hyrule/presenter/components/category.dart';
import 'package:hyrule/presenter/favorites.dart';
import 'package:hyrule/utils/consts/categories.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(chooseCategory),
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
      body: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16),
          children: categories.keys.map((e) => Category(category: e)).toList()),
    ));
  }
}
