import 'package:flutter/material.dart';

class PokemonModel {
  String id;
  String name;
  String type1;
  String? type2;
  String sprite;
  String ability1;
  String? ability2;
  PokemonModel({
    Key? key,
    this.id = '',
    this.name = '',
    this.type1 = '',
    this.type2,
    this.sprite = '',
    this.ability1 = '',
    this.ability2,
  });
}
