import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Despesas Pessoais'),
        ),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(elevation: 5, color: Colors.blue, child: Text('Grafico')),
            Card(elevation: 5, color: Colors.blue, child: Text('Lista')),
            Card(
              elevation: 5,
              color: Colors.blue,
              child: Text('Form'),
            ),
          ],
        ));
  }
}
