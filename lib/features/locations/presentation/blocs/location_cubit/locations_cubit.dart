import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ampera_vision_test/features/locations/domain/models/location_model.dart';
import 'package:ampera_vision_test/features/locations/domain/repositories/locations_repo.dart';

part 'locations_state.dart';
part 'locations_cubit.freezed.dart';

@injectable
class LocationsCubit extends Cubit<LocationsState> {
  final LocationsRepo _locationsRepo;
  LocationsCubit(this._locationsRepo) : super(LocationsState.initial());

  void getLocations() async {
    emit(LocationsState.inProgress());
    final dataState = await _locationsRepo.getLocations();
    if (dataState.isSuccess()) {
      emit(LocationsState.success(dataState.data ?? []));
    } else {
      emit(LocationsState.failure());
    }
  }
}
