import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:news_app_mobx/Fetch%20Data/fetch_data_from_api.dart';
import 'package:news_app_mobx/Model/news_model.dart';

part 'data_model_store.g.dart';

class DataModelStore = _DataModelStore with _$DataModelStore;

abstract class _DataModelStore with Store {
  final dataModelApi =
      DataModelApi(Dio(BaseOptions(contentType: 'application/json',)));

  @observable
  ObservableFuture<NewsModel>? listOfDataFromFuture;


  @observable
  ObservableFuture<NewsModel>? paginationData;

  @observable
  Data? selectedItem;

  @observable
  bool isFavourite = false;

  @observable
  String selectedChip = 'all';

  @observable
  ObservableStream<ConnectivityResult> connectivityStream=ObservableStream(Connectivity().onConnectivityChanged);

  @observable
  ObservableList choiceChipList = ObservableList.of([
    'all',
    'automobile',
    'business',
    'entertainment',
    'national',
    'politics',
    'science',
    'sports',
    'startup',
    'technology',
    'world',
  ]);

  @action
  void updateChoiceChip(String chipName) {
    selectedChip=chipName;
  }

  @observable
  bool isSongsSwitch = false;

  @observable
  ObservableList<Data> listFavourites = ObservableList<Data>.of([]);

  String? itemMsg;

  @action
  void addFavourites(Data item) {
    if (listFavourites.contains(item)) {
      itemMsg = "Item already in the List";
    } else {
      listFavourites.add(item);
    }
    debugPrint("$listFavourites");
  }

  @action
  void setFavourite() {
    isFavourite = !isFavourite;
  }

  @action
  void setSongsSwitch(bool value) {
    isFavourite = value;
  }

  @action
  Future fetchData() => listOfDataFromFuture =
      ObservableFuture(dataModelApi.getDataFromApi(selectedChip));

  void getData() {
    fetchData();
  }

  @action
  void onItemSelected(Data item) {
    // debugPrint("${item.images}");
    selectedItem = item;
    // debugPrint("-------${selectedItem?.images}");
  }
}
