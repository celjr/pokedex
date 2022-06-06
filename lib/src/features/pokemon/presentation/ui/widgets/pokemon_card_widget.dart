import 'package:flutter/material.dart';
import 'package:pokedex/src/core/utils/pokeapi.dart';
import 'package:pokedex/src/features/pokemon/domain/entities/pokemon_entity.dart';

class PokemonCardWidget extends StatelessWidget {
  const PokemonCardWidget({Key? key, required this.pokemon}) : super(key: key);
  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/description',arguments: pokemon),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: Color(PokeApi.colorSelect(pokemonType: pokemon.types.first)),
        ),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Flex(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(pokemon.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      )),
                  for (String i in pokemon.types)
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(50)),
                        color: Colors.white.withOpacity(0.2),
                      ),
                      child: Text(i,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          )),
                    )
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Flexible(
                    flex: 1,
                    child: Text(
                      '#${pokemon.id}',
                      style: TextStyle(color: Colors.black.withOpacity(0.3)),
                    ),
                  ),
                  Flexible(flex: 5, child: Image.network(pokemon.sprite)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
