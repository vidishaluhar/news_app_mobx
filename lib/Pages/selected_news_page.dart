import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:news_app_mobx/Store/data_model_store.dart';
import 'package:provider/provider.dart';

class SelectedNewsPage extends StatelessWidget {
  const SelectedNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataModelStore = context.read<DataModelStore>();
    // print("${dataModelStore}----------");
    //   final selectediItem=ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.teal,
            statusBarIconBrightness: Brightness.light,
            statusBarColor: Colors.teal),
      ),
      body: Observer(
        builder: (context) {
          // print("selected page  --> ${dataModelStore.selectedItem?.images}");
          return SingleChildScrollView(
            child: Column(
              children: [
                // Image.network("https://static.inshorts.com/inshorts/images/v1/variants/jpg/m/2023/06_jun/26_mon/img_1687750729843_888.jpg")
                SizedBox(
                  height: 400,
                  width: double.infinity,
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      final availableHeight = constraints.maxHeight;
                      final imageHeight = availableHeight * 0.25;
                      debugPrint("$availableHeight");
                      debugPrint("$imageHeight");
                      debugPrint("${imageHeight / 100}");
                      return FractionallySizedBox(
                        heightFactor: imageHeight / 100,
                        child: Image.network(
                          "${dataModelStore.selectedItem?.images}",
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    dataModelStore.selectedItem!.title ?? "",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "${dataModelStore.selectedItem!.time}".substring(0, 16),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Written by ${dataModelStore.selectedItem!.author}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 17.5,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      " ${dataModelStore.selectedItem!.decription}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Observer(
        builder: (_) {
          return FloatingActionButton(
            onPressed: () {
              dataModelStore.setFavourite();

              if (dataModelStore.listFavourites
                  .contains(dataModelStore.selectedItem)) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text("Item is already added to favourites",style: TextStyle(fontSize: 20)),
                  elevation: 25,
                  duration: const Duration(seconds: 3),
                  backgroundColor: Colors.teal.shade400,
                  padding: const EdgeInsets.all(15),
                ));
              }
              else
                {
                  dataModelStore.addfavourites(dataModelStore.selectedItem!);
                }
            },
            foregroundColor: Colors.white,
            elevation: 25,
            backgroundColor: Colors.teal.shade400,
            child: dataModelStore.listFavourites.contains(dataModelStore.selectedItem)
                ? const Icon(Icons.favorite_outlined)
                : const Icon(Icons.favorite_border_outlined),
          );
        },
      ),
    );
  }
}
