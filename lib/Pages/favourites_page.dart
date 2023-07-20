import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:news_app_mobx/Pages/selected_news_page.dart';
import 'package:news_app_mobx/Store/data_model_store.dart';
import 'package:provider/provider.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  final bool isListNull = true;

  @override
  Widget build(BuildContext context) {
    final dataModelStore = context.read<DataModelStore>();
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.90),
      appBar: AppBar(
        title: const Text("Favourites"),
        toolbarHeight: 50,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.black,
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      ),
      body: Observer(
        builder: (_) {
          ///if favourites list is empty
          if (dataModelStore.listFavourites.isEmpty) {
            return const Center(
                child: Text(
              "Your Favourite List is Empty",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ));
          }

          ///else favourites list has data
          else {
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
                      Navigator.push(
                          context,
                          PageRouteBuilder(

                              transitionDuration: Duration(milliseconds: 250),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return ScaleTransition(
                                  alignment: Alignment.center,
                                  scale:
                                      Tween<double>(begin: 0.1, end: 1).animate(
                                    CurvedAnimation(
                                      parent: animation,
                                      curve: Curves.decelerate,
                                    ),
                                  ),
                                  child: child,
                                );
                              },
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secondaryAnimation) {
                                return SelectedNewsPage();
                              }));

                      // Navigator.pushNamed(context, '/SelectedNews');
                    },

                    ///Article image
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

                    ///Article Title
                    title: Text(
                        dataModelStore.listFavourites[index].title ?? "",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500)),

                    ///Article favourites icon
                    trailing: IconButton(
                        style: const ButtonStyle(
                            iconSize: MaterialStatePropertyAll(30),
                            iconColor: MaterialStatePropertyAll(Colors.red)),
                        onPressed: () {
                          dataModelStore.listFavourites.removeAt(index);
                          debugPrint("item is removed");
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
