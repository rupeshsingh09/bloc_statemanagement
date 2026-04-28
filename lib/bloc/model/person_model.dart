import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_model.freezed.dart';
part 'person_model.g.dart';

// work with the concept of freezed
// jis nam se class bnye rheg vhi same ke sath dollar sign and underscore ke sath krenge

@freezed   // freezed use krenge tb pta chalega ki freezed ka concept use ho rha h code me
class PersonModel with _$PersonModel {

  // const factory use krte h freezed me
  // class ka naam same rahega aur = _ClassName likhna hota h
  const factory PersonModel({
    required String name,
  }) = _PersonModel;

  // json se object banane ke liye
  factory PersonModel.fromJson(Map<String, dynamic> json) =>
      _$PersonModelFromJson(json);
}
