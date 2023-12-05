import 'dart:math';

import 'package:depesas_pessoais/model/transaction.dart';
import 'package:flutter/material.dart';

import '../components/chart.dart';
import '../components/transaction_form.dart';
import '../components/transaction_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final List<Transaction> listTransaction = [
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 1500, date: DateTime.now().subtract(const Duration(days: 15))),
    Transaction(id: Random().nextDouble().toString(), title: 'Cartao de crédito', value: 250, date: DateTime.now()),
  ];

  void addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(id: Random().nextDouble.toString(), title: title, value: value, date: date);

    setState(() {
      listTransaction.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  opeTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(onSubmitted: addTransaction); // comunicação indireta
        });
  }

  List<Transaction> get recentTransaction {
    return listTransaction.where((trs) {
      return trs.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  void onRemove(String id) {
    setState(() {
       listTransaction.removeWhere((trs) {
        return trs.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Despesas Pessoais',
        ),
        actions: [
          IconButton(
            onPressed: () {
              opeTransactionFormModal(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(
              listaTransaction: recentTransaction,
            ),
            TransactionLits(listTransaction: listTransaction, onRemove: onRemove,), // comunicação dirate / comunicação indireta
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          opeTransactionFormModal(context);
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
