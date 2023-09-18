import 'package:flutter/material.dart';
import 'package:miapp/marvel/src/ListHeroes.dart';
import "package:miapp/marvel/views/heroDetail.dart";

//Ojalá así como declaro variables me le pudiera declarar a ella

class heroesCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _heroesCard();
  }
}

class _heroesCard extends State<heroesCard> {
  Future refresh() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("App de Marvel"),
          backgroundColor: Colors.red,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: RefreshIndicator.adaptive(
            onRefresh: refresh,
            color: Colors.red,
            child: futureBuilderHero(),
          ),
        ));
  }

  FutureBuilder<dynamic> futureBuilderHero() {
    return FutureBuilder(
      future: consultarHeroes(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return loadingCase();
          case ConnectionState.done:
            {
              if (snapshot.hasData) {
                dynamic listHeroes = snapshot.data;
                return loadHeroesCards(listHeroes);
              } else {
                return TextButton.icon(
                  onPressed: () => {setState(() {})},
                  icon: const Icon(
                    Icons.update,
                    color: Colors.red,
                  ),
                  label: const Text(
                    "Reload",
                    style: TextStyle(color: Colors.red),
                  ),
                );
              }
            }
          default:
            return const Text("Something went wrong!");
        }
      },
    );
  }

  Center loadingCase() {
    return Center(
      child: loadingColumn(),
    );
  }

  Column loadingColumn() {
    return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.redAccent),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Loading ...",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )
        ]);
  }

  ListView loadHeroesCards(listHeroes) {
    return ListView.separated(
        itemBuilder: ((context, index) {
          return createHeroCard(listHeroes[index], context);
        }),
        separatorBuilder: (context, index) => const SizedBox(
              height: 30,
            ),
        itemCount: listHeroes.length);
  }

  Card createHeroCard(heroe, context) {
    return Card(
      surfaceTintColor: Colors.red,
      elevation: 10,
      shadowColor: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('${heroe.name}'),
              subtitle: Text('${heroe.description}'),
            ),
            const SizedBox(
              height: 10,
            ),
            loadHeroeImage(heroe, context),
            const SizedBox(
              height: 10,
            ),
            rowButton(heroe, context),
          ],
        ),
      ),
    );
  }

  Row rowButton(heroe, context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => heroDetail(
                  hero: heroe,
                ),
              ),
            );
          },
          icon: const Icon(
            Icons.add,
            color: Colors.red,
          ),
          label: const Text(
            "Details",
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }

  Image loadHeroeImage(heroe, context) {
    String urlPhoto = ("${heroe.path}.${heroe.extension}");
    return Image(
      image: NetworkImage(urlPhoto),
      width: 250,
      height: 250,
    );
  }
}
