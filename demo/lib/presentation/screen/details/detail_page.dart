import 'package:book_booking/models/books.dart';
import 'package:book_booking/presentation/screen/details/widget/book_detail.dart';
import 'package:book_booking/presentation/screen/details/widget/book_image.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget{
  final Books books;
  const DetailPage({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BookImage(
              image: books,
            ),
            BookDetail(
              book: books,
            )
          ],
        ),
      ),
    );
  }
}