import 'package:flutter_bloc/flutter_bloc.dart';
import 'region_state.dart';

class RegionCubit extends Cubit<RegionState> {
  RegionCubit() : super(RegionInitial());
}
