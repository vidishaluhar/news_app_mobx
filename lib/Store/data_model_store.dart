import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:news_app_mobx/Fetch%20Data/fetch_data_from_api.dart';
import 'package:news_app_mobx/Model/data_model.dart';
part 'data_model_store.g.dart';
class DataModelStore=_DataModelStore with _$DataModelStore;
abstract class _DataModelStore with Store
{
  final DataModelApi dataModelApi=DataModelApi();

  @observable
  ObservableFuture<List<DataModel>>? listOfDataFromFuture;

  @observable
  DataModel? selectedItem;

  @observable
  bool isFavourite=false;

  @observable
  ObservableList<DataModel> listFavourites=ObservableList<DataModel>.of([]);

  @action
  void addfavourites(DataModel item)
  {
    listFavourites.add(item);
    debugPrint("$listFavourites");
  }

  @action
  void setFavourite()
  {
    isFavourite=!isFavourite;
  }

  @action
  Future fetchData() => listOfDataFromFuture=ObservableFuture(dataModelApi.getDataFromApi().then((data) => data));

  void getData()
  {
    fetchData();
  }

  @action
  void onItemSelected(DataModel item)
  {
    // debugPrint("${item.images}");
    selectedItem=item;
    // debugPrint("-------${selectedItem?.images}");
  }
}