import 'package:book_booking/app/constants/constants.dart';
import 'package:book_booking/app/notifier/app_notifier.dart';
import 'package:book_booking/models/books.dart';
import 'package:book_booking/presentation/screen/details/detail_page.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';

// ignore: must_be_immutable
class BookList extends StatelessWidget{
  String name;
  final _random = math.Random();

  BookList({Key? key, required this.name}) : super(key: key);
  
  @override
  Widget build(BuildContext context){
    String errorLink =
        "https://img.freepik.com/free-vector/funny-error-404-background-design_1167-219.jpg?w=740&t=st=1658904599~exp=1658905199~hmac=131d690585e96267bbc45ca0978a85a2f256c7354ce0f18461cd030c5968011c";
    var data = Provider.of<AppNotifier>(context);
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
      
      body: FutureBuilder(
        future: data.searchBookData(searchBook: name), 
        builder: (context, AsyncSnapshot<Books> snapshot){
          if(snapshot.hasError){
            return const Center(
              child: Text('Loi roi tiec qua'),
            );
          }
          if(snapshot.hasData){
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //childAspectRatio: 16 / 15,
                crossAxisCount: 2,
                mainAxisExtent: 250,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0
              ),
              itemCount: 30,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailsScreen(
                            id: snapshot.data?.items?[index].id,
                            boxColor: boxColors[_random.nextInt(7)],
                          )
                        )
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
                                      elevation: 10,
                                      margin: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12)
                                      ),
                                      child: SizedBox(
                                        height: 120,
                                        width: 80,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image(
                                            image: NetworkImage(
                                              snapshot.data?.items![index].volumeInfo?.imageLinks?.thumbnail ?? errorLink
                                            ),
                                            fit: BoxFit.fill,
                                          ),
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
                                  "${snapshot.data?.items![index].volumeInfo?.authors?.length!= 0 ? snapshot.data?.items![index].volumeInfo?.authors![0] : 'Not Found'}",
                                  maxLines: 1,
                                ),
                                Text(
                                  "${snapshot.data?.items![index].volumeInfo?.title}",
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
                                        "${snapshot.data?.items![index].volumeInfo?.pageCount}",
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
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.pink,
            ),
          );   
        }
      ),
    );  
  }
}