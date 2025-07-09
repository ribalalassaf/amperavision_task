import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ampera_vision_test/config/injectable.dart';
import 'package:ampera_vision_test/features/booking/domain/models/slot_view_model.dart';
import 'package:ampera_vision_test/features/booking/presentation/blocs/booking_cubit/booking_cubit.dart';
import 'package:ampera_vision_test/features/locations/domain/models/room_model.dart';
import 'package:ampera_vision_test/styles/colors.dart';
import 'package:ampera_vision_test/styles/fonts.dart';
import 'package:ampera_vision_test/styles/general_widgets/general_widgets.dart';

class RoomTab extends StatelessWidget {
  final RoomModel roomModel;
  const RoomTab({super.key, required this.roomModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BookingCubit>()..getRoomSlots(roomModel.id!, DateTime.now()),
      child: BlocBuilder<BookingCubit, BookingState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => SizedBox(),
            success: (slots) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 17),
                child: BlankSpaceSepratedListViewBuilder(
                  itemCount: slots.length,
                  isScrollable: true,
                  itemBuilder: (context, index) {
                    return SlotWidget(slotViewModel: slots.elementAt(index));
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class SlotWidget extends StatelessWidget {
  final SlotViewModel slotViewModel;
  const SlotWidget({super.key, required this.slotViewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: slotViewModel.durationSlots > 1 ? (30 * slotViewModel.durationSlots).toDouble() : 80,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        border: Border(left: BorderSide(color: !slotViewModel.isReserved ? Colors.green : Colors.red, width: 5)),
        borderRadius: BorderRadius.circular(5),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(DateFormat('HH:mm').format(slotViewModel.start)),
          if (slotViewModel.isReserved)
            Text("Fully reserved for ${slotViewModel.course}", style: FontStyles.boldStyle(color: Colors.red)),
          Text(DateFormat('HH:mm').format(slotViewModel.end)),
        ],
      ),
    );
  }
}
