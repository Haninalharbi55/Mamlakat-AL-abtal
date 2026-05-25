import 'package:freezed_annotation/freezed_annotation.dart';

part 'habit_summary.freezed.dart';

@freezed
class HabitSummary with _$HabitSummary {
  const factory HabitSummary({
    required double waterCurrent,
    required double waterGoal,
    required double sleepCurrent,
    required double sleepGoal,
    required double walkCurrent,
    required double walkGoal,
    required double foodCurrent,
    required double foodGoal,
  }) = _HabitSummary;
}
