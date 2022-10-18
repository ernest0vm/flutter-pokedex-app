import 'package:flutter/material.dart';
import 'package:pokedex/views/home/home_page.dart';

class AppRoutes {
  static String get home => 'home';

  static Map<String, WidgetBuilder> get routes => {
        home: (context) => const HomePage(),
      };
}
