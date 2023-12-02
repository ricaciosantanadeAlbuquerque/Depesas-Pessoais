import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> listaTransaction;

  const Chart({super.key, required this.listaTransaction});

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totlaValue = 0.0;

      for (var i = 0; i < listaTransaction.length; i++) {
        bool sameDay = listaTransaction[i].date.day == weekDay.day;

        if (sameDay == true) {
          totlaValue += listaTransaction[i].value;
        }
      }

      String day = '';
      switch (DateFormat.E().format(weekDay)) {
        case 'Mon':
          day = 'Se';
          break;
        case 'Tue':
          day = 'Te';
          break;
        case 'Wed':
          day = 'Qu';
          break;
        case 'Thu':
          day = 'Qu';
          break;
        case 'Fri':
          day = 'Se';
          break;
        case 'Sat':
          day = 'Sa';
          break;
        case 'Sun':
          day = 'Do';
          break;
      }

      return {'day': day, 'value': totlaValue};
    }).reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    groupedTransaction;
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        children: groupedTransaction.map((map) {
          return Text(' ${map['day']}  ${map['value']}');
        }).toList(),
      ),
    );
  }
}