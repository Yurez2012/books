import 'package:flutter/material.dart';

@immutable
class Book {
  const Book({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  toJson() => {
    "title": title,
    "description": description,
  };

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'],
      description: json['description'],
    );
  }

  @override
  List<Object?> get props => [title, description];
}