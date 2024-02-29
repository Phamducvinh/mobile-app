import 'package:book_booking/models/books.dart';
import 'package:flutter/material.dart';

class BookImage extends StatelessWidget{
  final Books image;
  const BookImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: 180,
            decoration: const BoxDecoration(
              color:Color(0xffF9CFE3),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 200,
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image(
                  image: AssetImage(image.imgUrl!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 16,
            child: OutlinedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 1)),
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
              label: const Text(
                "",
              ),
            ),
          )
        ],
      ),
    );
  }
}