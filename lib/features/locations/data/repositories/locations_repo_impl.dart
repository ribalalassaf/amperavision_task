import 'package:injectable/injectable.dart';
import 'package:ampera_vision_test/features/locations/data/datasource/locations_ds.dart';
import 'package:ampera_vision_test/features/locations/domain/models/location_model.dart';
import 'package:ampera_vision_test/features/locations/domain/repositories/locations_repo.dart';
import 'package:ampera_vision_test/utils/base_api_repository.dart';
import 'package:ampera_vision_test/utils/data_state.dart';

@LazySingleton(as: LocationsRepo)
class LocationsRepoImpl extends BaseApiRepository implements LocationsRepo {
  final LocationsDs _locationsDs;
  LocationsRepoImpl(this._locationsDs);
  @override
  Future<DataState<List<LocationModel>>> getLocations() {
    return sendRequest(request: _locationsDs.getLocations());
  }
}
