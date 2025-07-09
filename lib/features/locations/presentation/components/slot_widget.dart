import 'package:ampera_vision_test/features/booking/domain/models/slot_view_model.dart';
import 'package:ampera_vision_test/features/booking/presentation/components/booking_details_dialog.dart';
import 'package:ampera_vision_test/features/locations/presentation/components/location_inherited_widget.dart';
import 'package:ampera_vision_test/features/locations/presentation/components/room_inherited_widget.dart';
import 'package:ampera_vision_test/styles/colors.dart';
import 'package:ampera_vision_test/styles/fonts.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class SlotWidget extends StatelessWidget {
  final SlotViewModel slotViewModel;
  const SlotWidget({super.key, required this.slotViewModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (!slotViewModel.isReserved) {
          await showDialog(
            context: context,
            builder:
                (_) => BookingDetailsDialog(
                  locationName: LocationInheritedWidget.of(context)!.locationModel!.name!,
                  roomName: RoomModelInheritedWidget.of(context)!.roomModel!.name!,
                  start: slotViewModel.start,
                  end: slotViewModel.end,
                ),
          ).then((value) {
            if (value == true) {
              Fluttertoast.showToast(
                msg: "Success!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 14.0,
              );
            }
          });
        }
      },
      child: Container(
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
      ),
    );
  }
}
