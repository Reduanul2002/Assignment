import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import '../viewmodels/transaction_provider.dart';
import '../models/transaction_model.dart';

class AddTransactionScreen extends StatefulWidget {
  @override
  State<AddTransactionScreen> createState() =>
      _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  String type = "income";

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransactionProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text("Add Transaction")),
      body: Column(
        children: [
          TextField(controller: titleController, decoration: InputDecoration(labelText: "Title")),
          TextField(controller: amountController, decoration: InputDecoration(labelText: "Amount"), keyboardType: TextInputType.number),

          DropdownButton<String>(
            value: type,
            items: [
              DropdownMenuItem(value: "income", child: Text("Income")),
              DropdownMenuItem(value: "expense", child: Text("Expense")),
            ],
            onChanged: (value) {
              setState(() {
                type = value!;
              });
            },
          ),

          ElevatedButton(
            onPressed: () {
              final newTransaction = TransactionModel(
                id: Random().nextDouble().toString(),
                title: titleController.text,
                amount: double.parse(amountController.text),
                date: DateTime.now(),
                type: type,
              );

              provider.addTransaction(newTransaction);
              Navigator.pop(context);
            },
            child: Text("Save"),
          )
        ],
      ),
    );
  }
}