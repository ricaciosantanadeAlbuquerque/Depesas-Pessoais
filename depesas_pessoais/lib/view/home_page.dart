import 'dart:math';

import 'package:depesas_pessoais/model/transaction.dart';
import 'package:flutter/material.dart';

import '../components/transaction_form.dart';
import '../components/transaction_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final List<Transaction> listTransaction = [
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 150000, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Cartao de crédito', value: 250, date: DateTime.now()),
  ];

  void addTransaction(String title, double value) {
    final newTransaction = Transaction(id: Random().nextDouble.toString(), title: title, value: value, date: DateTime.now());

    setState(() {
      listTransaction.add(newTransaction);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Card(elevation: 5, color: Colors.blue, child: Text('Grafico')),
            TransactionForm(onSubmitted: addTransaction), // comunicação indireta
            TransactionLits(listTransaction: listTransaction), // comunicação dirate
          ],
        ),
      ),
    );
  }
}
