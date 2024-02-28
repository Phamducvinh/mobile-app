import "package:book_booking/models/books.dart";
import "package:flutter/material.dart";

class BookDetail extends StatelessWidget{
  final Books book;
  const BookDetail({super.key, required this.book});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Center(
        child: Column(
          children: [
            Text(
              book.title.toString(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              book.author.toString(),
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Book',
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    fixedSize: const Size.fromHeight(10),                    
                  ),
                  onPressed: (){}, 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '\$',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14
                        ),
                      ),
                      Text(
                        book.price.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14
                        ),
                      )
                    ],
                  )
                ),
                Text(
                  book.price.toString(),
                  style: const TextStyle(
                    fontSize: 18
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}