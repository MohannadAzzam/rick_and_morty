import 'package:flutter/material.dart';
import 'package:rick_and_morty/constants/my_colors.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: const Text('Characters'),
      ),
      body: const Center(
        child: Text(
          'Characters Screen',
          style: TextStyle(
            color: MyColors.myWhite,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
