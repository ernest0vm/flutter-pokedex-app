import 'package:flutter/material.dart';
import 'package:pokedex/views/routes/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Pokedex',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.home,
        routes: AppRoutes.routes,
      );
}
