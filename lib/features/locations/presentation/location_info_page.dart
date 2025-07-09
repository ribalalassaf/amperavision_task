import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:ampera_vision_test/features/locations/domain/models/location_model.dart';
import 'package:ampera_vision_test/features/locations/presentation/components/room_tab.dart';
import 'package:ampera_vision_test/utils/extensions.dart';

@RoutePage()
class LocationInfoPage extends StatefulWidget {
  final LocationModel location;
  const LocationInfoPage({super.key, required this.location});

  @override
  State<LocationInfoPage> createState() => _LocationInfoPageState();
}

class _LocationInfoPageState extends State<LocationInfoPage> with TickerProviderStateMixin {
  late final TabController tabController;
  late final TabController dayTabController;
  @override
  void initState() {
    tabController = TabController(length: widget.location.rooms!.length, vsync: this);
    dayTabController = TabController(length: 7, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.location.name!),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.calendar_month))],
      ),
      body: Column(
        spacing: 20,
        children: [
          TabBar(
            controller: dayTabController,
            tabAlignment: TabAlignment.center,
            isScrollable: true,
            tabs:
                DateTime.now()
                    .getFollowingAndPreviousDates()
                    .map((element) => Tab(text: element.toIso8601String()))
                    .toList(),
          ),
          TabBar(
            controller: tabController,
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            tabs: widget.location.rooms!.map<Tab>((element) => Tab(text: element.name)).toList(),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: widget.location.rooms!.map<RoomTab>((element) => RoomTab(roomModel: element)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
