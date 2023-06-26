import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:news_app_mobx/Store/data_model_store.dart';
import 'package:provider/provider.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataModelStore = context.read<DataModelStore>();
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
        builder: (_) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: dataModelStore.listFavourites.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: ListTile(
                  leading: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      final double availableHeight = constraints.maxHeight;
                      final imageHeight = availableHeight * 0.75;
                      return FractionallySizedBox(
                        heightFactor: imageHeight / 25,
                        child: Image.network(
                          dataModelStore.listFavourites[index].images,
                          width: 150,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                  title: Text(dataModelStore.listFavourites[index].title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500)),
                  trailing: const Icon(Icons.favorite_outlined,color: Colors.teal,size: 25,shadows: [
                    Shadow(
                        color: Colors.tealAccent, offset: Offset(1, 0), blurRadius: 75),
                    Shadow(color: Colors.white, offset: Offset(1, 0), blurRadius: 75)
                  ]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
