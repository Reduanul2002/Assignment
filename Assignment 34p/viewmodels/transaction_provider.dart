import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/transaction_model.dart';

class TransactionProvider extends ChangeNotifier {
  List<TransactionModel> _transactions = [];

  List<TransactionModel> get transactions => _transactions;

  double get totalIncome => _transactions
      .where((t) => t.type == "income")
      .fold(0, (sum, item) => sum + item.amount);

  double get totalExpense => _transactions
      .where((t) => t.type == "expense")
      .fold(0, (sum, item) => sum + item.amount);

  double get balance => totalIncome - totalExpense;

  // Load data
  Future<void> loadTransactions() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('transactions');

    if (data != null) {
      final List decoded = jsonDecode(data);
      _transactions = decoded
          .map((e) => TransactionModel.fromJson(e))
          .toList();
      notifyListeners();
    }
  }

  // Save data
  Future<void> saveTransactions() async {
    final prefs = await SharedPreferences.getInstance();
    final data =
    jsonEncode(_transactions.map((e) => e.toJson()).toList());
    await prefs.setString('transactions', data);
  }

  // Add transaction
  void addTransaction(TransactionModel transaction) {
    _transactions.add(transaction);
    saveTransactions();
    notifyListeners();
  }

  // Delete
  void deleteTransaction(String id) {
    _transactions.removeWhere((t) => t.id == id);
    saveTransactions();
    notifyListeners();
  }
}