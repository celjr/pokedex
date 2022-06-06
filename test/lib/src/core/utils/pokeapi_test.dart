import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/src/core/utils/pokeapi.dart';

void main() {
  test('should return a url to acess the pokemon list', () {
    expect(PokeApi.requestPokemonsList, 'https://pokeapi.co/api/v2/pokemon');
  });
  test('should return a url to access a single pokemon', () {
    expect(PokeApi.requestPokemon(pokemon: 'squirtle'),'https://pokeapi.co/api/v2/pokemon/squirtle');
  });
}
