import 'package:flutter/material.dart';
import 'package:rick_and_morty/app_router.dart';
import 'package:rick_and_morty/constants/strings.dart';

void main() {
  runApp(RickAndMorty(appRouter: AppRouter()));
}

class RickAndMorty extends StatelessWidget {
  final AppRouter appRouter;

  const RickAndMorty({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute  ,
      initialRoute: charactersScreen,
    );
  }
}
