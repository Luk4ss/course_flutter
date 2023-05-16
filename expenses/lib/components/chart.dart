import 'package:expenses/components/chart_bar.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  
  final List<Transaction> recentTransaction;

  const Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransactions{
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index)
      );

      double totalSum = 0.0;

      for(var t in recentTransaction){
        bool sameDay = weekDay.day == t.date.day;
        bool sameMonth = weekDay.month == t.date.month;
        bool sameYear = weekDay.year == t.date.year;

        if(sameDay && sameMonth && sameYear){
          totalSum += t.value;
        }

      }
      
  
      return {
        'day': DateFormat.E().format(weekDay)[0], 
        'value': totalSum
        }; 
    }).reversed.toList();
  }

  double get _weekTotalValue{
    return groupedTransactions.fold(0.0, (sum, element) => sum + (element['value'] as double));
  }

  @override
  Widget build(BuildContext context) {
    groupedTransactions;
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: 
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactions.map((e){
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  label: e['day'] as String, 
                  value: e['value'] as double, 
                  percentage: _weekTotalValue == 0 ? 0 : (e['value'] as double) /_weekTotalValue),
              );
            }).toList(),
          ),
        )
    );
  }
}