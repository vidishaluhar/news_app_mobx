import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_mobx/Pages/favourites_page.dart';
import 'package:news_app_mobx/Pages/news_page.dart';
import 'package:news_app_mobx/Pages/selected_news_page.dart';
import 'package:news_app_mobx/Pages/settings_page.dart';
import 'package:news_app_mobx/Store/data_model_store.dart';
import 'package:news_app_mobx/Style/style.dart';
import 'package:news_app_mobx/pagination/pagination_cubit.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarColor: Colors.black,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.light,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    DataModelStore dataModelStore = DataModelStore();
    // dataModelStore.getData();
    // print(dataModelStore.getData());
    return MultiProvider(
      providers: [
        Provider.value(value: dataModelStore),
        Provider(
          create: (BuildContext context) {
            return PaginationCubit();
          },
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme:
              const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark),
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

  List<Widget> pages = [
    NewsPage(),
    const FavouritesPage(),
    const SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: pages[cIndex],
      body: IndexedStack(index: cIndex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        backgroundColor: Colors.black,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            cIndex = value;
          });
        },
        currentIndex: cIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Image(
                image: AssetImage(AppStyles.newsImage),
                color: Colors.white,
                width: 25,
                height: 25,
                fit: BoxFit.cover),
            activeIcon: Image(
                image: AssetImage(AppStyles.newsImageFilled),
                color: Colors.white,
                width: 25,
                height: 25,
                fit: BoxFit.cover),
            label: "News",
          ),
          BottomNavigationBarItem(
              icon: Image(
                  image: AssetImage(AppStyles.favouritesImage),
                  color: Colors.white,
                  width: 25,
                  height: 25,
                  fit: BoxFit.cover),
              activeIcon: Image(
                  image: AssetImage(AppStyles.favouritesImageFilled),
                  color: Colors.white,
                  width: 25,
                  height: 25,
                  fit: BoxFit.cover),
              label: "Favourites"),
          BottomNavigationBarItem(
              icon: Image(
                  image: AssetImage(AppStyles.settingsImage),
                  color: Colors.white,
                  width: 25,
                  height: 25,
                  fit: BoxFit.cover),
              activeIcon: Image(
                  image: AssetImage(AppStyles.settingsImageFilled),
                  color: Colors.white,
                  width: 25,
                  height: 25,
                  fit: BoxFit.cover),
              label: "Settings")
        ],
      ),
    );
  }
}
