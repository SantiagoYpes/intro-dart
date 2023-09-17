import 'package:flutter/material.dart';

class actividad_3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return createScaffold();
  }
}

createScaffold() {
  return Scaffold(
      backgroundColor: Color.fromRGBO(240, 242, 241, 1),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Actividad 3"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("img/OIG.jpeg"),
          createRow1(),
          createRow(),
          SizedBox(
            height: 40,
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
          )
        ],
      ));
}

createIcon() {
  return Icon(Icons.call, size: 50);
}

iconButton(Icon icon) {
  return IconButton(
    onPressed: () => {},
    icon: icon,
    iconSize: 30,
    color: Colors.blue,
  );
}

iconButton2(Icon icon) {
  return IconButton(
    onPressed: () => {},
    icon: icon,
    iconSize: 25,
    color: Colors.orange,
  );
}

createText(String text, {weight}) {
  return Text(text, style: TextStyle(fontWeight: weight, color: Colors.blue));
}

createProviderImage() {
  return Image(
    image: AssetImage("img/OIG.jpeg"),
  );
}

createListView() {
  return ListView(
    children: [createScaffold()],
  );
}

createRow1() {
  return Container(
    margin: EdgeInsets.all(20),
    child: Row(
      children: [
        createColumn1(),
        SizedBox(
          width: 85,
        ),
        iconButton2(Icon(Icons.star)),
        Text("50", style: TextStyle(fontWeight: FontWeight.w400)),
      ],
    ),
  );
}

createColumn1() {
  return Column(
    children: [
      Text(
        "Visión Lider Internacional",
        style: TextStyle(fontWeight: FontWeight.w900),
      ),
      SizedBox(
        height: 10,
      ),
      Text("Iglesia Cristiana", style: TextStyle(fontWeight: FontWeight.w400)),
    ],
  );
}

createRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      createColumn(Icon(Icons.call), "CALL"),
      createColumn(Icon(Icons.route), "ROUTE"),
      createColumn(Icon(Icons.share), "SHARE")
    ],
  );
}

createColumn(Icon icon, String msg) {
  return Column(
    children: [iconButton(icon), createText(msg)],
  );
}
