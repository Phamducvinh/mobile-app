import "package:demo/models/books.dart";
import "package:flutter/material.dart";

class NovelBooks extends StatelessWidget{
  final List<Books> booksList;

  const NovelBooks({super.key, required this.booksList});
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: booksList.map((book){
          return Row(
            children: [
              SizedBox(
                width: 100,
                child: Column(
                  children: [
                    Card(
                      elevation: 2,
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(book.imgUrl.toString()),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      book.title.toString(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 16,
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
          );
        }).toList(),
      ),
    );
  }  
}