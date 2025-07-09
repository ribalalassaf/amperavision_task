part of 'locations_cubit.dart';

@freezed
class LocationsState with _$LocationsState {
  const factory LocationsState.initial() = _Initial;
  const factory LocationsState.inProgress() = _InProgress;
  const factory LocationsState.success(List<LocationModel> locations) = _Success;
  const factory LocationsState.failure() = _Failure;
}
