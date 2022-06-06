import 'package:pokedex/src/features/pokemon/data/dto/pokemon_dto.dart';
import 'package:pokedex/src/features/pokemon/domain/entities/pokemon_entity.dart';

import '../../domain/repositories/get_pokemons_repository.dart';
import '../datasources/get_pokemons_datasource.dart';

class GetPokemonsRepositoryImp implements GetPokemonsRepository{
  final GetPokemonsDataSource _getPokemonsDataSource;

  GetPokemonsRepositoryImp(this._getPokemonsDataSource); 
  
  @override
  Future<List<PokemonEntity>> call() async {
    var mapsList = await _getPokemonsDataSource();
    List<PokemonEntity> pokemonsList = List.from(mapsList.map((e) => PokemonDto.fromMap(e)));

    return pokemonsList;
  }

}