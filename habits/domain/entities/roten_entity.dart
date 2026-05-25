import 'package:equatable/equatable.dart';

class RotenEntity extends Equatable {
  final bool foods;
  final bool drinks;
  final bool walks;
  final bool sleeps;

  const RotenEntity({
    required this.foods,
    required this.drinks,
    required this.walks,
    required this.sleeps,
  });

  @override
  List<Object?> get props => [foods, drinks, walks, sleeps];
}
