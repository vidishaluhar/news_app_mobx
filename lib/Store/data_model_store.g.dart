// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DataModelStore on _DataModelStore, Store {
  late final _$listOfDataFromFutureAtom =
      Atom(name: '_DataModelStore.listOfDataFromFuture', context: context);

  @override
  ObservableFuture<NewsModel>? get listOfDataFromFuture {
    _$listOfDataFromFutureAtom.reportRead();
    return super.listOfDataFromFuture;
  }

  @override
  set listOfDataFromFuture(ObservableFuture<NewsModel>? value) {
    _$listOfDataFromFutureAtom.reportWrite(value, super.listOfDataFromFuture,
        () {
      super.listOfDataFromFuture = value;
    });
  }

  late final _$selectedItemAtom =
      Atom(name: '_DataModelStore.selectedItem', context: context);

  @override
  Data? get selectedItem {
    _$selectedItemAtom.reportRead();
    return super.selectedItem;
  }

  @override
  set selectedItem(Data? value) {
    _$selectedItemAtom.reportWrite(value, super.selectedItem, () {
      super.selectedItem = value;
    });
  }

  late final _$isFavouriteAtom =
      Atom(name: '_DataModelStore.isFavourite', context: context);

  @override
  bool get isFavourite {
    _$isFavouriteAtom.reportRead();
    return super.isFavourite;
  }

  @override
  set isFavourite(bool value) {
    _$isFavouriteAtom.reportWrite(value, super.isFavourite, () {
      super.isFavourite = value;
    });
  }

  late final _$selectedChipAtom =
      Atom(name: '_DataModelStore.selectedChip', context: context);

  @override
  String get selectedChip {
    _$selectedChipAtom.reportRead();
    return super.selectedChip;
  }

  @override
  set selectedChip(String value) {
    _$selectedChipAtom.reportWrite(value, super.selectedChip, () {
      super.selectedChip = value;
    });
  }

  late final _$choiceChipListAtom =
      Atom(name: '_DataModelStore.choiceChipList', context: context);

  @override
  ObservableList<dynamic> get choiceChipList {
    _$choiceChipListAtom.reportRead();
    return super.choiceChipList;
  }

  @override
  set choiceChipList(ObservableList<dynamic> value) {
    _$choiceChipListAtom.reportWrite(value, super.choiceChipList, () {
      super.choiceChipList = value;
    });
  }

  late final _$isSongsSwitchAtom =
      Atom(name: '_DataModelStore.isSongsSwitch', context: context);

  @override
  bool get isSongsSwitch {
    _$isSongsSwitchAtom.reportRead();
    return super.isSongsSwitch;
  }

  @override
  set isSongsSwitch(bool value) {
    _$isSongsSwitchAtom.reportWrite(value, super.isSongsSwitch, () {
      super.isSongsSwitch = value;
    });
  }

  late final _$listFavouritesAtom =
      Atom(name: '_DataModelStore.listFavourites', context: context);

  @override
  ObservableList<Data> get listFavourites {
    _$listFavouritesAtom.reportRead();
    return super.listFavourites;
  }

  @override
  set listFavourites(ObservableList<Data> value) {
    _$listFavouritesAtom.reportWrite(value, super.listFavourites, () {
      super.listFavourites = value;
    });
  }

  late final _$_DataModelStoreActionController =
      ActionController(name: '_DataModelStore', context: context);

  @override
  void updateChoiceChip(String chipName) {
    final _$actionInfo = _$_DataModelStoreActionController.startAction(
        name: '_DataModelStore.updateChoiceChip');
    try {
      return super.updateChoiceChip(chipName);
    } finally {
      _$_DataModelStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addfavourites(Data item) {
    final _$actionInfo = _$_DataModelStoreActionController.startAction(
        name: '_DataModelStore.addfavourites');
    try {
      return super.addfavourites(item);
    } finally {
      _$_DataModelStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFavourite() {
    final _$actionInfo = _$_DataModelStoreActionController.startAction(
        name: '_DataModelStore.setFavourite');
    try {
      return super.setFavourite();
    } finally {
      _$_DataModelStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSongsSwitch(bool value) {
    final _$actionInfo = _$_DataModelStoreActionController.startAction(
        name: '_DataModelStore.setSongsSwitch');
    try {
      return super.setSongsSwitch(value);
    } finally {
      _$_DataModelStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> fetchData() {
    final _$actionInfo = _$_DataModelStoreActionController.startAction(
        name: '_DataModelStore.fetchData');
    try {
      return super.fetchData();
    } finally {
      _$_DataModelStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onItemSelected(Data item) {
    final _$actionInfo = _$_DataModelStoreActionController.startAction(
        name: '_DataModelStore.onItemSelected');
    try {
      return super.onItemSelected(item);
    } finally {
      _$_DataModelStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listOfDataFromFuture: ${listOfDataFromFuture},
selectedItem: ${selectedItem},
isFavourite: ${isFavourite},
selectedChip: ${selectedChip},
choiceChipList: ${choiceChipList},
isSongsSwitch: ${isSongsSwitch},
listFavourites: ${listFavourites}
    ''';
  }
}
