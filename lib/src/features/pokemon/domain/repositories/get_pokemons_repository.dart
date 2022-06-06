import 'package:pokedex/src/features/pokemon/domain/entities/pokemon_entity.dart';

abstract class GetPokemonsRepository {
  Future<List<PokemonEntity>> call();
}