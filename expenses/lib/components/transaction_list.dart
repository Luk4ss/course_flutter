import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String)  onRemove;

  static int NUMERO_DE_CASAS_DECIMAIS = 2;

  TransactionList(this.transactions, this.onRemove);

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
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: FittedBox(child: Text('R\$${tr.value}')),
                ),
              ),
              title: Text(tr.title, style: Theme.of(context).textTheme.titleSmall,),
              subtitle: Text(
                DateFormat('d MM y').format(tr.date)
              ),
              trailing: IconButton(icon: Icon(Icons.delete), onPressed: () => onRemove(tr.id), color: Theme.of(context).colorScheme.error,),
            ),
          );
        },
      ),
    );
  }
}
