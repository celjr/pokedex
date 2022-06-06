import 'package:pokedex/src/features/pokemon/domain/entities/pokemon_entity.dart';

extension PokemonDto on PokemonEntity{
  static PokemonEntity fromMap(Map map) {
    int id = map['id'];
    String name = map['name'];
    String sprite = map['sprites']['front_default'];
    String description = map['description'];
    Map<String, int> stats = {};
    for (Map i in map['stats']) {
      stats[i['stat']['name']] = i['base_stat'];
    }
    List<String> types = [for (Map i in map['types']) i['type']['name']];
    int weight = map['weight'];
    int height = map['height'];

    return PokemonEntity(
      id: id,
      name: name,
      description: description,
      sprite: sprite,
      stats: stats,
      types: types,
      weight: weight,
      height: height,
    );
  }
}