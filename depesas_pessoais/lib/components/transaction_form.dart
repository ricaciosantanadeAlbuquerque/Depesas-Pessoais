import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({super.key});
  @override
  State<TransactionForm> createState() => TransactionFormState();
}

class TransactionFormState extends State<TransactionForm> {
   final title = TextEditingController();
   final value = TextEditingController();
   
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: title,
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: value,
              decoration: const InputDecoration(
                labelText: 'Valor (R\$)',
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
    );
  }
}
