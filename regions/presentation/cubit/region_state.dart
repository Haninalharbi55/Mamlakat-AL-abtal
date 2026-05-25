import 'package:equatable/equatable.dart';

abstract class RegionState extends Equatable {
  const RegionState();

  @override
  List<Object> get props => [];
}

class RegionInitial extends RegionState {}

class RegionLoading extends RegionState {}

class RegionLoaded extends RegionState {}

class RegionError extends RegionState {
  final String message;

  const RegionError(this.message);

  @override
  List<Object> get props => [message];
}
