import 'dart:convert';

import 'package:pokedex/src/core/domain/services/http_service.dart';
import 'package:pokedex/src/core/utils/pokeapi.dart';
import 'package:pokedex/src/features/pokemon/data/datasources/get_pokemons_datasource.dart';

class GetPokemonsRemoteDataSourceImp implements GetPokemonsDataSource {
  final HttpService _httpService;

  GetPokemonsRemoteDataSourceImp(this._httpService);

  @override
  Future<List<Map>> call() async {
    var response = await _httpService.get(PokeApi.requestPokemonsList);
    var jsonPokemonsName = jsonDecode(response.body);
    List<Map> listPokemonsMap = [];
    for (Map i in jsonPokemonsName['results']) {
      var responsePokemon = await _httpService.get(i['url']);
      var jsonPokemon = jsonDecode(responsePokemon.body);
      var specieResponse = await _httpService.get(jsonPokemon['species']['url']);
      var specieMap = jsonDecode(specieResponse.body);
      for (Map j in specieMap['flavor_text_entries']) {
        if (j['version']['name'] == 'ruby') {
          jsonPokemon['description'] = j['flavor_text'];
        }
      }
      listPokemonsMap.add(jsonPokemon);
    }

    return listPokemonsMap;
  }
}
