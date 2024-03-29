import 'package:flutter/material.dart';
import 'package:pokeflutter/models/pokemon_model.dart';
import 'package:pokeflutter/utils/manejo_strings.dart';

class PokemonTeamSpace extends StatelessWidget {
  const PokemonTeamSpace({
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

    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      children: List.generate(6, (i) {
        return Container(
            color: Colors.amber,
            width: size.width * 0.5,
            child: InkWell(
              onTap: () {
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return PokemonDialogCard(
                      pokemon: pokemon[i],
                    );
                  },
                );
              },
              child: Column(
                children: [
                  Image.network(pokemon[i].sprite),
                  Text('${pokemon[i].id} - ${pokemon[i].name.toUpperCase()}')
                ],
              ),
            ));
      }),
    );
  }
}

class PokemonDialogCard extends StatelessWidget {
  const PokemonDialogCard({
    super.key,
    required this.pokemon,
  });
  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(pokemon.name.toUpperCase()),
      content: Container(
        height: 140,
        child: Column(
          children: [
            Text(
                'Tipo(s): ${pokemon.type1.toTitleCase()} ${pokemon.type2 == null ? '' : '/  ${pokemon.type2.toString().toTitleCase()}'}'),
            Text(
                'Abilidad(es): ${pokemon.ability1.toTitleCase()} ${pokemon.ability2 == null ? '' : '/ ${pokemon.ability2.toString().toTitleCase()}'}'),
            Image.network(pokemon.sprite)
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Ok'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
