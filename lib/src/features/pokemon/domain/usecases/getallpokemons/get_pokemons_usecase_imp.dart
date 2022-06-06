import 'package:pokedex/src/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokedex/src/features/pokemon/domain/usecases/getallpokemons/get_pokemons_usecase.dart';

import '../../repositories/get_pokemons_repository.dart';

class GetPokemonsUsecaseImp implements GetPokemonsUsecase{
  final GetPokemonsRepository _getPokemonsRepository;

  GetPokemonsUsecaseImp(this._getPokemonsRepository);
  
  @override
  Future<List<PokemonEntity>> call() async {
    return await _getPokemonsRepository(); 
  }

}

