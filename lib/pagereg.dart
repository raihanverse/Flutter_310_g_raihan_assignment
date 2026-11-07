import 'package:flutter/material.dart';
import 'regex.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();

  final companyNameController = TextEditingController();
  final companyIdController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  void dispose() {
    companyNameController.dispose();
    companyIdController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  String? checkCompanyName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the company name';
    }
    if (Patterns.companyName.hasMatch(value.trim()) == false) {
      return 'Use letters, numbers, spaces, dots, & and - only';
    }
    return null;
  }

  String? checkCompanyId(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the company ID';
    }
    if (Patterns.companyId.hasMatch(value.trim()) == false) {
      return 'Company ID must have exactly 16 digits';
    }
    return null;
  }

  String? checkEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the company email';
    }
    if (Patterns.email.hasMatch(value.trim()) == false) {
      return 'This email is not valid';
    }
    return null;
  }

  String? checkPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (Patterns.password.hasMatch(value) == false) {
      return 'At least 8 characters with upper, lower and a number';
    }
    return null;
  }

  String? checkConfirm(String? value) {
    if (value != passwordController.text) {
      return 'The passwords are not the same';
    }
    return null;
  }

  void register() {
    bool formIsValid = formKey.currentState!.validate();
    if (formIsValid == false) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Registration details look good')),
    );
  }

  void goBack() {
    Navigator.pop(context);
  }

  Widget buildCompanyNameField() {
    return TextFormField(
      controller: companyNameController,
      decoration: InputDecoration(
        labelText: 'Company Name',
        border: OutlineInputBorder(),
      ),
      validator: checkCompanyName,
    );
  }

  Widget buildCompanyIdField() {
    return TextFormField(
      controller: companyIdController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Company ID',
        border: OutlineInputBorder(),
      ),
      validator: checkCompanyId,
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

  Widget buildConfirmField() {
    return TextFormField(
      controller: confirmController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        border: OutlineInputBorder(),
      ),
      validator: checkConfirm,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Company Registration'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              buildCompanyNameField(),
              SizedBox(height: 16),
              buildCompanyIdField(),
              SizedBox(height: 16),
              buildEmailField(),
              SizedBox(height: 16),
              buildPasswordField(),
              SizedBox(height: 16),
              buildConfirmField(),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: register,
                child: Text('Register'),
              ),
              TextButton(
                onPressed: goBack,
                child: Text('Already registered? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
