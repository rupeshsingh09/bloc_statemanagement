import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EqutableTesting extends StatefulWidget {
  const EqutableTesting({super.key});

  @override
  State<EqutableTesting> createState() => _EqutableTestingState();
}

class _EqutableTestingState extends State<EqutableTesting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){

        // niche bnaye hue class ka instance yha create kr rhe h 
        Person person  = Person(name: 'Rupoesh', age: 21);
        Person person1 = Person(name: 'Rupesh', age: 31);

        print(person.hashCode.toString());
        print(person.hashCode.toString());

        print(person == person1);

      }),
    );
  }
}


// class create krenge person ke  nam se  ur extend krenge equatble se
class Person  extends Equatable{
  final String name ;
  final int age ;
  
  const Person({required this.name, required this.age});

  @override
  // yha p pass kiye h jo upr parameter pass kiye h
  List<Object?> get props => [name, age];
}
