import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/models/characters.dart';

class DetailsSliverappbar extends StatelessWidget {
  final Result character;

  const DetailsSliverappbar({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 400,
      pinned: true,
      stretch: true,
      // backgroundColor: Colors.blueGrey,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          character.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            // color: Colors.white,
          ),
        ),
        background: Hero(
          tag: character.id,
          child: ShaderMask(
            // إضافة تدرج أسود أسفل الصورة لجعل النص واضحاً
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black87],
              ).createShader(rect);
            },
            blendMode: BlendMode.darken,
            child: CachedNetworkImage(
              imageUrl: character.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}