import 'package:book_booking/models/books.dart';
import 'package:book_booking/models/detailmodel.dart';
import 'package:book_booking/presentation/screen/details/detail_page.dart';
import 'package:flutter/material.dart';


class PopularBooks extends StatelessWidget {
  final List<Books> booksList;
  final int? selected;
  final Function? callback;
  final PageController? pageController;
  final DetailModel? detailModel;
  const PopularBooks({
    Key? key,
    this.selected,
    this.callback,
    this.pageController,
    this.detailModel, 
    required this.booksList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = detailModel!.details.keys.toList();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: PageView(
        controller: pageController,
        onPageChanged: (index) => callback!(index),
        children: category
            .map((e) => ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage(
                                      books: detailModel!
                                          .details[category[selected!]]![index],
                                    )));
                      },
                      child: Row(
                        children: booksList.map((book) {
                          return Row(
                            children: [
                              Card(
                                elevation: 2,
                                margin: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    book.imgUrl.toString(),
                                    fit: BoxFit.cover,
                                    width: 120,
                                    height: 200,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
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
                                          Text(
                                            book.author.toString(),
                                            style: const TextStyle(
                                              fontSize: 15
                                            ),
                                            
                                          ),
                                          Text(
                                            book.title.toString(),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            book.categories.toString(),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
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
                              const SizedBox(width: 50),
                            ],
                          );
                        }).toList(),
                      )
                    ),
                itemCount: detailModel!.details[category[selected!]]!.length)
                )
            .toList(),
      ),
    );
  }
}
