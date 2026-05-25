part of 'region_progress_cubit.dart';

abstract class RegionProgressState extends Equatable {
  const RegionProgressState();

  @override
  List<Object> get props => [];
}

class RegionProgressInitial extends RegionProgressState {}

class RegionProgressLoading extends RegionProgressState {}

class RegionProgressLoaded extends RegionProgressState {
  final int completedDays;

  const RegionProgressLoaded({required this.completedDays});

  @override
  List<Object> get props => [completedDays];
}

class RegionProgressError extends RegionProgressState {
  final String message;

  const RegionProgressError({required this.message});

  @override
  List<Object> get props => [message];
}
