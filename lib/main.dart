

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app_mobx/Pages/favourites_page.dart';
import 'package:news_app_mobx/Pages/news_page.dart';
import 'package:news_app_mobx/Pages/selected_news_page.dart';
import 'package:news_app_mobx/Pages/settings_page.dart';
import 'package:news_app_mobx/Store/data_model_store.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.teal,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.teal,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarDividerColor: Colors.white));


  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    DataModelStore dataModelStore=DataModelStore();
    dataModelStore.getData();
    // print(dataModelStore.getData());
    return MultiProvider(
      providers: [
        Provider.value(value: dataModelStore),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
        debugShowCheckedModeBanner: false,
        routes: {'/SelectedNews': (context) => const SelectedNewsPage()},
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int cIndex = 0;

  List<Widget> pages = [const NewsPage(),  FavouritesPage(),  SettingsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[cIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 25,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        selectedFontSize: 18,
        selectedItemColor: Colors.teal,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme:
            const IconThemeData(color: Colors.teal, size: 25, shadows: [
          Shadow(
              color: Colors.tealAccent, offset: Offset(1, 0), blurRadius: 75),
          Shadow(color: Colors.white, offset: Offset(1, 0), blurRadius: 75)
        ]),
        onTap: (value) {
          setState(() {
            cIndex = value;
          });
        },
        currentIndex: cIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: "News",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favourites"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
        ],
      ),
    );
  }
}
