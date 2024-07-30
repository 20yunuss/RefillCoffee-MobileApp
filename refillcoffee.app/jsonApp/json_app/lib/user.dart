import 'package:flutter/material.dart';

class User {
  final String name;
  final int id;
  final List kills;
  final List<Pet> pets;
  

  User(
    {
      required this.name, 
      required this.id,
      required this.kills,
      required this.pets,
    }
       );

  factory User.fromJson (Map<String, dynamic> json) {

    var petList = json['pets'] as List?;
    List<Pet> pets = [];

    if (petList != null) {
      pets = petList.map((petJson) => Pet.fromJson(petJson)).toList();
    }   

    return User(
      name: json['name'],
       id: json['id'],
       kills: ['sdfs'],
       pets: pets,
       );
  }
}
class Pet {
  final String name;
  final String variation;

  Pet({required this.name, required this.variation});

   @override
    String toString() {
      return 'name: $name, variation: $variation';
    }

  factory Pet.fromJson(Map<String, dynamic> json){
    return Pet(
      name: json['name'], 
      variation: json ['variation'],
      );
  }
}