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

  @action
  Future fetchData() => listOfDataFromFuture=ObservableFuture(dataModelApi.getDataFromApi().then((data) => data));

  void getData()
  {
    fetchData();
  }
}