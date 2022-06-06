import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/src/core/data/service/http_service_imp.dart';
import 'package:pokedex/src/core/domain/services/http_service.dart';
import 'package:pokedex/src/features/pokemon/data/datasources/get_pokemons_datasource.dart';
import 'package:pokedex/src/features/pokemon/data/datasources/remote/get_pokemons_remote_datasource_imp.dart';
import 'package:pokedex/src/features/pokemon/data/repositories/get_pokemons_repository_imp.dart';
import 'package:pokedex/src/features/pokemon/domain/repositories/get_pokemons_repository.dart';
import 'package:pokedex/src/features/pokemon/domain/usecases/getallpokemons/get_pokemons_usecase.dart';
import 'package:pokedex/src/features/pokemon/domain/usecases/getallpokemons/get_pokemons_usecase_imp.dart';

void main() {
  test('should return a list with pokemons', () async {
     HttpService httpService = HttpServiceImp();
    GetPokemonsDataSource remoteDataSource =GetPokemonsRemoteDataSourceImp(httpService);
    GetPokemonsRepository repository = GetPokemonsRepositoryImp(remoteDataSource);
    GetPokemonsUsecase usecase = GetPokemonsUsecaseImp(repository);
    var result = await usecase(); 
    expect(result.length,20);
  });
}