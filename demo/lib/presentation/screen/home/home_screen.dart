import 'package:book_booking/app/constants/constants.dart';
import 'package:book_booking/models/books.dart';
import 'package:book_booking/presentation/screen/home/book_list.dart';
import 'package:book_booking/presentation/widget/adventure_books.dart';
import 'package:book_booking/presentation/widget/anime_books.dart';
import 'package:book_booking/presentation/widget/drawer.dart';
import 'package:book_booking/presentation/widget/headline.dart';
import 'package:book_booking/presentation/widget/horror_books.dart';
import 'package:book_booking/presentation/widget/novel_books.dart';
import 'package:book_booking/presentation/widget/popular_books.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final TextEditingController searchController = TextEditingController();

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      endDrawer: const DrawerWidget(),
      body: SingleChildScrollView(
        //physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: height / 2,
              child: Stack(
                children: [
                  Container(
                    height: height / 2.5,
                    //height: constraints.maxHeight * 0.8,
                    //width: width,
                    //margin: const EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                      color: AppColors.lightBlue,
                      borderRadius: const BorderRadius.only(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Literary Journey",
                                style: Theme.of(context).textTheme.headline1
                              ),
                              InkWell(
                                onTap: (){
                                    _scaffoldKey.currentState?.openEndDrawer();
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        offset: const Offset(0, 3),
                                      )
                                    ]
                                  ),
                                  child: Icon(CupertinoIcons.bars),
                                ),
                              )
                            ],
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
                                    width: 1, color: AppColors.black),
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
                              Text('Most Popular',
                                  style: Theme.of(context).textTheme.headline2),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BookList(name: "Fiction")));
                                },
                                child: Text(
                                  "See All",
                                  style: Theme.of(context).textTheme.headline4,
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
                      height: height / 4.2,
                      //height: constraints.maxHeight * 0.38,
                      margin: const EdgeInsets.only(left: 16),
                      child: const PopularBooks(),
                    ),
                  ),
                ],
              ),
            ),
            Headline(
              category: "Anime",
              showAll: "Anime",
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(16, 8, 0, 0),
              //color: Colors.grey.shade100,
              height: height / 3.4,
              child: const AnimeBooks(),
            ),
            Headline(
              category: "Action & Adventure",
              showAll: "Action & Adventure",
            ),
            Container(
              //color: Colors.yellow,
              margin: const EdgeInsets.fromLTRB(16, 8, 0, 0),
              height: height / 3.4,
              child: const AdventureBooks(),
            ),
            Headline(
              category: "Novel",
              showAll: "Novel",
            ),
            Container(
              //color: Colors.yellow,
              margin: const EdgeInsets.fromLTRB(16, 8, 0, 0),
              height: height / 3.4,
              child: const NovelBooks(),
            ),
            Headline(
              category: "Horror",
              showAll: "Horror",
            ),
            Container(
              //color: Colors.yellow,
              margin: const EdgeInsets.fromLTRB(16, 8, 0, 0),
              height: height / 3.4,
              child: const HorrorBooks(),
            ),
          ],
        ),
      ),
    );
  }
}
