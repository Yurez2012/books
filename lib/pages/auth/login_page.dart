import 'package:books/widgets/widget_input.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../services/auth_service.dart';
import '../../widgets/widget_error_message.dart';
import '../../widgets/widget_title.dart';
import '../../config/route_app.dart' as route_app;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await AuthService().signInWithEmailAndPassword(
          email: _controllerEmail.text,
          password: _controllerPassword.text
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _submitButton() {
    return ElevatedButton(
        onPressed: signInWithEmailAndPassword,
        child: Text('Login')
    );
  }

  Widget _linkWithRoute() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            elevation: 0,
            side: const BorderSide(
              width: 1.0,
              color: Colors.transparent,
            )
        ),
        onPressed: () {
          Navigator.pushNamed(context, route_app.register);
        },
        child: Text('Register')
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: WidgetTitle(title: 'Login'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WidgetInput(title: 'email', controller: _controllerEmail),
            WidgetInput(title: 'password', controller: _controllerPassword),
            WidgetErrorMessage(message: errorMessage),
            _submitButton(),
            _linkWithRoute(),
          ],
        ),
      ),
    );
  }
}
