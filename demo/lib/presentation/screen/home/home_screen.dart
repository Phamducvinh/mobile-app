import 'package:book_booking/models/books.dart';
import 'package:book_booking/presentation/widget/adventure_books.dart';
import 'package:book_booking/presentation/widget/anime_books.dart';
import 'package:book_booking/presentation/widget/headline.dart';
import 'package:book_booking/presentation/widget/horror_books.dart';
import 'package:book_booking/presentation/widget/novel_books.dart';
import 'package:book_booking/presentation/widget/popular_books.dart';
import 'package:flutter/material.dart';

class Home_Screen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    List<Books> popularBooks = Books.generatePopularBooks();
    List<Books> animeBooks = Books.generateAnimeBooks();
    List<Books> adventureBooks = Books.generateAdventureBooks();
    List<Books> horrorBooks = Books.generateHorrorBooks();
    List<Books> novelBooks = Books.generateNovelBooks();
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
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
                            // color: Color.fromARGB(255, 9, 203, 164),
                            color: Color.fromRGBO(182, 239, 243, 1),
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
                                  onTap: () {
                                    // showSearch(
                                    //     context: context,
                                    //     delegate: CustomSearchDelegate());
                                  },
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
                                    InkWell(
                                      onTap: (){

                                      },
                                      child: const Text(
                                        'See all',
                                        style: TextStyle(
                                          fontSize: 20
                                        ),
                                      ),
                                    ),
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
                            height: height / 5,
                            //height: constraints.maxHeight * 0.38,
                            margin: const EdgeInsets.only(left: 16),
                            child: Popular_Books(booksList: popularBooks,),
                          ),
                        ),
                      ],
                    ),
                  ),
                
                  Headline(category: 'Anime', showAll: 'Anime'),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      // height: height / 5,
                      //height: constraints.maxHeight * 0.38,
                      margin: const EdgeInsets.fromLTRB(16, 10, 0, 0),
                      child: AnimeBooks(booksList: animeBooks),
                    ),
                  ),
            
            
                  Headline(category: 'Action & Adventure', showAll: 'Action & Adventure'),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      // height: height / 5,
                      //height: constraints.maxHeight * 0.38,
                      margin: const EdgeInsets.fromLTRB(16, 10, 0, 0),
                      child: AdventureBooks(booksList: adventureBooks),
                    ),
                  ),
            
            
                  Headline(category: 'Horror', showAll: 'Horror'),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      // height: height / 5,
                      //height: constraints.maxHeight * 0.38,
                      margin: const EdgeInsets.fromLTRB(16, 10, 0, 0),
                      child: HorrorBooks(booksList: horrorBooks),
                    ),
                  ),
            
            
                  Headline(category: 'Novel', showAll: 'Novel'),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      // height: height / 5,
                      //height: constraints.maxHeight * 0.38,
                      margin: const EdgeInsets.fromLTRB(16, 10, 0, 0),
                      child: NovelBooks(booksList: novelBooks),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}