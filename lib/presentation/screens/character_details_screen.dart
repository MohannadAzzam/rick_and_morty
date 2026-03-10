import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
          _buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoCard(
                      "Status",
                      character.status.name,
                      Icons.favorite,
                      Colors.green,
                    ),
                    _buildInfoCard(
                      "Species",
                      character.species.name,
                      Icons.category,
                      Colors.orange,
                    ),
                    _buildInfoCard(
                      "Gender",
                      character.gender.name,
                      Icons.person,
                      Colors.blue,
                    ),
                    _buildInfoCard(
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

  // الـ AppBar الذي يحتوي على الصورة ويتمدد
  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 400,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.blueGrey,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          character.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
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

  // ويدجت مخصصة لعرض المعلومات بشكل أنيق داخل كارد
  Widget _buildInfoCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.2),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
