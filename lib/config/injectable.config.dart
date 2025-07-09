// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../features/booking/data/datasource/booking_ds.dart' as _i994;
import '../features/booking/data/repositories/booking_repo_impl.dart' as _i803;
import '../features/booking/domain/repositories/booking_repo.dart' as _i643;
import '../features/booking/presentation/blocs/booking_cubit/booking_cubit.dart'
    as _i657;
import '../features/locations/data/datasource/locations_ds.dart' as _i808;
import '../features/locations/data/repositories/locations_repo_impl.dart'
    as _i1022;
import '../features/locations/domain/repositories/locations_repo.dart' as _i43;
import '../features/locations/presentation/blocs/location_cubit/locations_cubit.dart'
    as _i417;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i808.LocationsDs>(() => _i808.LocationsDs());
    gh.lazySingleton<_i994.BookingDs>(() => _i994.BookingDs());
    gh.lazySingleton<_i43.LocationsRepo>(
      () => _i1022.LocationsRepoImpl(gh<_i808.LocationsDs>()),
    );
    gh.lazySingleton<_i643.BookingRepo>(
      () => _i803.BookingRepoImpl(gh<_i994.BookingDs>()),
    );
    gh.factory<_i417.LocationsCubit>(
      () => _i417.LocationsCubit(gh<_i43.LocationsRepo>()),
    );
    gh.factory<_i657.BookingCubit>(
      () => _i657.BookingCubit(gh<_i643.BookingRepo>()),
    );
    return this;
  }
}
