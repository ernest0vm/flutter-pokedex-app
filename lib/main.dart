import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:path_provider/path_provider.dart';
import 'package:pokedex/managers/favorites_manager.dart';
import 'package:pokedex/models/environment.dart';
import 'package:pokedex/views/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Environment Config
  Environment.instance.setEnvironment(
    apiBaseUrl: 'https://pokeapi.co/api',
    apiVersion: 'v2',
  );

  /// Hive Config
  final tmpDir = await getTemporaryDirectory();
  await Hive.initFlutter(tmpDir.path);
  await FavoritesManager.instance.init();

  runApp(const App());
}
