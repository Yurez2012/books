import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../services/auth_service.dart';
import '../../widgets/widget_error_message.dart';
import '../../widgets/widget_input.dart';
import '../../widgets/widget_title.dart';
import '../../config/route_app.dart' as route_app;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? errorMessage = '';

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await AuthService().createUserWithEmailAndPassword(
          email: _controllerEmail.text,
          password: _controllerPassword.text
      );

      Navigator.pushNamed(context, route_app.home);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _submitButton() {
    return ElevatedButton(
        onPressed: createUserWithEmailAndPassword,
        child: Text('Register')
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: WidgetTitle(title: 'Register'),
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
            _submitButton()
          ],
        ),
      ),
    );
  }
}
