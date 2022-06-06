class PokeApi{
  static String requestPokemon({required String pokemon}){
    return 'https://pokeapi.co/api/v2/pokemon/$pokemon';
  }
 static const requestPokemonsList = 'https://pokeapi.co/api/v2/pokemon';
}

