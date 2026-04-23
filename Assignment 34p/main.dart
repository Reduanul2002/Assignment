import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/transaction_provider.dart';
import 'views/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TransactionProvider()..loadTransactions(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: HomeScreen(),
      ),
    );
  }
}