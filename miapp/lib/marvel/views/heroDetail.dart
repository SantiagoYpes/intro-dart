import 'package:flutter/material.dart';

import '../models/Heroe.dart';

class heroDetail extends StatelessWidget {
  Heroe? hero;
  heroDetail({super.key, this.hero});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("App de Marvel"),
          backgroundColor: Colors.red,
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(children: [centerContent(hero)])));
  }

  Center centerContent(hero) => Center(child: createColumn(hero));

  Column createColumn(hero) {
    String photoUrl = ('${hero.path}.${hero.extension}');
    return Column(
      children: [
        cardDetail(photoUrl, hero),
      ],
    );
  }

  Card cardDetail(String photoUrl, hero) {
    return Card(
      elevation: 50,
      shadowColor: Colors.black,
      color: const Color.fromARGB(255, 234, 189, 189),
      child: SizedBox(
        width: 400,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: createColumnDetail(photoUrl, hero), //Column
        ), //Padding
      ), //SizedBox
    );
  }

  Column createColumnDetail(String photoUrl, hero) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.red[500],
          radius: 108,
          child: CircleAvatar(
            backgroundImage: NetworkImage(photoUrl), //NetworkImage
            radius: 100,
          ), //CircleAvatar
        ), //CircleAvatar
        const SizedBox(
          height: 10,
        ), //SizedBox
        Text(
          '${hero.name}',
          style: const TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ), //Textstyle
        ), //Text
        const SizedBox(
          height: 10,
        ), //SizedBox
        Text(
          '${hero.description}',
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black,
          ), //Textstyle
        ), //Text
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Series',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ), //Textstyle
        ),
        const SizedBox(
          height: 10,
        ),
        loadSeries(hero.seriesList),
        listAvailable(hero.numcomics, "Comics"),
        listAvailable(hero.numstories, "Stories"),
        listAvailable(hero.numevents, "Events"),
        listAvailable(hero.numseries, "Series"),
        const SizedBox(
          height: 10,
        ), //SizedBox//SizedBox
      ],
    );
  }

  Column loadSeries(listSeries) {
    if (listSeries.length == 3) {
      return Column(
        children: [
          Text("${listSeries[0]['name']}"),
          const SizedBox(
            height: 10,
          ),
          Text("${listSeries[1]['name']}"),
          const SizedBox(
            height: 10,
          ),
          Text("${listSeries[2]['name']}"),
        ],
      );
    } else if (listSeries.length == 2) {
      return Column(
        children: [
          Text("${listSeries[0]['name']}"),
          const SizedBox(
            height: 10,
          ),
          Text("${listSeries[1]['name']}"),
        ],
      );
    } else {
      return Column(
        children: [Text("${listSeries[0]['name']}")],
      );
    }
  }

  ListTile listAvailable(typeNumber, type) {
    return ListTile(
      title: Text('$type available:',
          style: const TextStyle(
              fontSize: 15, color: Colors.black, fontWeight: FontWeight.w500)),
      subtitle: Text('$typeNumber'),
    );
  }
}

Row rowButton(heroe, context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      TextButton.icon(
        onPressed: null,
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
