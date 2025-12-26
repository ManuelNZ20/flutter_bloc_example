import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  int pokemonId = 1;

  @override
  Widget build(BuildContext context) {
    final pokemonBloc = context.read<PokemonBloc>();
    return Scaffold(
        appBar: AppBar(
          title: Text('Pokemon ID $pokemonId'),
        ),
        body: Center(
          child: FutureBuilder(
            future: pokemonBloc.fetchPokemonName(pokemonId),
            initialData: pokemonBloc.state.pokemons[pokemonId] ?? 'Loading...',
            builder: (context, snapshot) {
              if (pokemonBloc.state.pokemons.isEmpty) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
              }

              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    height: 10,
                    child: snapshot.connectionState == ConnectionState.waiting
                        ? LinearProgressIndicator()
                        : null,
                  ),
                  Expanded(
                    flex: 2,
                    child: ListView.builder(
                      itemCount: pokemonBloc.state.pokemons.length,
                      itemBuilder: (context, index) {
                        final pokemon = pokemonBloc.state.pokemons[index + 1]!;
                        return Container(
                            color: index + 1 == pokemonId
                                ? Colors.teal
                                : Colors.grey,
                            child: Text(pokemon));
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'btn-add',
              child: const Icon(Icons.plus_one),
              onPressed: () => setState(() {
                pokemonId++;
              }),
            ),
            const SizedBox(height: 15),
            FloatingActionButton(
              heroTag: 'btn-minus',
              child: const Icon(Icons.exposure_minus_1),
              onPressed: () => setState(() {
                if (pokemonId <= 1) return;
                pokemonId--;
              }),
            ),
          ],
        ));
  }
}
