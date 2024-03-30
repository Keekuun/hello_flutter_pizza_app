import 'package:flutter_test/flutter_test.dart';
import 'package:pizza_repository/pizza_repository.dart';

void main() {
  test('test Pizza', () {
    var pizza = Pizza(
        pizzaId: 'pizza123',
        name: 'pizza demo',
        description: 'pizza demo desc',
        price: 10,
        picture: '',
        isVeg: false,
        spicy: 1,
        discount: 0.2,
        macros: Macros(calories: 100, proteins: 10, fat: 10, carbs: 20));
    expect(pizza.isVeg, false);
  });
}
