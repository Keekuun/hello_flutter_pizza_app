import 'models/models.dart';

abstract class PizzaRepository {
    Future<List<Pizza>> getPizzas();
}