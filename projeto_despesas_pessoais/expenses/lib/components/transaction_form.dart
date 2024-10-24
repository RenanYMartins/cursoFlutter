import 'package:flutter/material.dart';
import 'adaptative_button.dart';
import 'adaptative_textfield.dart';
import 'adaptative_date_picker.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({super.key, required this.onSubmit});

  final void Function(String, double, DateTime) onSubmit;

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }

    widget.onSubmit(title, value, _selectedDate!);
  }

  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.only(
                top: 10,
                right: 10,
                left: 10,
                bottom: 10 +
                    MediaQuery.of(context)
                        .viewInsets
                        .bottom // leva em consideracao a abertura do teclado
                ),
            child: Column(
              children: [
                AdaptativeTextField(
                  label:'Título',
                  controller: titleController,
                  onSubmitted: (_) => _submitForm(),
                ),
                AdaptativeTextField(
                  label: 'Valor (R\$)',
                  controller: valueController,
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal:
                          true), // o ".number" poderia atender, mas no IOS iria faltar os separadores de casas decimais
                  onSubmitted: (_) =>
                      _submitForm(), // (_) significa que o parametro passado na função será ignorado
                ),
                AdaptativeDatePicker(selectedDate: _selectedDate, onDateChanged: (newDate) {
                  _selectedDate = newDate;
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AdaptativeButton(label: 'Nova Transação', onPressed: _submitForm),
                    // ElevatedButton(
                    //   onPressed: _submitForm,
                    //   child: Text(
                    //     'Nova Transação',
                    //     style: TextStyle(
                    //       color: Theme.of(context).textTheme.labelLarge?.color,
                    //     ),
                    //   ),
                    // ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
