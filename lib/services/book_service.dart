import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/book.dart'; // new

class BookService {
  static Future<List<Book>> getBooks() async {
    List<Book> books = [];

    await FirebaseFirestore.instance.collection('books').get().then((querySnapshot) {
      books = querySnapshot.docs.map((f){
        return Book.fromJson(f.data());
      }).toList();
    });

    return books;
  }

  Future<void> createBook(book) async {
    FirebaseFirestore.instance.collection('books').add(book);
  }
}
