import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex/src/core/data/service/http_service_imp.dart';
import 'package:pokedex/src/core/domain/services/http_service.dart';
import 'package:pokedex/src/features/pokemon/data/datasources/get_pokemons_datasource.dart';
import 'package:pokedex/src/features/pokemon/data/datasources/remote/get_pokemons_remote_datasource_imp.dart';
import 'package:pokedex/src/features/pokemon/data/repositories/get_pokemons_repository_imp.dart';
import 'package:pokedex/src/features/pokemon/domain/repositories/get_pokemons_repository.dart';
import 'package:pokedex/src/features/pokemon/domain/usecases/getallpokemons/get_pokemons_usecase.dart';
import 'package:pokedex/src/features/pokemon/domain/usecases/getallpokemons/get_pokemons_usecase_imp.dart';
import 'package:pokedex/src/features/pokemon/presentation/controllers/pokemon_controller.dart';
import 'package:provider/provider.dart';

import '../pages/description_page.dart';
import '../pages/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<HttpService>(create: (context) => HttpServiceImp()),
        Provider<GetPokemonsDataSource>(
            create: (context) =>
                GetPokemonsRemoteDataSourceImp(context.read())),
        Provider<GetPokemonsRepository>(
            create: (context) => GetPokemonsRepositoryImp(context.read())),
            Provider<GetPokemonsUsecase>(create: (context) => GetPokemonsUsecaseImp(context.read())),
        ChangeNotifierProvider(
            create: (context) => PokemonController(
                context.read(), context.read(), context.read(), context.read()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PokeSearch',
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(user: 'Junior',),
          '/description': (context) => const DescriptionPage()
        },
      ),
    );
  }
}
