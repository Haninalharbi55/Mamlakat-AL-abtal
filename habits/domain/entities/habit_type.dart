enum HabitType {
  water,
  sleep,
  walk,
  food,
}

extension HabitTypeExtension on HabitType {
  String get name {
    switch (this) {
      case HabitType.water:
        return 'water';
      case HabitType.sleep:
        return 'sleep';
      case HabitType.walk:
        return 'walk';
      case HabitType.food:
        return 'food';
    }
  }
}
