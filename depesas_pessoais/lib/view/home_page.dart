import 'dart:math';
import 'package:intl/intl.dart';
import 'package:depesas_pessoais/model/transaction.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final List<Transaction> listTransaction = [
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 150000, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Cartao de crédito', value: 250, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Card(elevation: 5, color: Colors.blue, child: Text('Grafico')),
          SizedBox(
            height: 380,
            child: ListView.builder(
              itemCount: listTransaction.length,
              itemBuilder: (_, index) {
                final trs = listTransaction[index];
                return Card(
                    margin:const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal:5
                    ),
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: FittedBox(
                            child: Text(
                              trs.value.toStringAsFixed(2),
                            ),
                          ),
                        ),
                      ),
                      title: Text(trs.title),
                      subtitle: Text(DateFormat('dd MMM y').format(trs.date)),
                      trailing:IconButton(
                        onPressed:(){},
                        color:Theme.of(context).colorScheme.error,
                        icon: const Icon(Icons.delete),
                        ),
                    ),
                    );
              },
            ),
          ),
          const Card(
            elevation: 5,
            color: Colors.blue,
            child: Text('Form'),
          ),
        ],
      ),
    );
  }
}
