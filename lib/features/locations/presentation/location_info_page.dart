import 'package:ampera_vision_test/features/booking/presentation/components/custom_calendar.dart';
import 'package:ampera_vision_test/styles/colors.dart';
import 'package:ampera_vision_test/styles/fonts.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
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
  List<DateTime> dates = [];
  late DateTime pivotDate;

  @override
  void initState() {
    pivotDate = DateTime.now();
    dates = pivotDate.getFollowingAndPreviousDates();
    tabController = TabController(length: widget.location.rooms!.length, vsync: this);
    dayTabController = TabController(length: 9, vsync: this, initialIndex: 4);
    dayTabController.addListener(() {
      setState(() {
        pivotDate = dates.elementAt(dayTabController.index);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    dayTabController.dispose();
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.location.name!),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (_) {
                  return CalendarBottomSheet(
                    initialDate: pivotDate,
                    onDateSelected: (date) {
                      dayTabController.animateTo(4);
                      setState(() {
                        pivotDate = date;
                        dates = pivotDate.getFollowingAndPreviousDates();
                      });
                      context.maybePop();
                    },
                  );
                },
              );
            },
            icon: Icon(Icons.calendar_month),
          ),
        ],
      ),
      body: Column(
        spacing: 20,
        children: [
          TabBar(
            controller: tabController,
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            tabs: widget.location.rooms!.map<Tab>((element) => Tab(text: element.name)).toList(),
          ),
          TabBar(
            isScrollable: true,
            controller: dayTabController,
            dividerColor: Colors.transparent,
            splashBorderRadius: BorderRadius.circular(10),
            indicator: const BoxDecoration(),
            tabAlignment: TabAlignment.center,
            enableFeedback: false,
            labelPadding: const EdgeInsets.all(6),
            tabs: [
              for (int i = 0; i < dates.length; i++)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: (dayTabController.index == i) ? AppColors.black : AppColors.lightGrey,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    dates.elementAt(i).EEEDMMMOrName(),
                    style: FontStyles.semiboldStyle(color: AppColors.black),
                  ),
                ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children:
                  widget.location.rooms!
                      .map<RoomTab>((element) => RoomTab(roomModel: element, chosenDate: pivotDate))
                      .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
