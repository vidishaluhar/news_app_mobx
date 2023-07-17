import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:news_app_mobx/Model/news_model.dart';
import 'package:news_app_mobx/Store/data_model_store.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatelessWidget {
  NewsPage({super.key});

  DateTime currenttime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final dataModelStore = context.read<DataModelStore>();
    // dataModelStore.getData();
    final futureList = dataModelStore.listOfDataFromFuture;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.90),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              pinned: true,
              bottom: PreferredSize(
                preferredSize: Magnifier.kDefaultMagnifierSize,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Row(
                      children: List.generate(
                        dataModelStore.choiceChipList.length,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Observer(
                              builder: (BuildContext context) {
                                return ChoiceChip(
                                  label: Text(dataModelStore.choiceChipList[index]),
                                  backgroundColor: Colors.grey.shade400,
                                  selected: dataModelStore.selectedChip==dataModelStore.choiceChipList[index],
                                  selectedColor: Colors.white,
                                  onSelected: (value) {
                                    dataModelStore.updateChoiceChip(dataModelStore.choiceChipList[index]);
                                  },
                                  elevation: 5,
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              backgroundColor: Colors.black.withOpacity(0.90),
              expandedHeight: 350,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset('assets/images/bbc_news_breaking.jpeg',
                    fit: BoxFit.contain),
              ),
              title: const Text("Latest News",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  )),
            ),
            SliverList(
              delegate: SliverChildListDelegate.fixed([
                Observer(
                  builder: (_) {
                    switch (futureList!.status) {
                      case FutureStatus.pending:
                        return Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        );
                      case FutureStatus.rejected:
                        print(futureList.error);
                        print(futureList.result);
                        return Center(
                          child: Column(
                            children: [
                              const Text(
                                "Failed to load items ",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              FilledButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Tap to Retry",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ))
                            ],
                          ),
                        );
                      case FutureStatus.fulfilled:
                        final NewsModel news = futureList.result;
                        return RefreshIndicator(
                          onRefresh: () {
                            return dataModelStore.fetchData();
                          },
                          child: ListView.builder(
                            itemCount: news.data?.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final data = news.data?[index];
                              debugPrint("$data");

                              ///time like : Just Now, 5 min ago, 1 hour ago
                              final fetchedTime =
                                  DateTime.parse("${data!.time}");
                              Duration timeDifference =
                                  currenttime.difference(fetchedTime);
                              debugPrint("$timeDifference");
                              String formatFetchedTime(Duration duration) {
                                if (duration.inMinutes < 1) {
                                  return "Just Now";
                                } else if (duration.inHours < 1) {
                                  return "${duration.inMinutes} min ago";
                                } else if (duration.inHours == 1) {
                                  return "1 hour ago";
                                } else if (duration.inHours < 24) {
                                  return "${duration.inHours} hour ago";
                                } else {
                                  return "Long time ago";
                                }
                              }

                              String correctTime =
                                  formatFetchedTime(timeDifference);
                              debugPrint(correctTime);

                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: InkWell(
                                  onTap: () {
                                    dataModelStore
                                        .onItemSelected(news.data![index]);
                                    // debugPrint(dataModelStore.selectedItem?.images);
                                    Navigator.pushNamed(
                                        context, '/SelectedNews');
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(height: 8),
                                      ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          child: Hero(
                                              tag: '${data.images}',
                                              child: Image.network(
                                                data.images ?? "",
                                              ))),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8, bottom: 3),
                                        child: Text(data.title ?? "",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Written by ${data.author}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15,
                                                  color: Colors.white70)),
                                          Text("${correctTime}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15,
                                                  color: Colors.white70)),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                    }
                  },
                ),
              ]),
            ),
          ],
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          /*slivers: [
           */ /* SliverAppBar(
              bottom: TabBar(tabs: [
                Tab(text: "All",),
                Tab(text: "Automobile",),
              ],),
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              // primary: false,
              pinned: true,
              backgroundColor: Colors.black.withOpacity(0.90),
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                    'assets/images/bbc_news_breaking.jpeg',
                    fit: BoxFit.fill),
              ),
              title: const Text("Latest News",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  )),
            ),*/ /*

            SliverList(
              delegate: SliverChildListDelegate.fixed([
                TabBarView(
                  children: [
                    Observer(
                      builder: (_) {
                        switch (futureList!.status) {
                          case FutureStatus.pending:
                            return Center(
                              child: CircularProgressIndicator(color: Colors.white),
                            );
                          case FutureStatus.rejected:
                            print(futureList.error);
                            print(futureList.result);
                            return Center(
                              child: Column(
                                children: [
                                  const Text(
                                    "Failed to load items ",
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  FilledButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Tap to Retry",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ))
                                ],
                              ),
                            );
                          case FutureStatus.fulfilled:
                            final NewsModel news = futureList.result;
                            return RefreshIndicator(
                              onRefresh: () {
                                return dataModelStore.fetchData();
                              },
                              child: ListView.builder(
                                itemCount: news.data?.length,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {

                                  final data = news.data?[index];
                                  debugPrint("$data");

                                  ///time like : Just Now, 5 min ago, 1 hour ago
                                  final fetchedTime=DateTime.parse("${data!.time}");
                                  Duration timeDifference=currenttime.difference(fetchedTime);
                                  debugPrint("$timeDifference");
                                  String formatFetchedTime(Duration duration)
                                  {
                                    if(duration.inMinutes<1)
                                    {
                                      return "Just Now";
                                    }
                                    else if(duration.inHours<1)
                                    {
                                      return "${duration.inMinutes} min ago";
                                    }
                                    else if(duration.inHours==1)
                                    {
                                      return "1 hour ago";
                                    }

                                    else if(duration.inHours<24)
                                    {
                                      return "${duration.inHours} hour ago";
                                    }
                                    else
                                    {
                                      return "Long time ago";
                                    }
                                  }
                                  String correctTime=formatFetchedTime(timeDifference);
                                  debugPrint(correctTime);


                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: InkWell(
                                      onTap: (){
                                        dataModelStore.onItemSelected(news.data![index]);
                                        // debugPrint(dataModelStore.selectedItem?.images);
                                        Navigator.pushNamed(context, '/SelectedNews');
                                      },
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(height: 8),
                                          ClipRRect(borderRadius: const BorderRadius.all(Radius.circular(10)),
                                              child: Hero(tag: '${data.images}',
                                                  child: Image.network(data.images ?? "",))),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 8,bottom: 3),
                                            child: Text(data.title ?? "",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500)),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Written by ${data.author}",
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 15,
                                                      color: Colors.white70)),

                                              Text("${correctTime}",
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 15,
                                                      color: Colors.white70)),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                        ],
                                      ),
                                    ),
                                  );

                                },
                              ),
                            );
                        }
                      },
                    ),
                    Placeholder(),
                  ],
                )
              ]
              ),
            ),
          ],*/
        ),
      ),
    );
  }
}
