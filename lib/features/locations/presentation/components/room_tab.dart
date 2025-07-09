import 'package:ampera_vision_test/features/locations/presentation/components/room_inherited_widget.dart';
import 'package:ampera_vision_test/features/locations/presentation/components/slot_widget.dart';
import 'package:ampera_vision_test/styles/platform_specific_widgets/platform_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ampera_vision_test/config/injectable.dart';
import 'package:ampera_vision_test/features/booking/presentation/blocs/booking_cubit/booking_cubit.dart';
import 'package:ampera_vision_test/features/locations/domain/models/room_model.dart';
import 'package:ampera_vision_test/styles/general_widgets/general_widgets.dart';

class RoomTab extends StatefulWidget {
  final RoomModel roomModel;
  final DateTime chosenDate;
  const RoomTab({super.key, required this.roomModel, required this.chosenDate});

  @override
  State<RoomTab> createState() => _RoomTabState();
}

class _RoomTabState extends State<RoomTab> {
  late final BookingCubit cubit;
  late ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController();
    cubit = getIt<BookingCubit>()..getRoomSlots(widget.roomModel.id!, widget.chosenDate);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant RoomTab oldWidget) {
    if (oldWidget.chosenDate != widget.chosenDate) {
      scrollController.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.linear);
      cubit.getRoomSlots(widget.roomModel.id!, widget.chosenDate);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RoomModelInheritedWidget(
      roomModel: widget.roomModel,
      child: BlocProvider(
        create: (context) => cubit,
        child: BlocBuilder<BookingCubit, BookingState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => SizedBox(),
              inProgress: () => PlatformLoadingIndicator(),
              success: (slots) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 17),
                  child: BlankSpaceSepratedListViewBuilder(
                    itemCount: slots.length,
                    isScrollable: true,
                    scrollController: scrollController,
                    itemBuilder: (context, index) {
                      return SlotWidget(slotViewModel: slots.elementAt(index));
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
