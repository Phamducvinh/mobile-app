import 'package:book_booking/models/books.dart';
import 'package:book_booking/presentation/screen/home/book_list.dart';
import 'package:flutter/material.dart';

class Headline extends StatelessWidget{
  String category;
  String showAll;
  List<Books> generateBooks;
  Headline({Key? key, required this.category, required this.showAll, required this.generateBooks}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            category,
            style: Theme.of(context).textTheme.headline2,
          ),
          InkWell(
            onTap:() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          BookList(name: showAll, booksList: generateBooks,)));
            },
            child: Text(
              "See All",
              style: Theme.of(context).textTheme.headline4,
            ),
          )
        ],
      ),
    );
  }

}