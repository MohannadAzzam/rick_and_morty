import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/models/characters.dart';
// استورد الموديل الخاص بك هنا

class CharacterDetailsScreen extends StatelessWidget {
  final Result character; // يفضل استخدام النوع Result بدلاً من dynamic

  const CharacterDetailsScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(character.name)),
      body: Column(
        children: [
          Hero(
            tag: character.id, // حركة Hero Animation جميلة
            child: CachedNetworkImage(imageUrl: character.image, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Status: ${character.status.name}", style: const TextStyle(fontSize: 18)),
                Text("Species: ${character.species.name}", style: const TextStyle(fontSize: 18)),
                Text("Gender: ${character.gender.name}", style: const TextStyle(fontSize: 18)),
                Text("Origin: ${character.origin.name}", style: const TextStyle(fontSize: 18)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}