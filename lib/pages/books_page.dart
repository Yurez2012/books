import 'package:flutter/material.dart';
import '../dialogs/create_books_float_dialog.dart';
import '../models/book.dart';
import '../services/book_service.dart';
import '../widgets/widget_app_bar.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({Key? key}) : super(key: key);

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  String? errorMessage = '';

  List<Book> _books = [];

  @override
  void initState() {
    super.initState();
    _setupBooks();
  }

  _setupBooks() async {
    List<Book> books = await BookService.getBooks();
    setState(() {
      _books = books;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetAppBar(),
      body: Scaffold(
        body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: _books.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.red,
              child: Center(child: Text(_books[index].title)),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        ),
      ),
      floatingActionButton: CreateBooksFloatDialog(),
    );
  }
}

