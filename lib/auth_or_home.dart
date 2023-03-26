import 'services/auth_service.dart';
import 'pages/auth/login_page.dart';
import 'pages/books_page.dart';
import 'package:flutter/material.dart';

class AuthOrHome extends StatefulWidget {
  const AuthOrHome({Key? key}) : super(key: key);

  @override
  State<AuthOrHome> createState() => _AuthOrHomeState();
}

class _AuthOrHomeState extends State<AuthOrHome> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return BooksPage();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
