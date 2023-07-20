import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_mobx/Store/data_model_store.dart';

enum PaginationStateCubit { called }

class PaginationCubit extends Cubit<PaginationStateCubit> {
  DataModelStore dataModelStore = DataModelStore();
  ScrollController scrollController = ScrollController();
  PaginationCubit() : super(PaginationStateCubit.called) {
    scrollController.addListener(
      () {
        if (scrollController.position.pixels > (scrollController.position.maxScrollExtent - 400)) {
          debugPrint("-----------Pagination with Cubit-----------");
          dataModelStore.getData();
          emit(PaginationStateCubit.called);
        }
      },
    );
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
