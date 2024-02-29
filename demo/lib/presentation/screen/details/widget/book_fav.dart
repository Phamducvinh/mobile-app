import 'package:flutter/material.dart';

class BookFav extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceAround,
        children: [
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
                side: const BorderSide(width: 1)),
            child: const Text(
              "VIEW ONLINE",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black
              ),
            ),
          ),
          OutlinedButton.icon(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
                side: const BorderSide(width: 1)),
            icon: const Icon(
              Icons.favorite_outline,
              color: Colors.black,
            ),
            label: const Text(
              "WISHLIST",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black
              ),
            ),
          )
        ],
      ),
    );
  }
}