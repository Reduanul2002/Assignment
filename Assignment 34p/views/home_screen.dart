import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/transaction_provider.dart';
import 'add_transaction_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransactionProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Expense Tracker")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => AddTransactionScreen()));
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          // Dashboard
          Card(
            child: Column(
              children: [
                Text("Balance: ${provider.balance}"),
                Text("Income: ${provider.totalIncome}"),
                Text("Expense: ${provider.totalExpense}"),
              ],
            ),
          ),

          // List
          Expanded(
            child: ListView.builder(
              itemCount: provider.transactions.length,
              itemBuilder: (context, index) {
                final t = provider.transactions[index];
                return ListTile(
                  title: Text(t.title),
                  subtitle: Text(t.amount.toString()),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      provider.deleteTransaction(t.id);
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}