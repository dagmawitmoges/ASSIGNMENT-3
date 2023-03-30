import 'package:equatable/equatable.dart';
import 'package:asbeza/model/item.dart';

abstract class itemState extends Equatable {}

class itemInitialState extends itemState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class itemLoadingState extends itemState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class itemSuccessState extends itemState {
  final List activity;
  List cartHistory;

  itemSuccessState({
    required this.activity,
    required this.cartHistory,
  });

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class itemFailState extends itemState {
  String message;

  itemFailState(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [];
}
