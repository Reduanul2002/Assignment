import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign up')),
      body: Form(
        key: _formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              Text(
                'Sign up with email and password',
                style: TextTheme.of(context).titleLarge,
              ),
              TextFormField(
                controller: _emailTEController,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordTEController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
              ),
              FilledButton(onPressed: _onTapSignUpButton, child: Text('Sign up')),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onTapSignUpButton() async{
    if (_formkey.currentState!.validate()) {
      try {
           await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: _emailTEController.text,
            password: _passwordTEController.text);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('User creat successfull'),
            )
        );
      }catch (e){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.toString()),
            )
        );
      }
    }
    @override
    void  q1dispose() {
      _emailTEController.dispose();
      _passwordTEController.dispose();
      super.dispose();
    }
  }
}
