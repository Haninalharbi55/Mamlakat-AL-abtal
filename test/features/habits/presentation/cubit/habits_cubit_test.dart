import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mamlakat_alabtal/features/habits/presentation/cubit/habits_cubit.dart';
import 'package:mamlakat_alabtal/features/habits/presentation/cubit/habits_state.dart';
import 'package:mamlakat_alabtal/features/habits/domain/usecases/submit_entry_usecase.dart';
import 'package:mamlakat_alabtal/features/habits/domain/usecases/get_today_summary_usecase.dart';
import 'package:mamlakat_alabtal/features/habits/domain/entities/habit_summary.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([SubmitEntryUseCase, GetTodaySummaryUseCase])
import 'habits_cubit_test.mocks.dart' as mocks;
import 'habits_cubit_test.mocks.dart';

void main() {
  late HabitsCubit cubit;
  late MockSubmitEntryUseCase mockSubmitEntryUseCase;
  late MockGetTodaySummaryUseCase mockGetTodaySummaryUseCase;

  setUp(() {
    mockSubmitEntryUseCase = mocks.MockSubmitEntryUseCase();
    mockGetTodaySummaryUseCase = mocks.MockGetTodaySummaryUseCase();
    cubit = HabitsCubit(mockSubmitEntryUseCase, mockGetTodaySummaryUseCase);
  });

  tearDown(() {
    cubit.close();
  });

  test('initial state should be HabitsInitial', () {
    expect(cubit.state, equals(HabitsInitial()));
  });

  blocTest<HabitsCubit, HabitsState>(
    'emits [HabitsLoading, HabitsLoaded] when loadTodaySummary succeeds',
    build: () {
      when(mockGetTodaySummaryUseCase.call()).thenAnswer(
        (_) async => const HabitSummary(
          waterCurrent: 2,
          waterGoal: 6,
          sleepCurrent: 8,
          sleepGoal: 10,
          walkCurrent: 4000,
          walkGoal: 5000,
          foodCurrent: 5,
          foodGoal: 8,
        ),
      );
      return cubit;
    },
    act: (cubit) => cubit.loadTodaySummary(),
    expect: () => [
      HabitsLoading(),
      isA<HabitsLoaded>(),
    ],
  );
}
