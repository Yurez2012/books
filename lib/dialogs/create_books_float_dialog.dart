import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/book.dart';
import '../services/book_service.dart';
import '../widgets/widget_input.dart';
import '../widgets/widget_error_message.dart';
import 'package:books/config/route_app.dart' as route_app;

class CreateBooksFloatDialog extends StatefulWidget {
  @override
  _CreateBooksFloatDialogState createState() {
    return _CreateBooksFloatDialogState();
  }
}

class _CreateBooksFloatDialogState extends State<CreateBooksFloatDialog> {
  String? errorMessage = '';

  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _dialogBuilder(context);
      },
      backgroundColor: Colors.green,
      child: const Icon(Icons.menu_book_sharp),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Додати книгу'),
          content: const Text('Форма'),
          actions: <Widget>[
            Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  WidgetInput(title: 'title', controller: _controllerTitle),
                  WidgetInput(title: 'description', controller: _controllerDescription),
                  WidgetErrorMessage(message: errorMessage),
                  _submitButton(),
                ],
              ),
            ),
          ],

        );
      },
    );
  }

  Future<void> createBook() async {
    try {
      Book book = Book(
          title: _controllerTitle.text,
          description: _controllerDescription.text
      );

      await BookService().createBook(book.toJson());

      Navigator.pushNamed(context, route_app.books);
    } on FirebaseAuthException catch (e) {}
  }

  Widget _submitButton() {
    return ElevatedButton(
        onPressed: createBook,
        child: Text('Зберегти книгу')
    );
  }
}
