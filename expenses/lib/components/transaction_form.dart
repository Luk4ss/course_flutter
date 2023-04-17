import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {

  final titleController = TextEditingController();
  final valueController = TextEditingController();
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  _submitForm(){
   final title = titleController.text;
   final value = double.tryParse(valueController.text) ?? 0.0; 
   
   if(title.isEmpty || value <= 0){
      return;
   }
      
   
   onSubmit(title, value);                  
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
                      controller: titleController,
                      decoration: InputDecoration(labelText: 'Título'),
                    ),
                    TextField(
                      controller: valueController,
                      decoration: InputDecoration(labelText: 'Valor (R\$)'),
                      //O Keyboard TextInputType.numberWithOptions(decimal: true) serve tanto para iOS quanto para Android
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      onSubmitted: (_) => _submitForm()
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [                        
                        TextButton(
                          onPressed: _submitForm,
                          child: Text('Nova Transação'), 
                          style: TextButton.styleFrom(foregroundColor: Colors.purple)
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
  }
}