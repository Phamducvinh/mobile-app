import 'package:book_booking/app/constants/constants.dart';
import 'package:book_booking/app/notifier/app_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/detailmodel.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({Key? key, required this.id, this.boxColor}) : super(key: key);

  var id;
  final Color? boxColor;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  var box = Hive.box("wishListId");
  List<String> wishList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wishList = box.get('id') ?? [];
  }

  @override
  Widget build(BuildContext context) {
    String errorLink =
        "https://img.freepik.com/free-vector/funny-error-404-background-design_1167-219.jpg?w=740&t=st=1658904599~exp=1658905199~hmac=131d690585e96267bbc45ca0978a85a2f256c7354ce0f18461cd030c5968011c";
    double height = MediaQuery.of(context).size.height / 815;
    double width = MediaQuery.of(context).size.width / 375;

    return Scaffold(
      body: Consumer<AppNotifier>(
        builder: ((context, value, child) {
          return widget.id != null
              ? FutureBuilder(
                  future: value.showBookData(id: widget.id),
                  builder: (context, AsyncSnapshot<DetailModel> snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text("Opps! Try again later!"),
                      );
                    }
                    if (snapshot.hasData) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 350,
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.maxFinite,
                                    height: 230,
                                    decoration: BoxDecoration(
                                      color: widget.boxColor ??
                                          const Color(0xffF9CFE3),
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(35),
                                        bottomRight: Radius.circular(35),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      height: 250,
                                      alignment: Alignment.center,
                                      child: Card(
                                        elevation: 10,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Image(
                                            image: NetworkImage(snapshot
                                                    .data
                                                    ?.volumeInfo
                                                    ?.imageLinks
                                                    ?.thumbnail ??
                                                errorLink),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 70,
                                    left: 16,
                                    child: OutlinedButton.icon(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: OutlinedButton.styleFrom(
                                          side: const BorderSide(width: 1)),
                                      icon: Icon(
                                        Icons.arrow_back_ios_new,
                                        color: AppColors.black,
                                      ),
                                      label: const Text(
                                        "",
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    "${snapshot.data?.volumeInfo?.title ?? "Censored"}",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        ?.copyWith(fontSize: 24),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "${snapshot.data?.volumeInfo!.authors?.length != 0 ? snapshot.data?.volumeInfo!.authors![0] : "Censored"}"
                                        .toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 35),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${snapshot.data?.volumeInfo?.printType}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                        ),
                                        const Spacer(
                                          flex: 2,
                                        ),
                                        Container(
                                          height: height * 35,
                                          width: width * 80,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: AppColors.black,
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Text(
                                            "\$${snapshot.data?.volumeInfo?.pageCount}",
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          "${snapshot.data?.volumeInfo?.pageCount} Pages",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      OutlinedButton(
                                        onPressed: () async {
                                          Uri url = Uri.parse(
                                              "${snapshot.data?.volumeInfo?.previewLink}");

                                          if (await canLaunchUrl(url)) {
                                            await launchUrl(url,
                                                mode: LaunchMode
                                                    .externalApplication);
                                          } else {
                                            throw 'could not launch $url';
                                          }
                                        },
                                        style: OutlinedButton.styleFrom(
                                            side: const BorderSide(width: 1)),
                                        child: Text(
                                          "VIEW ONLINE",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                        ),
                                      ),
                                      OutlinedButton.icon(
                                        onPressed: () {
                                          setState(() {
                                            if (wishList.contains(
                                                widget.id.toString())) {
                                              wishList
                                                  .remove(widget.id.toString());
                                            } else {
                                              wishList
                                                  .add(widget.id.toString());
                                            }
                                          });
                                          box.put('id', wishList);
                                          print(wishList);
                                        },
                                        style: OutlinedButton.styleFrom(
                                            side: const BorderSide(width: 1)),
                                        icon: wishList
                                                .contains(widget.id.toString())
                                            ? const Icon(
                                                Icons.favorite,
                                                color: Colors.pink,
                                              )
                                            : Icon(
                                                Icons.favorite_outline,
                                                color: AppColors.black,
                                              ),
                                        label: Text(
                                          "WISHLIST",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Details",
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Author",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4,
                                            ),
                                            Text("Publisher",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline4),
                                            Text("Published Date",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline4),
                                            Text("Categorie",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline4)
                                          ],
                                        ),
                                        const SizedBox(width: 20),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${snapshot.data?.volumeInfo?.authors?.length != 0 ? snapshot.data?.volumeInfo?.authors![0] : 'Not Found'}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5
                                                    ?.copyWith(fontSize: 16),
                                              ),
                                              Text(
                                                "${snapshot.data?.volumeInfo?.publisher}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5
                                                    ?.copyWith(fontSize: 16),
                                              ),
                                              Text(
                                                "${snapshot.data?.volumeInfo?.publishedDate}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5
                                                    ?.copyWith(fontSize: 16),
                                              ),
                                              Text(
                                                "${snapshot.data?.volumeInfo?.categories?.length != 0 ? snapshot.data?.volumeInfo?.categories![0] : 'Not Found'}",
                                                overflow: TextOverflow.ellipsis,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5
                                                    ?.copyWith(fontSize: 16),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Discription",
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ReadMoreText(
                                    "${snapshot.data?.volumeInfo?.description}",
                                    trimLines: 6,
                                    colorClickableText: AppColors.black,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: '...Read More',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        ?.copyWith(fontSize: 14),
                                    trimExpandedText: ' Less',
                                    textAlign: TextAlign.justify,
                                  ),
                                  const SizedBox(height: 10),
                                  ElevatedButton(
                                    onPressed: () async {
                                      Uri url = Uri.parse(
                                          "${snapshot.data?.volumeInfo?.infoLink}");

                                      if (await canLaunchUrl(url)) {
                                        await launchUrl(url,
                                            mode:
                                                LaunchMode.externalApplication);
                                      } else {
                                        throw 'could not launch $url';
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.black,
                                    ),
                                    child: Text(
                                      "Buy",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2
                                          ?.copyWith(
                                              fontSize: 18,
                                              color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return Center(
                        child: CircularProgressIndicator(
                      color: AppColors.black,
                    ));
                  },
                )
              : const Center(
                  child: Text("Opps No Data Found!"),
                );
        }),
      ),
    );
  }
}
