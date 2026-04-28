import 'package:bloc/bloc.dart';
import 'package:bloc_learn/bloc/counter/counter_event.dart';
import 'package:bloc_learn/bloc/counter/counter_state.dart';

class CounterBloc  extends Bloc<CounterEvent, CounterState> {

  // ye syntax hai , constroctor create kiue h
  CounterBloc() :super(const CounterState()){
    // increment krne k liye
    on<IncrementCouter>(_increment);
    // decrement krne k liye
    on<DecrementCouter>(_decrement);
  }


  // fun bnye h , increment ke liye     , incrementCounter ko call kiye h and emit m class ko call kiye h
  void _increment(IncrementCouter event , Emitter<CounterState> email){
    // emit ek fun. hota h , jo ki emit krega state ko  and counter m ++ krega
emit(state.copyWith(counter: state.counter + 1));
  }

  // fun bnye h , increment ke liye  & as upper
  void _decrement(DecrementCouter event , Emitter<CounterState> email){
    // emit ek fun. hota h , jo ki emit krega state ko  and counter m ++ krega
    emit(state.copyWith(counter: state.counter - 1));
  }

}