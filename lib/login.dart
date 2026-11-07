import 'package:flutter/material.dart';
import 'regex.dart';
import 'pagereg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? checkEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your company email';
    }
    if (Patterns.email.hasMatch(value.trim()) == false) {
      return 'This email is not valid';
    }
    return null;
  }

  String? checkPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  void login() {
    bool formIsValid = formKey.currentState!.validate();
    if (formIsValid == false) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Login details look good')),
    );
  }

  void openRegisterPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return RegisterPage();
        },
      ),
    );
  }

  Widget buildEmailField() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Company Email',
        border: OutlineInputBorder(),
      ),
      validator: checkEmail,
    );
  }

  Widget buildPasswordField() {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(),
      ),
      validator: checkPassword,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Company Login'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              buildEmailField(),
              SizedBox(height: 16),
              buildPasswordField(),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: login,
                child: Text('Login'),
              ),
              TextButton(
                onPressed: openRegisterPage,
                child: Text('No account? Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
