import 'dart:math';
import 'dart:ui';
import 'package:pokeflutter/models/pokemon_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokeflutter/providers/team_provider.dart';
import 'package:pokeflutter/src/pokemon_team/ui/widgets/pokemon_team_space.dart';
import 'package:pokeflutter/src/pokemon_team/ui/widgets/pre_generado_space.dart';
import 'package:progress_indicators/progress_indicators.dart';

class TeamGeneratorPage extends StatefulWidget {
  const TeamGeneratorPage({super.key});

  @override
  State<TeamGeneratorPage> createState() => _TeamGeneratorPageState();
}

class _TeamGeneratorPageState extends State<TeamGeneratorPage> {
  PokemonModel pokemonModel = PokemonModel();
  TeamProvider teamProvider = TeamProvider();
  dynamic url = '';
  Random random = Random();
  List<PokemonModel> seisPokemon = [];
  bool isLoading = false;
  bool gen = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('PRUEBA API'),
      ),
      body: Column(
        children: [
          Spacer(),
          Container(
            height: size.height * 0.75,
            width: size.width,
            child: isLoading
                ? Loading()
                : gen
                    ? PokemonTeamSpace(
                        pokemon: seisPokemon,
                        isLoading: isLoading,
                        generated: gen,
                      )
                    : PreGeneradoSpace(),
          ),
          Container(
            child: Text('Elegir generaciones (futuro)'),
          ),
          ElevatedButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                List<String> numer = ['0', '0', '0', '0', '0', '0'];
                for (var i = 0; i < 6; i++) {
                  numer[i] = '0';
                  while (numer[i] == '0') {
                    numer[i] = (random.nextInt(800).toString());
                  }
                }
                seisPokemon = (await teamProvider.getPokemon(numer));
                setState(() {
                  isLoading = false;
                  gen = true;
                });
              },
              child: Text('Generar')),
          Spacer()
        ],
      ),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return JumpingDotsProgressIndicator(
      fontSize: 60,
    );
  }
}
