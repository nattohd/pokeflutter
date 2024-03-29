import 'package:flutter/material.dart';
import 'package:pokeflutter/src/pokemon_team/team_generator.dart';
import 'package:pokeflutter/test_poke_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TeamGeneratorPage(),
    );
  }
}
