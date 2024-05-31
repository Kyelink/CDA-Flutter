import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {return Scaffold(
    body:Center(child:Row(
      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
      children:[
      FloatingActionButton(onPressed: (){
         Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Scaffold(
                      appBar: AppBar(),
                      body: LoginForm())));
      },
       child: Column(
        children:[Icon(Icons.login),Text("Login")]),
      ),
      FloatingActionButton(onPressed: (){
         Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Scaffold(
                      appBar: AppBar(),
                      body: SignupForm())));
      },
       child: Column(children:[Icon(Icons.format_align_left_outlined),Text("Signup")])
      )
    ],
    
    ))
  );}
}

// Create a Form widget.
class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

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
            decoration: InputDecoration(hintText: 'Enter your mail'),
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
            decoration: InputDecoration(hintText: 'Enter password'),
            obscureText: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // .currentState! is used to access the State object of the current
                //  StatefulWidget instance in Flutter. It is used in the context
                //  of a GlobalKey, which is a unique identifier that is associated
                //   with a widget and allows us to refer to the widget's State
                //   object from outside the widget.

                // The exclamation mark (!) at the end of .currentState is the
                // null-aware access operator in Dart. It is used to assert that
                // the value of .currentState is not null, which is required
                // because accessing the currentState property on a GlobalKey
                // instance returns a nullable State object.

                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
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
  const SignupForm({Key? key}) : super(key: key);

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
            decoration: InputDecoration(hintText: 'Enter your mail'),
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
            decoration: InputDecoration(hintText: 'Enter your username'),
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
            decoration: InputDecoration(hintText: 'Enter password'),
            obscureText: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
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