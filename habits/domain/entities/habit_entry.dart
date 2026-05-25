import 'package:freezed_annotation/freezed_annotation.dart';
import 'habit_type.dart';

part 'habit_entry.freezed.dart';

@freezed
class HabitEntry with _$HabitEntry {
  const factory HabitEntry({
    required HabitType type,
    required double value,
    required String unit,
    required DateTime date,
  }) = _HabitEntry;
}
