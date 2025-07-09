import 'package:ampera_vision_test/features/locations/domain/models/location_model.dart';
import 'package:ampera_vision_test/utils/data_state.dart';

abstract class LocationsRepo {
  Future<DataState<List<LocationModel>>> getLocations();
}
