
import 'package:bloc/bloc.dart';
 import 'package:bloc_learn/bloc/switch_example/switch_event.dart';
import 'package:bloc_learn/bloc/switch_example/switch_states.dart';

class SwitchBloc extends Bloc<SwitchEvents, SwitchStates>{

  SwitchBloc():super(SwitchStates()){
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
  }

  void _enableOrDisableNotification(EnableOrDisableNotification events,  Emitter<SwitchStates> emit ){
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }
}