import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:news_app_mobx/Model/data_model.dart';
import 'package:news_app_mobx/Store/data_model_store.dart';

class NewsPage extends StatelessWidget {
  NewsPage({super.key}) {
    dataModelStore.getData();
  }

  DataModelStore dataModelStore = DataModelStore();

  @override
  Widget build(BuildContext context) {
    final futureList = dataModelStore.listOfDataFromFuture;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Latest News"),
        foregroundColor: Colors.white,
      ),
      body: Observer(
        builder: (_) {
          switch (futureList!.status) {
            case FutureStatus.pending:
              return const Center(
                child: CircularProgressIndicator(color: Colors.teal),
              );
            case FutureStatus.rejected:
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
              final List<DataModel> listOfData = futureList.result;
              return RefreshIndicator(
                onRefresh: () {
                  return dataModelStore.fetchData();
                },
                child: ListView.builder(
                  itemCount: listOfData.length,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final data = listOfData[index];
                    return ListTile(
                      leading: FractionallySizedBox(
                        heightFactor: ,
                        child: Image.network(
                          data.images,width: 125,height: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text("Written by ${data.author}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Colors.grey)),
                          ),
                          TextButton(
                            style: const ButtonStyle(
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 0))),
                            onPressed: () {},
                            child: const Text("read more",
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ],
                      ),
                      title: Text(data.title,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                    );
                  },
                ),
              );
          }
        },
      ),
    );
  }
}
