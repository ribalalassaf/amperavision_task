// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:ampera_vision_test/features/locations/domain/models/location_model.dart'
    as _i5;
import 'package:ampera_vision_test/features/locations/presentation/location_info_page.dart'
    as _i1;
import 'package:ampera_vision_test/features/locations/presentation/locations_page.dart'
    as _i2;

/// generated route for
/// [_i1.LocationInfoPage]
class LocationInfoRoute extends _i3.PageRouteInfo<LocationInfoRouteArgs> {
  LocationInfoRoute({
    _i4.Key? key,
    required _i5.LocationModel location,
    List<_i3.PageRouteInfo>? children,
  }) : super(
         LocationInfoRoute.name,
         args: LocationInfoRouteArgs(key: key, location: location),
         initialChildren: children,
       );

  static const String name = 'LocationInfoRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LocationInfoRouteArgs>();
      return _i1.LocationInfoPage(key: args.key, location: args.location);
    },
  );
}

class LocationInfoRouteArgs {
  const LocationInfoRouteArgs({this.key, required this.location});

  final _i4.Key? key;

  final _i5.LocationModel location;

  @override
  String toString() {
    return 'LocationInfoRouteArgs{key: $key, location: $location}';
  }
}

/// generated route for
/// [_i2.LocationsPage]
class LocationsRoute extends _i3.PageRouteInfo<void> {
  const LocationsRoute({List<_i3.PageRouteInfo>? children})
    : super(LocationsRoute.name, initialChildren: children);

  static const String name = 'LocationsRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.LocationsPage();
    },
  );
}
