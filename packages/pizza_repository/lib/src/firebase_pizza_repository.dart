import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'entities/entities.dart';
import 'models/models.dart';
import 'pizza_repository_abstract.dart';

class FirebasePizzaRepository implements PizzaRepository {
  final pizzaCollection = FirebaseFirestore.instance.collection('pizzas');

  @override
  Future<List<Pizza>> getPizzas() async {
    try {
      return await pizzaCollection.get().then((value) => value.docs
          .map((e) => Pizza.fromEntity(PizzaEntity.fromDocument(e.data())))
          .toList());
    } catch (e) {
      log('Error getting pizzas: ${e.toString()}');
      rethrow;
    }
  }
}
