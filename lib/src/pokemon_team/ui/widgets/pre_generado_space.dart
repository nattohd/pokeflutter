import 'package:flutter/material.dart';

class PreGeneradoSpace extends StatelessWidget {
  const PreGeneradoSpace({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Text('Crea tu equipo Pokemon al azar'),
          Container(
            padding: EdgeInsets.all(25.0),
            child: Text(
              'Toca el botón generar para crear un equipo pokemon de las generaciónes que quieras!',
              textAlign: TextAlign.center,
            ),
          ),
        ]));
  }
}
