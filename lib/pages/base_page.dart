import 'dart:math';
import 'dart:ui';
import 'package:pokeflutter/models/pokemon_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokeflutter/providers/team_provider.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  PokemonModel pokemonModel = PokemonModel();
  TeamProvider teamProvider = TeamProvider();
  dynamic url = '';
  Random random = Random();
  List<PokemonModel> seisPokemon = [];
  bool isLoading = false;
  bool gen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PRUEBA API'),
      ),
      body: Column(
        children: [
          SeisEspacios(
            pokemon: seisPokemon,
            isLoading: isLoading,
            generated: gen,
          ),
          ElevatedButton(
              onPressed: () async {
                List<String> numer = ['0', '0', '0', '0', '0', '0'];
                for (var i = 0; i < 6; i++) {
                  numer[i] = '0';
                  while (numer[i] == '0') {
                    numer[i] = (random.nextInt(800).toString());
                  }
                }
                print(numer);
                seisPokemon = (await teamProvider.getPokemon(numer));
                gen = true;
                setState(() {});
              },
              child: Text('GEnerar'))
        ],
      ),
    );
  }
}

class SeisEspacios extends StatelessWidget {
  const SeisEspacios({
    super.key,
    required this.pokemon,
    required this.isLoading,
    required this.generated,
  });

  final List<PokemonModel> pokemon;
  final bool isLoading;
  final bool generated;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return generated
        ? Container(
            height: size.height * 0.75,
            width: size.width,
            color: Colors.red,
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(6, (i) {
                String nombre = pokemon[i].name;
                String foto = pokemon[i].sprite;
                return Container(
                  color: Colors.amber,
                  height: size.height * 0.25,
                  width: size.width * 0.5,
                  child: Image.network(foto),
                );
              }),
            ),
          )
        : Container(
            child: Text('Genera tu cosa'),
          );
  }
}
