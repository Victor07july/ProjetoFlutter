import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//stl -> stateless widget
// alt + enter -> wrap

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Color bgColor = Colors.amberAccent;

  void changeBgColor() {
    setState(() {
      bgColor = bgColor == Colors.white ? Colors.black : Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Tudo fica dentro do Scafoold
      appBar: AppBar(
        title: Text("Aplicativo"),
      ),
      body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: changeBgColor,
                icon: const Icon(
                  Icons.download,
                  size: 24.0,
                ),
                label: const Text('Botão'),
              )
            ],
          ),
      ),
      backgroundColor: bgColor,
    );
  }
}
