import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/src/features/pokemon/domain/entities/pokemon_entity.dart';

void main() {
 
  test('should return a not null pokemon', (){
     PokemonEntity pokemonTest = PokemonEntity(
    id: 1,
    name: 'test',
    description: 'pokemon criado para teste',
    sprite: 'test.img',
    stats: {'attack':100},
    types: ['especial'],
    weight: 50,
    height: 6,
  );
    expect(pokemonTest, isNotNull);
  });
  test('should return a with all information of pokemon', (){
     PokemonEntity pokemonTest = PokemonEntity(
    id: 1,
    name: 'test',
    description: 'pokemon criado para teste',
    sprite: 'test.img',
    stats: {'attack':100},
    types: ['especial'],
    weight: 50,
    height: 6,
  );
    expect(pokemonTest.toString(), isInstanceOf<String>());
  });
}
