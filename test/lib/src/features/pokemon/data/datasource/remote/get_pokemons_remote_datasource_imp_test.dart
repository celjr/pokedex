import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/src/core/data/service/http_service_imp.dart';
import 'package:pokedex/src/core/domain/services/http_service.dart';
import 'package:pokedex/src/features/pokemon/data/datasources/get_pokemons_datasource.dart';
import 'package:pokedex/src/features/pokemon/data/datasources/remote/get_pokemons_remote_datasource_imp.dart';

void main(){
  test('should return a not null',() async{
    HttpService httpService = HttpServiceImp();
    GetPokemonsDataSource remoteDataSource =GetPokemonsRemoteDataSourceImp(httpService);
    var result = await remoteDataSource(); 
    expect(result,isNotNull);
  });
  
  test('should return a list of maps with pokemon\'s name',() async {
    HttpService httpService = HttpServiceImp();
    GetPokemonsDataSource remoteDataSource =GetPokemonsRemoteDataSourceImp(httpService);
    var result = await remoteDataSource(); 
    expect(result,isInstanceOf<List<Map>>());
  });
}