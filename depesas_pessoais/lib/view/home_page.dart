import 'dart:math';

import 'package:depesas_pessoais/model/transaction.dart';
import 'package:flutter/material.dart';

import '../components/transaction_list.dart';

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

  final title = TextEditingController();
  final value = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Card(elevation: 5, color: Colors.blue, child: Text('Grafico')),

          TransactionLits(listTransaction: listTransaction), // comunicação dirate

          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  TextField(
                    controller: title,
                    decoration:const InputDecoration(
                      labelText: 'Título',
                    ),
                  ),
                  TextField(
                    controller:value,
                    decoration:const InputDecoration(
                      labelText:'Valor (R\$)',
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: Row(
                      children: [
                        const Expanded(child: Text('Data Selecionada')),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Data Selecionada'),
                        ),
                      ],
                    ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Nova transação'),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
