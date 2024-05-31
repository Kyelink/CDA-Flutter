import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> signupUser(String email, String password, String username) async {
  print("during");

  final url = Uri.parse('http://localhost:3000/api/signup');
  final headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
  };
  final body = {
    'password': password,
    'email': email,
    'username' :username
  };
  final response = await http.post(url, headers: headers, body: body);
  print("after response");

  if (response.statusCode == 200) {
    // Successful request
    print('Response data: ${response.body}');
  } else {
    // Error handling
    print('Request failed with status: ${response.statusCode}');
  }
}


Future<void> loginUser(String email, String password) async {
  

  final url = Uri.parse('http://localhost:3000/api/login');
  final headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
  };
  final body = {
    'password': password,
    'email': email
  };
  final response = await http.post(url, headers: headers, body: body);
  print(response);

  if (response.statusCode == 200) {
    // Successful request
    print('Response data: ${response.body}');
  } else {
    // Error handling
    print('Request failed with status: ${response.statusCode}');
  }
}


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          heroTag: "Login",
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Scaffold(appBar: AppBar(), body: const LoginForm())));
          },
          child: const Column(children: [Icon(Icons.login), Text("Login")]),
        ),
        FloatingActionButton(
            heroTag: "Signup",
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Scaffold(
                          appBar: AppBar(), body: const SignupForm())));
            },
            child: const Column(children: [
              Icon(Icons.format_align_left_outlined),
              Text("Signup")
            ]))
      ],
    )));
  }
}

// Create a Form widget.
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginState createState() {
    return LoginState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class LoginState extends State<LoginForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final _mailController = TextEditingController();
  final _pWController = TextEditingController();

  @override
  void dispose() {
    _mailController.dispose();
    _pWController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _mailController,
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your mail';
              }
              return null;
            },
            decoration: const InputDecoration(hintText: 'Enter your mail'),
          ),
          TextFormField(
            controller: _pWController,
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter password';
              }
              return null;
            },
            decoration: const InputDecoration(hintText: 'Enter password'),
            obscureText: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  
                  loginUser(_mailController.text, _pWController.text);
                  
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content:
                            Text('Submitted mail : ${_mailController.text}')),
                  );
                }
              },
              child: const Text('Se connecter'),
            ),
          ),
        ],
      ),
    );
  }
}

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  SignupState createState() {
    return SignupState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class SignupState extends State<SignupForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final _mailController = TextEditingController();
  final _pWController = TextEditingController();
  final _usernameController = TextEditingController();

  @override
  void dispose() {
    _mailController.dispose();
    _pWController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _mailController,
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your mail';
              }
              return null;
            },
            decoration: const InputDecoration(hintText: 'Enter your mail'),
          ),
          TextFormField(
            controller: _usernameController,
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your username';
              }
              return null;
            },
            decoration: const InputDecoration(hintText: 'Enter your username'),
          ),
          TextFormField(
            controller: _pWController,
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter password';
              }
              return null;
            },
            decoration: const InputDecoration(hintText: 'Enter password'),
            obscureText: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  signupUser(_mailController.text, _pWController.text, _usernameController.text);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content:
                            Text('Submitted mail : ${_mailController.text}')),
                  );
                }
              },
              child: const Text('Se connecter'),
            ),
          ),
        ],
      ),
    );
  }
}
