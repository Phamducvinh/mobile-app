import 'package:book_booking/app/notifier/app_notifier.dart';
import 'package:book_booking/models/books.dart';
import 'package:book_booking/presentation/screen/details/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularBooks extends StatelessWidget {
  const PopularBooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<AppNotifier>(context);
    return FutureBuilder(
      future: data.getBookData(), 
      builder: (context, AsyncSnapshot<Books> snapshot){
        if(snapshot.hasError){
          return const Center(
            child: Text('Lỗi òi buồn ghe'),
          );
        }
        if(snapshot.hasData){
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => DetailsScreen(
                      id: snapshot.data?.items?[index].id)
                    )
                  );
                },
                child: Row(
                  children: [
                    Card(
                      elevation: 10,
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          image: NetworkImage(
                            "${snapshot.data?.items![index].volumeInfo?.imageLinks?.thumbnail}"
                          ),
                          fit: BoxFit.fill,
                          width: 150,
                          height: 220,
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
                                  "${snapshot.data?.items![index].volumeInfo!.authors?.length != 0 ? snapshot.data?.items![index].volumeInfo!.authors![0] : "Censored"}",
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                Text(
                                  "${snapshot.data?.items![index].volumeInfo?.title}",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                                Text(
                                  "${snapshot.data?.items![index].volumeInfo!.categories?.length != 0 ? snapshot.data?.items![index].volumeInfo!.categories![0] : "Unknown"}",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                fixedSize: const Size.fromWidth(100),
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    '\$',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    "${snapshot.data?.items![index].volumeInfo?.pageCount}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 50),
                  ],
                ),
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.pink,
          ),
        );
      }
    );
  }
}
