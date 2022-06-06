import 'package:flutter/material.dart';
import 'package:pokedex/src/core/domain/services/http_service.dart';
import 'package:pokedex/src/features/pokemon/data/datasources/get_pokemons_datasource.dart';
import 'package:pokedex/src/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokedex/src/features/pokemon/domain/repositories/get_pokemons_repository.dart';
import 'package:pokedex/src/features/pokemon/domain/usecases/getallpokemons/get_pokemons_usecase.dart';

class PokemonController extends ChangeNotifier{
  final GetPokemonsDataSource _getPokemonsDataSource;
  final GetPokemonsRepository _getPokemonsRepository;
  final GetPokemonsUsecase _getPokemonsUsecase;
  final HttpService _httpService;

  List<PokemonEntity>  pokemonList = [];

  PokemonController(this._getPokemonsDataSource, this._getPokemonsRepository, this._getPokemonsUsecase, this._httpService) ;

  Future<bool> getPokemons()async{
    try{
      pokemonList = await _getPokemonsUsecase();
      notifyListeners();
      return true;
    }catch(e){
      return false;
    }
  }
}