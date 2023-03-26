import 'package:books/auth_or_home.dart';
import 'package:books/config/route_app.dart' as route_app;
import 'package:books/pages/auth/login_page.dart';
import 'package:books/pages/auth/register_page.dart';
import 'package:books/pages/books_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Colors.orange),
    initialRoute: route_app.home,
    routes: {
      route_app.home: (context) => AuthOrHome(),
      route_app.login: (context) => LoginPage(),
      route_app.register: (context) => RegisterPage(),
      route_app.books: (context) => BooksPage(),
    },
  ));
}
