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
      backgroundColor: Colors.black,
      appBar: AppBar(
          toolbarHeight: 50,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle.dark),
      body: Observer(
        builder: (context) {
          // print("selected page  --> ${dataModelStore.selectedItem?.images}");
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                        child: Hero(
                          tag: '${dataModelStore.selectedItem?.images}',
                          child: Image.network(
                            "${dataModelStore.selectedItem?.images}",
                            fit: BoxFit.cover,
                          ),
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
                      color: Colors.white,
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
                        color: Colors.white70,
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
                        color: Colors.white70,
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
                        color: Colors.white,
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
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Item is already added to favourites",
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                  elevation: 25,
                  duration: Duration(seconds: 3),
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.all(15),
                ));
              } else {
                dataModelStore.addfavourites(dataModelStore.selectedItem!);
              }
            },
            shape: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(width: 1.1, color: Colors.white)),
            foregroundColor: Colors.white,
            elevation: 25,
            backgroundColor: Colors.black,
            child: dataModelStore.listFavourites
                    .contains(dataModelStore.selectedItem)
                ? const Icon(
                    Icons.favorite_outlined,
                    color: Colors.red,
                  )
                : const Icon(Icons.favorite_border_outlined),
          );
        },
      ),
    );
  }
}
