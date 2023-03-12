import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:asbeza/bloc/item_event.dart';
import 'package:asbeza/model/item.dart';

import '../Service/apiService.dart';
import 'item_state.dart';

class itemBloc extends Bloc<itemEvent, itemState> {
  final _apiServiceProvider = ApiServiceProvider();
  List cartHistory = [];
  itemBloc() : super(itemInitialState()) {
    on<GetDataButtonPressed>((event, emit) async {
      emit(itemLoadingState());
      final activity = await _apiServiceProvider.fetchActivity();
      emit(itemSuccessState(activity!,cartHistory));
      // print(activity);
    });
     on<CartHistoryEvent>((event, emit) => {cartHistory.add(event.data)});
  }
}
