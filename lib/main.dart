import 'package:flutter/material.dart';
import 'package:pokedex/models/environment.dart';
import 'package:pokedex/views/app/app.dart';

void main() {
  Environment.instance.setEnvironment(
    apiBaseUrl: 'https://pokeapi.co/api/',
    apiVersion: 'v2',
  );
  runApp(const App());
}
