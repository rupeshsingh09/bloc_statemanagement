import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  // initilize kiye h cou ter ko
  final int counter;

  const CounterState({this.counter = 0});

  // use of fun. copywith , copywith ki help se instance create kr deta  h , ye 3 line syntax h copywith ka
  CounterState copyWith({int? counter}) {
    return CounterState(counter: counter ?? this.counter);
  }

  @override
  List<Object?> get props => [counter];
}
