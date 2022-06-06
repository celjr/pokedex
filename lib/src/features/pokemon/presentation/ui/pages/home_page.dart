import 'package:flutter/material.dart';
import 'package:pokedex/src/features/pokemon/presentation/controllers/pokemon_controller.dart';
import 'package:pokedex/src/features/pokemon/presentation/ui/widgets/pokemon_card_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final String user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PokemonController pokeController;
  @override
  void initState() {
    
    pokeController = context.read();
    pokeController.getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 80),
            child: AppBar(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('Olá, ${widget.user}',
                      style: const TextStyle(fontSize: 20)),
                  const Text('Bem vindo', style: TextStyle(fontSize: 10))
                ],
              ),
              backgroundColor: Colors.grey[700],
            )),
        body: Container(
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          child: Flex(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            direction: Axis.vertical,
            children: [
              const Flexible(
                flex: 3,
                child: Text(
                  'How pokemon you \nchoise?',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),

              Flexible(
                flex: 10,
                child: Consumer<PokemonController>(
                    builder: (context, controller, _) {
                  return GridView.builder(
                      itemCount: controller.pokemonList.length,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemBuilder: (context, index) {
                        return PokemonCardWidget(
                          pokemon: pokeController.pokemonList[index],
                        );
                      });
                }),
              ),
              Flexible(
                flex: 2,
                child: Center(child: Image.network('https://logodownload.org/wp-content/uploads/2017/08/pokemon-logo-8.png')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
