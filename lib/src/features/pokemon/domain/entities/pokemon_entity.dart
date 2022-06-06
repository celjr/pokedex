class PokemonEntity{
  final int id;
  final String name;
  final String sprite;
  final Map<String, int> stats;
  final List<String> types;
  final String description;
  final int weight;
  final int height;

  PokemonEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.sprite,
    required this.stats,
    required this.types,
    required this.weight,
    required this.height,
  });

  @override
  String toString() {
    return '''
      id: $id,
      name: $name,
      descrition: $description,
      sprite: $sprite,
      stats: $stats,
      types: $types,
      weight: $weight,
      height: $height,
     ''';
  }
}