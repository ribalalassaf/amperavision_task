import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ampera_vision_test/config/injectable.dart';
import 'package:ampera_vision_test/config/router/router.gr.dart';
import 'package:ampera_vision_test/features/locations/presentation/blocs/location_cubit/locations_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ampera_vision_test/styles/colors.dart';
import 'package:ampera_vision_test/styles/general_widgets/general_widgets.dart';
import 'package:ampera_vision_test/styles/platform_specific_widgets/platform_loading_indicator.dart';
import 'package:ampera_vision_test/styles/size_config.dart';

@RoutePage()
class LocationsPage extends StatelessWidget {
  const LocationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Our Locations")),
      extendBodyBehindAppBar: false,
      body: Padding(
        padding: EdgeInsetsGeometry.all(17),
        child: BlocProvider(
          create: (context) => getIt<LocationsCubit>()..getLocations(),
          child: BlocBuilder<LocationsCubit, LocationsState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => SizedBox(),
                failure: () => Text("Error loading locations"),
                inProgress: () => PlatformLoadingIndicator(),
                success:
                    (locations) => BlankSpaceSepratedListViewBuilder(
                      itemCount: locations.length,
                      isScrollable: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            context.pushRoute(LocationInfoRoute(location: locations.elementAt(index)));
                          },
                          child: Container(
                            height: SizeConfig.getRelativeHeight(100),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.borderDarkGrey),
                              borderRadius: BorderRadius.circular(10),
                            ),

                            child: Row(
                              spacing: 17,
                              children: [
                                CircleAvatar(radius: 30, backgroundColor: AppColors.borderDarkGrey),
                                Text(locations.elementAt(index).name!),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
              );
            },
          ),
        ),
      ),
    );
  }
}
