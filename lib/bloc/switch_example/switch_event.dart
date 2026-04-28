import 'package:equatable/equatable.dart';

// abstract class bnye h
abstract class SwitchEvents extends Equatable {
  SwitchEvents();
  @override
  List<Object> get props => [];
}


// base class k instance create kr rhe h , enable k liye
class EnableOrDisableNotification extends SwitchEvents {}

// slider k liye class bnye h
class SliderEvent extends SwitchEvents{

}