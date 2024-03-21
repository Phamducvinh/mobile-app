import "package:book_booking/presentation/screen/home/book_list.dart";
import "package:flutter/material.dart";
// import "package:google_nav_bar/google_nav_bar.dart";

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          "Categories",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: categoriesName.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 16 / 15,
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                print(categoriesName[index]);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BookList(name: categoriesName[index])));
              },
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: AssetImage(categoriesImage[index]),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.3)
                          ],
                          stops: const [0.6, 0.9],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      categoriesName[index],
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

List categoriesName = [
  "Fiction",
  "Classic",
  "Romance",
  "Mystery",
  "Fantasy",
  "History",
  "Comic",
  "Crime",
];

List categoriesImage = [
  "assets/images/categories/anh1.png",
  "assets/images/categories/anh2.png",
  "assets/images/categories/anh3.png",
  "assets/images/categories/anh4.png",
  "assets/images/categories/anh5.png",
  "assets/images/categories/anh6.png",
  "assets/images/categories/anh7.png",
  "assets/images/categories/anh8.png",
];
