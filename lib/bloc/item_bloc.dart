import 'dart:async';

import 'package:asbeza/Service/service.dart';
import 'package:bloc/bloc.dart';

import 'package:asbeza/bloc/item_event.dart';
import 'package:asbeza/model/item.dart';

import '../Service/apiService.dart';
import 'item_state.dart';
import '../bloc/item_state.dart';
class itemBloc extends Bloc<itemEvent, itemState> {
  final _apiServiceProvider = ApiServiceProvider();
  final _service = Service();
  List cartHistory = [];
  List historyLoad = [];
  itemBloc() : super(itemInitialState()) {
    on<GetDataButtonPressed>((event, emit) async {
      emit(itemLoadingState());
      final activity = await _apiServiceProvider.fetchActivity();
      await _service.readAsbeza().then((val) => {
            cartHistory = val,
          });
      historyLoad = item.historyList(cartHistory);
      emit(itemSuccessState( activity:activity!,cartHistory: historyLoad));
      
    });
    on<CartHistoryEvent>((event, emit) => {
          historyLoad.add(event.data),
          _service.saveAsbeza(event.data),
        });
  }
}
