import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:news_app_mobx/Store/data_model_store.dart';


class SelectedNewsPage extends StatelessWidget {
   SelectedNewsPage({Key? key}) : super(key: key);

   DataModelStore dataModelStore=DataModelStore();

  @override
  Widget build(BuildContext context) {
    //final dataModelStore=Provider.of<DataModelStore>(context).selectedItem;
    // final selectediItem=ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.teal,
        systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.teal,
            statusBarIconBrightness: Brightness.light,
            statusBarColor: Colors.teal),
      ),
      body: Observer(
        builder: (_) {
          return Column(
            children: [
              Image.network( dataModelStore.selectedItem!.images,)
            ],
          );
        },

      ),
    );
  }
}
