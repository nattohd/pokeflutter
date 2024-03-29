import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokeflutter/models/pokemon_model.dart';

class TeamProvider {
  Future<List<PokemonModel>> getPokemon(List<String> numero) async {
    List<PokemonModel> seisPokemon = [];
    for (var i = 0; i < 6; i++) {
      String pokeActual = numero[i];
      String url = 'https://pokeapi.co/api/v2/pokemon/$pokeActual';
      dynamic uri = Uri.parse(url);
      dynamic response = await http.get(uri);
      String body = response.body;
      dynamic json = jsonDecode(body);
      PokemonModel pokemonModel =
          PokemonModel(); // Crear un nuevo objeto en cada iteración
      pokemonModel.id = json['id'].toString();
      pokemonModel.name = json['name'];
      pokemonModel.type1 = json['types'][0]['type']['name'];
      pokemonModel.type2 =
          json['types'].length > 1 ? json['types'][1]['type']['name'] : null;
      pokemonModel.sprite = json['sprites']['front_default'];
      pokemonModel.ability1 = json['abilities'][0]['ability']['name'];
      pokemonModel.ability2 = json['abilities'].length > 1
          ? json['abilities'][1]['ability']['name']
          : null;
      seisPokemon.add(pokemonModel); // Agregar el nuevo objeto a la lista
    }

    return seisPokemon;
  }
}
