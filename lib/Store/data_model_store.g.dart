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
  ObservableFuture<List<DataModel>>? get listOfDataFromFuture {
    _$listOfDataFromFutureAtom.reportRead();
    return super.listOfDataFromFuture;
  }

  @override
  set listOfDataFromFuture(ObservableFuture<List<DataModel>>? value) {
    _$listOfDataFromFutureAtom.reportWrite(value, super.listOfDataFromFuture,
        () {
      super.listOfDataFromFuture = value;
    });
  }

  late final _$_DataModelStoreActionController =
      ActionController(name: '_DataModelStore', context: context);

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
  String toString() {
    return '''
listOfDataFromFuture: ${listOfDataFromFuture}
    ''';
  }
}
