import 'package:pokedex/src/features/pokemon/domain/entities/pokemon_entity.dart';

abstract class GetPokemonsUsecase{
  Future<List<PokemonEntity>> call();
}