import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){


Map<String, dynamic> data = {
  'name' : "Rupesh kumar",
};

PersonModel model = PersonModel.fromJson(data);
print(model.name.toString());
model = model.copyWith(name: 'new value');
      }),
    );
  }
}


// class bnye h
class PersonModel {
  String? name ;
  // constructor create kiye h
PersonModel({this.name});

@override
// operator ki hel;p se check krega ki equal h ya nhi
  bool operator == ( Object other) =>
    identical(this, other) ||
  other is PersonModel &&
  runtimeType == other.runtimeType &&
  name == other.name;


@override
  int get hashCode => name.hashCode;

// fromjson funtion
PersonModel.fromJson(Map<String, dynamic> json){
  name = json['name'];
}
// tojson function
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;

}

// copywith function
PersonModel copyWith({
    String? name,

}){
  return PersonModel(
    name: name ?? name
  );
}
}
