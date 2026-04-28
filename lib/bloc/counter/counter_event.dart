
// abstract class act krti h as a base class  , ye help krti h interface define krne k liye
import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {

const CounterEvent();
  @override
  List<Object> get props => [];
}

// upr hm counterevent nam se class bnye h , as we study ki abstract class base class ki trh work krta h to esliye counterevent se extends krti h
// class hm kii v nam se bna skte h but extends hm usi class se krenge jisse equatabe kiye ko kiye te
class IncrementCouter extends CounterEvent {
}


// same explation as upper
  class DecrementCouter extends CounterEvent {

  }