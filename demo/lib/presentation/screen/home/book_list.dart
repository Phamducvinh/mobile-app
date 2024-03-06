import 'package:book_booking/app/constants/constants.dart';
import 'package:book_booking/models/books.dart';
import 'package:book_booking/presentation/screen/details/detail_page.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

// ignore: must_be_immutable
class BookList extends StatelessWidget{
  final List<Books> booksList;
  String name;
  final _random = math.Random();

  BookList({Key? key, required this.name, required this.booksList}) : super(key: key);
  // BookList({Key? key, required this.name}) : super(key: key);
  

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          name,
          style: const TextStyle(
            color: Colors.black
          ),
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //childAspectRatio: 16 / 15,
          crossAxisCount: 2,
          mainAxisExtent: 250,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0
        ),
        itemCount: booksList.length,
        itemBuilder: (context, index){
          final book = booksList[index];
          return Padding(
            padding: const EdgeInsets.all(16),
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailPage(books: book))
                );
              },
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 130,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            height: 80,
                            decoration: BoxDecoration(
                                color:
                                    boxColors[_random.nextInt(7)],
                                borderRadius:
                                    BorderRadius.circular(12)),
                          ),
                          Positioned(
                            top: 5,
                            child: Card(
                              margin: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(12)),
                              child: Card(
                                elevation: 2,
                                margin: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                child: SizedBox(
                                  height: 120,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(book.imgUrl.toString(),fit: BoxFit.fill,),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            book.author.toString(),
                            maxLines: 1,
                          ),
                          Text(
                            book.title.toString(),
                            maxLines: 1,
                          ),
                          Container(
                            height: 30,
                            width: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.circular(12)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  '\$',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  book.price.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          ),
                        ],
                      ),
                    )
                  ]
                ),
              ),
            ),
          );
        }
      ),
    );  
  }
}