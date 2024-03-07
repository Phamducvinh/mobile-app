import 'package:book_booking/models/books.dart';
import 'package:book_booking/presentation/screen/details/detail_page.dart';
import 'package:flutter/material.dart';

class AnimeBooks extends StatelessWidget{
  final List<Books> booksList;

  const AnimeBooks({super.key, required this.booksList});
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: booksList.map((book){
          return GestureDetector(
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => DetailPage(books: book))
              );
            },
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 2,
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: SizedBox(
                          height: 150,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(book.imgUrl.toString(),fit: BoxFit.fill,),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        book.title.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                          fontSize: 14
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          // fixedSize: const Size.fromHeight(10),
                          minimumSize: const Size(100, 30),
                        ),
                        onPressed: (){}, 
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '\$',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15
                              ),
                            ),
                            Text(
                              book.price.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 25,)
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}