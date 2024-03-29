import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokeflutter/models/pokemon_model.dart';
import 'package:pokeflutter/providers/team_provider.dart';

class TestPokeAPi extends StatelessWidget {
  const TestPokeAPi({super.key});

  @override
  Widget build(BuildContext context) {
    TestProvider testProvider = TestProvider();
    return Scaffold(
      appBar: AppBar(
        title: Text('titulo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            PokemonModel asd = PokemonModel();
            asd = await testProvider.getPokemonModel();
          },
          child: Text('Llamar'),
        ),
      ),
    );
  }
}

class TestProvider {
  PokemonModel pokemonModel = PokemonModel();
  String url = 'https://pokeapi.co/api/v2/pokemon/ditto';
  Future<PokemonModel> getPokemonModel() async {
    dynamic uri = Uri.parse(url);
    dynamic response = await http.get(uri);
    String body = response.body;
    dynamic json = jsonDecode(body);
    pokemonModel.id = json['id'].toString();
    pokemonModel.name = json['name'];
    pokemonModel.type1 = json['types'][0]['type']['name'];
    pokemonModel.type2 =
        json['types'].length > 1 ? json['types'][1]['type']['name'] : null;
    pokemonModel.sprite = json['sprites']['front_default'];
    pokemonModel.ability1 = json['abilities'][0]['ability']['name'];
    json['abilities'].length > 1
        ? pokemonModel.ability2 = json['abilities'][1]['ability']['name']
        : pokemonModel.ability2 = null;
    return pokemonModel;
  }

  // String id;
  // String name;
  // String type1;
  // String? type2;
  // String sprite;
  // String ability1;
  // String? ability2;
}
