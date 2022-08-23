import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/utils/routes/app_router.gr.dart';
import 'package:movie_app/utils/theme/app_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      title: 'Movie APP',
      theme: ThemeData(
          fontFamily: 'Montserrat',
          primarySwatch: AppColors.getMaterialColorFromColor(AppColors.primary),
          scaffoldBackgroundColor: AppColors.primary,
          textTheme: const TextTheme(
              bodyText2: TextStyle(
            color: Colors.white,
          ))),
    );
  }
}
