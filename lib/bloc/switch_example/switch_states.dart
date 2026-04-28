import 'package:equatable/equatable.dart';

class SwitchStates  extends Equatable{
  bool isSwitch;
  double slider ;

// upr jo instance create kiye h uska contructor yha create kr rhe h
  SwitchStates({
    this.isSwitch = false,
    this.slider = 1.0
});

  // copywith methods , esse new instace create hota h
  SwitchStates copyWith({bool? isSwitch}) {
    return SwitchStates(
    isSwitch: isSwitch ?? this.isSwitch,
      slider: slider ?? this.slider,
    );
}
  @override

  List<Object?> get props => [];

}