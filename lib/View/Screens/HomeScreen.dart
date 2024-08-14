import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Model/Model.dart';

import '../../Controller/CompanyArticleController.dart';

NewsDataController newsDataController = Get.put(NewsDataController());

List bottomBar = [
  Icon(Icons.home_outlined),
  Icon(Icons.search),
  Icon(Icons.square_outlined),
  Icon(Icons.person_add_alt),
  Icon(Icons.notifications_none_rounded),
  Icon(Icons.mail_outline_rounded),
];
int selectPage = 0;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectPage,
          backgroundColor: Colors.black,
          onTap: (int newIndex) {
            selectPage = newIndex;
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.square_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_add_alt), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_none_rounded), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.mail_outline_rounded), label: 'Home'),
          ],
        ),
        appBar: AppBar(
          backgroundColor: Colors.black,
          scrolledUnderElevation: 0.1,
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Icon(
              Icons.account_circle_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
          title: const Text(
            'X',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          actions: [
            Text(
              'Upgrade',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(
                Icons.more_vert_rounded,
                color: Colors.white,
                size: 30,
              ),
            )
          ],
          bottom: const TabBar(
            dividerColor: Colors.grey,
            dividerHeight: 0.5,
            indicatorColor: Colors.blue,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            automaticIndicatorColorAdjustment: true,
            labelColor: Colors.white,
            tabs: [
              Tab(
                text: 'For You',
              ),
              Tab(
                text: 'Automobiles',
              ),
              Tab(
                text: 'Businesses',
              ),
              Tab(
                text: 'Tech & IT ',
              ),
              Tab(
                text: 'Market Insights',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FutureBuilder(
              future: newsDataController.fetchCompanyApiData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount:
                        newsDataController.newsDataModal!.articles.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // detailHelper = fetchData;
                          // detailList = modal;

                          detailPage = newsDataController.fetchCompanyApiData();
                          selectedIndex = index;
                          Get.toNamed('/detail');
                        },
                        child: Card(
                          color: Colors.black,
                          child: Column(
                            children: [
                              Container(
                                height: h * 0.3,
                                width: w * 0.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage((newsDataController
                                                .newsDataModal!
                                                .articles[index]
                                                .urlToImage ==
                                            '')
                                        ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqTDCEsvutyTcwyKh0R7p4a2JJ8GyjNqi7BA&s'
                                        : newsDataController.newsDataModal!
                                            .articles[index].urlToImage),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  newsDataController
                                      .newsDataModal!.articles[index].title,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    newsDataController
                                        .newsDataModal!.articles[index].author,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 7),
                                    child: Text(
                                      'Our Sponsor',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        newsDataController.newsDataModal!
                                            .articles[index].source.name,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            FutureBuilder(
              future: newsDataController.fetchTeslaApiData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount:
                        newsDataController.teslaDataModal!.articles.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // detailHelper = fetchData;
                          // detailList = modal;
                          selectedIndex = index;
                          Get.toNamed('/detail');
                        },
                        child: Card(
                          color: Colors.black,
                          child: Column(
                            children: [
                              Container(
                                height: h * 0.3,
                                width: w * 0.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage((newsDataController
                                                .teslaDataModal!
                                                .articles[index]
                                                .urlToImage ==
                                            '')
                                        ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqTDCEsvutyTcwyKh0R7p4a2JJ8GyjNqi7BA&s'
                                        : newsDataController.teslaDataModal!
                                            .articles[index].urlToImage),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  newsDataController
                                      .teslaDataModal!.articles[index].title,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    newsDataController
                                        .teslaDataModal!.articles[index].author,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 7),
                                    child: Text(
                                      'Our Sponsor',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        newsDataController.teslaDataModal!
                                            .articles[index].source.name,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            FutureBuilder(
              future: newsDataController.fetchBusinessApiData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount:
                        newsDataController.businessDataModal!.articles.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // detailHelper = fetchData;
                          // detailList = modal;
                          selectedIndex = index;
                          Get.toNamed('/detail');
                        },
                        child: Card(
                          color: Colors.black,
                          child: Column(
                            children: [
                              Container(
                                height: h * 0.3,
                                width: w * 0.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(newsDataController
                                        .businessDataModal!
                                        .articles[index]
                                        .urlToImage),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  newsDataController
                                      .businessDataModal!.articles[index].title,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    newsDataController.businessDataModal!
                                        .articles[index].author,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 7),
                                    child: Text(
                                      'Our Sponsor',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        newsDataController.businessDataModal!
                                            .articles[index].source.name,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            FutureBuilder(
              future: newsDataController.fetchTechApiData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount:
                        newsDataController.techDataModal!.articles.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // detailHelper = fetchData;
                          // detailList = modal;
                          selectedIndex = index;
                          Get.toNamed('/detail');
                        },
                        child: Card(
                          color: Colors.black,
                          child: Column(
                            children: [
                              Container(
                                height: h * 0.3,
                                width: w * 0.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(newsDataController
                                        .techDataModal!
                                        .articles[index]
                                        .urlToImage),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  newsDataController
                                      .techDataModal!.articles[index].title,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    newsDataController
                                        .techDataModal!.articles[index].author,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 7),
                                    child: Text(
                                      'Our Sponsor',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        newsDataController.techDataModal!
                                            .articles[index].source.name,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            FutureBuilder(
              future: newsDataController.fetchStocksApiData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount:
                        newsDataController.wallStreetDataModal!.articles.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // detailHelper = fetchData;
                          // detailList = modal;
                          selectedIndex = index;
                          Get.toNamed('/detail');
                        },
                        child: Card(
                          color: Colors.black,
                          child: Column(
                            children: [
                              Container(
                                height: h * 0.3,
                                width: w * 0.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(newsDataController
                                        .wallStreetDataModal!
                                        .articles[index]
                                        .urlToImage),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  newsDataController.wallStreetDataModal!
                                      .articles[index].title,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    newsDataController.wallStreetDataModal!
                                        .articles[index].author,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),



                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 7),
                                    child: Text(
                                      'Our Sponsor',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        newsDataController.wallStreetDataModal!
                                            .articles[index].source.name,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),

            // FutureBuilder(
            //   future: newsDataController.apiHelper.fetchApiCompanyArticleData(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       return newsListView(h, w,
            //           newsModel: newsDataController.newsDataModal!,
            //           futureData: newsDataController.fetchCompanyApiData());
            //     } else if (snapshot.hasError) {
            //       return Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Text(snapshot.hasError.toString()),
            //           Text(snapshot.error.toString()),
            //         ],
            //       );
            //     } else {
            //       return const Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     }
            //   },
            // ),
            // FutureBuilder(
            //   future: newsDataController.apiHelper.fetchApiTeslaData(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       return newsListView(h, w,
            //           newsModel: newsDataController.newsDataModal!,
            //           futureData: newsDataController.fetchTeslaApiData());
            //     } else if (snapshot.hasError) {
            //       return Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Text(snapshot.hasError.toString()),
            //           Text(snapshot.error.toString()),
            //         ],
            //       );
            //     } else {
            //       return const Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     }
            //   },
            // ),
          ],
        ),
      ),
    );
  }

// ListView newsListView(double h, double w,
//     {required NewsDataModal newsModel,
//     required Future<NewsDataModal?> futureData}) {
//   return ListView.builder(
//     itemCount: newsDataController.newsDataModal!.articles.length,
//     itemBuilder: (context, index) {
//       return GestureDetector(
//         onTap: () {
//           // detailHelper = fetchData;
//           // detailList = modal;

//           selectedIndex = index;
//           Get.toNamed('/detail');
//         },
//         child: Card(
//           color: Colors.black,
//           child: Column(
//             children: [
//               Container(
//                 height: h * 0.3,
//                 width: w * 0.9,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   image: DecorationImage(
//                     fit: BoxFit.fill,
//                     image: NetworkImage(newsModel.articles[index].urlToImage),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   newsModel.articles[index].title,
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 20),
//                 child: Align(
//                   alignment: Alignment.centerRight,
//                   child: Text(
//                     newsModel.articles[index].author,
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 7),
//                     child: Text(
//                       'Our Sponsor',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 20),
//                     child: Align(
//                       alignment: Alignment.centerRight,
//                       child: Text(
//                         newsModel.articles[index].source.name,
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Divider(
//                 thickness: 1,
//                 color: Colors.grey,
//               )
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
}

// var detailHelper;
// NewsModal? detailList;
int selectedIndex = 0;
var detailPage;
