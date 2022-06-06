import 'package:flutter/material.dart';
import 'package:pokedex/src/core/utils/pokeapi.dart';
import 'package:pokedex/src/features/pokemon/domain/entities/pokemon_entity.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({Key? key}) : super(key: key);

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  @override
  Widget build(BuildContext context) {
    var pokemon = ModalRoute.of(context)!.settings.arguments as PokemonEntity;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor:
              Color(PokeApi.colorSelect(pokemonType: pokemon.types.first)),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border))],
        ),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color:  Color(PokeApi.colorSelect(pokemonType: pokemon.types.first)),
              child: Text(pokemon.name, style: const TextStyle(fontSize: 30,color: Colors.white)),
            ),
            Center(child: Image.network(pokemon.sprite,scale: 0.1,)),
          ],
        ),
      ),
    );
  }
}
