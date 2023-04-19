import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  static int NUMERO_DE_CASAS_DECIMAIS = 2;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty ? Column(
        children: [
          Text('Nenhuma transação cadastrada!'),
          SizedBox(height: 20),
          Container(height: 200, child: Image.asset('assets\\images\\waiting.png', fit: BoxFit.cover,))
        ],
      ) : ListView.builder(
        //Quantidade de items do ListView
        itemCount: transactions.length,

        //Recebe uma função que tem como parâmetro o contexto e o index (não é o mesmo contexto do BuildContext)
        itemBuilder: (ctx, index){
          final tr = transactions[index];
          return Card(
              child: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary, 
                      width: 2)),
                padding: const EdgeInsets.all(10),
                child: Text('R\$ ${tr.value.toStringAsFixed(NUMERO_DE_CASAS_DECIMAIS)}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tr.title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)
                  ),
                  Text(DateFormat('d MMM y').format(tr.date),
                      style: const TextStyle(color: Colors.grey))
                ],
              )
            ],
          ));
        },
      ),
    );
  }
}
