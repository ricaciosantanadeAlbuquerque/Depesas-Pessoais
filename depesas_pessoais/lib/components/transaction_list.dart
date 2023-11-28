import 'package:depesas_pessoais/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionLits extends StatelessWidget {
  final List<Transaction> listTransaction;

  const TransactionLits({super.key,required this.listTransaction});
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380,
      child: ListView.builder(
        itemCount: listTransaction.length,
        itemBuilder: (_, index) {
          final trs = listTransaction[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
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
              trailing: IconButton(
                onPressed: () {},
                color: Theme.of(context).colorScheme.error,
                icon: const Icon(Icons.delete),
              ),
            ),
          );
        },
      ),
    );
  }
}