import 'package:demo/models/books.dart';
import 'package:flutter/material.dart';

class AnimeBooks extends StatelessWidget{
  final List<Books> booksList;

  const AnimeBooks({super.key, required this.booksList});
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          
        ],
      ),
    );
  }
}