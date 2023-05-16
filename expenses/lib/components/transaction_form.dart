import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {

  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();

  final _valueController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  _submitForm(){
   final title = _titleController.text;
   final value = double.tryParse(_valueController.text) ?? 0.0; 
   
   if(title.isEmpty || value <= 0){
      return;
   }
      
   
   widget.onSubmit(title, value);                  
  }

  _showDatePicker(){
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2019), 
      lastDate: DateTime.now(),
    ).then((value){
      if(value == null){
        return;
      }
      setState(() {
        _selectedDate = value;
      }); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(labelText: 'Título'),
                    ),
                    TextField(
                      controller: _valueController,
                      decoration: InputDecoration(labelText: 'Valor (R\$)'),
                      //O Keyboard TextInputType.numberWithOptions(decimal: true) serve tanto para iOS quanto para Android
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      onSubmitted: (_) => _submitForm()
                    ),
                    Row(children: [
                      Text( _selectedDate == null ? 'Nenhuma data selecionada!' : 'Data selecionada ${DateFormat('dd/MM/y').format(_selectedDate)}'),
                      TextButton(onPressed: _showDatePicker, child: Text('Selecionar Data'))
                    ],),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [                        
                        ElevatedButton(
                          onPressed: _submitForm,
                          child: Text('Nova Transação'), 
                          style: TextButton.styleFrom
                                  (foregroundColor: Colors.purple,
                                   textStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)
                                   
                                  ),
                          
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
  }
}