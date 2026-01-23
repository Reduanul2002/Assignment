import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_p/Assignment%2025/home_screen.dart';
import 'sign_up_screen.dart';


class signInScreen extends StatefulWidget {
  const signInScreen({super.key});

  @override
  State<signInScreen> createState() => _signInScreenState();
}

class _signInScreenState extends State<signInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: Form(
        key: _formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              Text(
                'Sign in with email and password',
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
              FilledButton(onPressed: _onTapSignInButton,
                child: Text('Sign in'),
              ),
              TextButton(onPressed: _onTapSignUpButton,
                child: Text('Creat new account'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onTapSignInButton() async {
    if (_formkey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
            email: _emailTEController.text,
            password: _passwordTEController.text);
        Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (_) => HomeScreen()), (
            predicate) => false,
        );
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.message.toString()),
            )
        );
      }
    }
  }
    void _onTapSignUpButton() {
      Navigator.push(
             context, MaterialPageRoute(builder: (_) => SignUpScreen())
       );

    }
    @override
    void  dispose() {
      _emailTEController.dispose();
      _passwordTEController.dispose();
      super.dispose();
    }
  }

