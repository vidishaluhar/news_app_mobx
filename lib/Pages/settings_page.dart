import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:news_app_mobx/Store/data_model_store.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataModelStore = context.read<DataModelStore>();
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
          toolbarHeight: 50,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          systemOverlayStyle: const SystemUiOverlayStyle(
              systemNavigationBarColor: Colors.teal,
              statusBarIconBrightness: Brightness.light,
              statusBarColor: Colors.teal),
        ),
        body: Column(
          children: [
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.all(8),
              trailing: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Observer(
                  builder: (_) {
                    return CupertinoSwitch(
                      activeColor: Colors.teal,
                      value: dataModelStore.isSongsSwitch,
                      onChanged: (value) {
                        dataModelStore.setSongsSwitch(value);
                      },
                    );
                  },
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Have you got bored of reading news ? 🥱",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ));
  }
}
