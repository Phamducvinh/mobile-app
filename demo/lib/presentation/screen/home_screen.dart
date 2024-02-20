import 'package:demo/models/books.dart';
import 'package:demo/presentation/widget/anime_books.dart';
import 'package:demo/presentation/widget/popular_books.dart';
import 'package:flutter/material.dart';

class Home_Screen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    List<Books> popularBooks = Books.generatePopularBooks();
    List<Books> animeBooks = Books.generateAnimeBooks();
    double height = MediaQuery.of(context).size.height;
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 2,
              child: Stack(
                children: [
                  Container(
                    height: height / 2.4,
                    //height: constraints.maxHeight * 0.8,
                    //width: width,
                    //margin: const EdgeInsets.only(left: 16),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 9, 203, 164),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(45),
                        bottomRight: Radius.circular(45),
                      ),
                    ),
                    child: SafeArea(
                      minimum: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Text(
                            "Book Store",
                            style: Theme.of(context).textTheme.headlineLarge
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              height: 50,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    width: 1, 
                                    color: Colors.black),
                              ),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Search for Books"),
                                  Icon(Icons.search),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(
                            flex: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Most Popular',
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                              const Text(
                                'See all',
                                style: TextStyle(
                                  fontSize: 20
                                ),
                              )
                            ],
                          ),
                          const Spacer(
                            flex: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: height / 5.3,
                      //height: constraints.maxHeight * 0.38,
                      margin: const EdgeInsets.only(left: 16),
                      child: Popular_Books(booksList: popularBooks,),
                    ),
                  ),
                ],
              ),
            ),
            // const Spacer(
            //   flex: 2,
            // ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Anime',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const Text(
                    'See all',
                    style: TextStyle(
                      fontSize: 20
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: height / 5.3,
                //height: constraints.maxHeight * 0.38,
                margin: const EdgeInsets.only(left: 16),
                child: AnimeBooks(booksList: animeBooks),
              ),
            ),
          ],
        ),
      ),
    );
  }
}