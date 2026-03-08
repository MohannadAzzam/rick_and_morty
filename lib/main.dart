import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'business_logic/theme_cubit/theme_cubit.dart';

import 'app_router.dart';
import 'constants/strings.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
  runApp(
    BlocProvider(
      create: (context) => ThemeCubit(),
      child: RickAndMorty(appRouter: AppRouter()),
    ),
  );
}

class RickAndMorty extends StatelessWidget {
  final AppRouter appRouter;

  const RickAndMorty({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, currentTheme) {
        return MaterialApp(
          title: 'Theme Switcher Bloc',
          theme: ThemeData(
            useMaterial3: true,
            appBarTheme: AppBarTheme(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blueGrey,
            ),
          ), // سمات الوضع الفاتح
          darkTheme: ThemeData.dark(), // سمات الوضع المظلم
          themeMode: currentTheme, // هذه هي القيمة التي تتغير من الـ Cubit

          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.generateRoute,
          initialRoute: charactersScreen,
        );
      },
    );
  }
}
