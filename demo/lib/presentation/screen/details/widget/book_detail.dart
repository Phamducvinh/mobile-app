import "package:book_booking/models/books.dart";
import "package:book_booking/presentation/screen/details/widget/book_fav.dart";
import "package:flutter/material.dart";

class BookDetail extends StatelessWidget{
  final Books book;
  const BookDetail({super.key, required this.book});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  book.title.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
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
                BookFav(),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Details',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            child: Row(
              children: [
                const Column(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Author",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text("Publisher",
                      style: TextStyle(
                        fontSize: 15,
                      ),    
                    ),
                    Text("Published Date",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text("Category",
                      style: TextStyle(
                        fontSize: 15
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.author.toString(),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        book.author.toString(),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        book.author.toString(),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        book.author.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}