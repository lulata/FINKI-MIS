import 'package:dom2/Components/Logo.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dom2/Components/InputField.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _FormExampleState();
}

class _FormExampleState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _navigateToRegister() {
    Future.delayed(Duration.zero, () {
      Navigator.pushReplacementNamed(context, '/register');
    });
  }

  Future<void> _authAction() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      _showSuccessDialog(
          "Login Successful", "You have successfully logged in!");
      Navigator.pushReplacementNamed(context, '/');
    } catch (e) {
      _showErrorDialog(
          "Authentication Error", "Error during authentication: $e");
    }
  }

  void _showSuccessDialog(String title, String message) {
    _scaffoldKey.currentState?.showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    ));
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(child: Logo()),
          InputField(
            errorMessage: "Email field cannot be empty",
            isSecure: false,
            placeholder: "Email",
            pt: 20,
            pb: 12,
            controller: _emailController,
          ),
          InputField(
            errorMessage: "Password field cannot be empty",
            isSecure: true,
            placeholder: "Password",
            pb: 12,
            controller: _passwordController,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  surfaceTintColor: Colors.white,
                  shadowColor: Colors.transparent,
                  minimumSize: const Size.fromHeight(45), // NEW
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20)),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Process data.
                  _authAction();
                }
              },
              child: const Text('Login'),
            ),
          ),
          const Center(
            child: Text("Don't have an account?"),
          ),
          Center(
            child: InkWell(
                child: const Text('Register here',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center),
                onTap: () => {
                      _navigateToRegister(),
                    }),
          )
        ],
      ),
    );
  }
}
