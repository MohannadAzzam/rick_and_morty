import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'business_logic/theme_cubit/theme_cubit.dart';
import 'app_router.dart';
import 'constants/strings.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
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
            useMaterial3: true,
            appBarTheme: AppBarTheme(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blueGrey,
            ),
          ),
          darkTheme: ThemeData.dark(),
          themeMode: currentTheme,

          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.generateRoute,
          initialRoute: charactersScreen,
        );
      },
    );
  }
}
