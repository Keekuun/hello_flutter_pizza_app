import '../entities/macros_entity.dart';

class Macros {
  // 热量
  int calories;

  // 蛋白质
  int proteins;

  // 脂肪
  int fat;

  // 碳水
  int carbs;

  Macros({
    required this.calories,
    required this.proteins,
    required this.fat,
    required this.carbs,
  });

  MacrosEntity toEntity() {
    return MacrosEntity(
      calories: calories,
      proteins: proteins,
      fat: fat,
      carbs: carbs,
    );
  }

  static Macros fromEntity(MacrosEntity entity) {
    return Macros(
        calories: entity.calories,
        proteins: entity.proteins,
        fat: entity.fat,
        carbs: entity.carbs);
  }

  static empty() {
    return Macros(calories: 0, proteins: 0, fat: 0, carbs: 0);
  }
}
