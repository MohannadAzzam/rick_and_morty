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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, currentTheme) {
        return MaterialApp(
          title: 'Rick and morty',
          theme: ThemeData(
            brightness: Brightness.light,
            useMaterial3: true,
            primaryColor: const Color(0xFF208D45),
            scaffoldBackgroundColor: const Color(0xFFF0F2F5),
            cardTheme: CardThemeData(color: Colors.white, elevation: 0),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              foregroundColor: Color(0xFF24282F), // لون الأيقونات والنص
              elevation: 0,
            ),
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Color(0xFF24282F)),
              bodyMedium: TextStyle(color: Color(0xFF6E767E)),
            ),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: const Color(0xFF97ce4c), // أخضر البوابة
            scaffoldBackgroundColor: const Color(0xFF24282f), // الرمادي الرسمي
            cardColor: const Color(0xFF3c3e44),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF1e2124),
              elevation: 0,
            ),
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.white),
              bodySmall: TextStyle(color: Color(0xFF9e9e9e)),
            ),
          ),
          themeMode: currentTheme,

          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.generateRoute,
          initialRoute: charactersScreen,
        );
      },
    );
  }
}
