import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:news_app_mobx/Store/data_model_store.dart';
import 'package:provider/provider.dart';

class FavouritesPage extends StatelessWidget {
  FavouritesPage({Key? key}) : super(key: key);

  bool isListNull = true;

  @override
  Widget build(BuildContext context) {
    final dataModelStore = context.read<DataModelStore>();
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.90),
      appBar: AppBar(
        title: Text("Favourites"),
        toolbarHeight: 50,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Observer(
        builder: (_) {
          if (dataModelStore.listFavourites.isEmpty) {
            return Center(
                child: Text(
              "Oops !! Your Favourite List is Empty 😢",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ));
          } else {
            return ListView.builder(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: dataModelStore.listFavourites.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: ListTile(
                    onTap: () {
                      dataModelStore
                          .onItemSelected(dataModelStore.listFavourites[index]);
                      Navigator.pushNamed(context, '/SelectedNews');
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SelectedNewsPage(),
                        ));*/
                    },
                    leading: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        final double availableHeight = constraints.maxHeight;
                        final imageHeight = availableHeight * 0.75;
                        return FractionallySizedBox(
                          heightFactor: imageHeight / 25,
                          child: Image.network(
                            dataModelStore.listFavourites[index].images ?? "",
                            width: 150,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                    title: Text(
                        dataModelStore.listFavourites[index].title ?? "",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500)),
                    trailing: /*isListNull ? Center(child: Text("Oops !! Your Favourite List is Empty 😢",
                    style: TextStyle(fontSize: 20),)) : */
                        IconButton(
                            style: const ButtonStyle(
                                iconSize: MaterialStatePropertyAll(30),
                                iconColor:
                                    MaterialStatePropertyAll(Colors.red)),
                            onPressed: () {
                              dataModelStore.listFavourites.removeAt(index);
                              debugPrint("item is removed");
                              /*if (dataModelStore.listFavourites.isEmpty) {
                          isListNull = true;
                        }
                        else {
                          isListNull = false;
                        }*/
                            },
                            icon: const Icon(Icons.favorite_outlined)),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
