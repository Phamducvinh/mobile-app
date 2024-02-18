import 'package:demo/models/books.dart';
import 'package:flutter/material.dart';

class Popular_Books extends StatelessWidget {
  final List<Books> booksList;

  const Popular_Books({Key? key, required this.booksList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: booksList.map((book) {
          return Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(book.imgUrl.toString()),
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(book.author.toString()),
                          Text(
                            book.title.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(book.categories.toString()),
                        ],
                      )
                    ),
                    // SizedBox(height: 10,),
                    Expanded(
                      flex: 0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          fixedSize: const Size.fromWidth(100),
                        ),
                        onPressed: (){}, 
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '\$',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18
                              ),
                            ),
                            Text(
                              book.price.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18
                              ),
                            )
                          ],
                        )
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}