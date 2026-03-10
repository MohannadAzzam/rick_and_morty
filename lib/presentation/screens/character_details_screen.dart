import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/widgets/details_build_info_card.dart';
import 'package:rick_and_morty/presentation/widgets/details_sliverAppBar.dart';
import '../../data/models/characters.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Result character;
  const CharacterDetailsScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // استخدمنا CustomScrollView لتأثير الـ Parallax الجميل
      body: CustomScrollView(
        slivers: [
          DetailsSliverappbar(character: character,),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildInfoCard(
                      "Status",
                      character.status.name,
                      Icons.favorite,
                      Colors.green,
                    ),
                    buildInfoCard(
                      "Species",
                      character.species.name,
                      Icons.category,
                      Colors.orange,
                    ),
                    buildInfoCard(
                      "Gender",
                      character.gender.name,
                      Icons.person,
                      Colors.blue,
                    ),
                    buildInfoCard(
                      "Origin",
                      character.origin.name,
                      Icons.public,
                      Colors.purple,
                    ),
                    const SizedBox(height: 500), // فقط لتجربة السكرول
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
    }
}
