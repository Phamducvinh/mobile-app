import 'package:book_booking/app/constants/constants.dart';
import 'package:book_booking/app/notifier/app_notifier.dart';
import 'package:book_booking/models/books.dart';
import 'package:book_booking/presentation/screen/details/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimeBooks extends StatelessWidget{
  const AnimeBooks({super.key});
  
  @override
  Widget build(BuildContext context) {
    String errorLink =
        "https://img.freepik.com/free-vector/funny-error-404-background-design_1167-219.jpg?w=740&t=st=1658904599~exp=1658905199~hmac=131d690585e96267bbc45ca0978a85a2f256c7354ce0f18461cd030c5968011c";
    var data = Provider.of<AppNotifier>(context);
    return FutureBuilder(
      future: data.getBookData2(),
      builder: (context, AsyncSnapshot<Books> snapshot){
        if(snapshot.hasError){
          return const Center(
            child: Text("Opps! Try again later!"),
          );
        }
        if(snapshot.hasData){
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.items!.length,
            itemBuilder: (context, index){
              return GestureDetector(
                onTap: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => DetailsScreen(
                      id: snapshot.data?.items?[index].id)
                    )
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
                                child: Image(
                                  image: NetworkImage(
                                    snapshot.data?.items![index].volumeInfo?.imageLinks?.thumbnail ?? errorLink,
                                  ),
                                  fit: BoxFit.fill, 
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Text(
                            "${snapshot.data?.items![index].volumeInfo?.title}",
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
                                  "${snapshot.data?.items![index].volumeInfo?.pageCount}",
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
            } 
          );
        }
        return Center(
            child: CircularProgressIndicator(
          color: AppColors.black,
        ));
      },
    );
  }
}