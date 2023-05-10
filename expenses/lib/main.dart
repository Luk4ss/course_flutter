

import 'package:expenses/components/chart.dart';
import 'package:flutter/material.dart';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';
import 'components/chart.dart';
import 'dart:math';


void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();

    return MaterialApp(
      home: MyHomePage(),
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Colors.amber
        ),
      textTheme: tema.textTheme.copyWith(
        titleMedium: const TextStyle(
          fontFamily: 'Quicksand',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ) 
      ),
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 20,
          fontWeight: FontWeight.bold
        )
      )
      ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
        id: 't0',
        title: 'Xbox Series X',
        value: 2500,
        date: DateTime.now().subtract(Duration(days: 33))),
    Transaction(
        id: 't1',
        title: 'Novo Tênis de Corrida',
        value: 310.76,
        date: DateTime.now().subtract(Duration(days: 3))),
    Transaction(
        id: 't2', 
        title: 'Conta de Luz', 
        value: 221.30, 
        date: DateTime.now().subtract(Duration(days: 4))),
    Transaction(
        id: 't3', 
        title: 'Cartão de Crédito', 
        value: 100211.30, 
        date: DateTime.now()),
    Transaction(
        id: 't4', 
        title: 'Lanche', 
        value: 11.30, 
        date: DateTime.now())
  ];

  
  List<Transaction> get _recentTransactions{
    return _transactions.where((element) => element.date.isAfter(DateTime.now().subtract((Duration(days: 7))))).toList();
  }

   _addTransaction(String title, double value){
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now()
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context){
    showModalBottomSheet(
      context: context, 
      builder: (_) {
        return TransactionForm(_addTransaction);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Despesas Pessoais'),
        actions: [
          IconButton(
            onPressed: () => _openTransactionFormModal(context), 
            icon: Icon(Icons.add))
        ],),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Chart(_recentTransactions),
              TransactionList(_transactions)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _openTransactionFormModal(context), 
          child: Icon(Icons.add)
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        );
  }
}
