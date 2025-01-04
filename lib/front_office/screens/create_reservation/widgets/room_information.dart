import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:frontend/front_office/models/room_information_model.dart';
import 'package:frontend/front_office/models/create_reservation_model.dart';
import 'package:frontend/front_office/screens/create_reservation/widgets/custom_form_text_field.dart';
import 'package:frontend/util/constants.dart';
import 'package:provider/provider.dart';

class RoomInformationWidget extends StatelessWidget {
  const RoomInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      alignment: WrapAlignment.spaceBetween,
      runAlignment: WrapAlignment.spaceBetween,
      children: [RoomInformationDetails()],
    );
  }
}

class RoomInformationDetails extends StatelessWidget {
  const RoomInformationDetails({super.key});
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final model = Provider.of<CreateReservationModel>(context);
    final rooms = model.rooms;
    return Container(
        width: 800,
        height: MediaQuery.of(context).size.width * 0.5,
        padding: const EdgeInsets.all(15),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Room Information",
                style: theme.textTheme.bodyLarge,
              ),
              MaterialButton(
                  color: Colors.blueAccent,
                  onPressed: () {
                    model.addRoom(RoomInformationModel.fromJson(
                        Constants.emptyRoomInformationModel));
                  },
                  child: const Text("Add Room")),
              const Divider(
                thickness: 2,
              ),
              Expanded(child: ListView.builder(
                itemCount: rooms.length,
                itemBuilder: (context, index) {
                  return RoomInformationDetailsItem(
                    room: rooms[index],
                    onDelete: model.removeRoom,
                  );
                },
              ),)

            ]));
  }
}

class RoomInformationDetailsItem extends StatelessWidget {
  final RoomInformationModel room;
  final Function(String) onDelete;
  const RoomInformationDetailsItem(
      {required this.room, required this.onDelete, super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Card(
        color: theme.cardColor,
        elevation: 1,
        child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              MaterialButton(
                  color: Colors.red,
                  onPressed: () {
                    onDelete(room.roomNumber);
                  },
                  child: const Text("Delete Room")),
              FormBuilder(
                  key: GlobalKey<FormBuilderState>(),
                  child: Column(
                    children: [
                      CustomFormTextField(
                          name: "Room Type",
                          value: room.roomType,
                          onChanged: (e) {
                            room.roomType = e!;
                          },
                          validators: const []),
                      CustomFormTextField(
                          name: "Room Number",
                          value: room.roomNumber,
                          onChanged: (e) {
                            room.roomNumber = e!;
                          },
                          validators: const []),
                      CustomFormTextField(
                          name: "Adults",
                          value: room.adults,
                          onChanged: (e) {
                            room.adults = e!;
                          },
                          validators: const []),
                      CustomFormTextField(
                          name: "Children",
                          value: room.children,
                          onChanged: (e) {
                            room.children = e!;
                          },
                          validators: const []),
                      CustomFormTextField(
                          name: "Nights",
                          value: room.nights,
                          onChanged: (e) {
                            room.nights = e!;
                          },
                          validators: const []),
                      CustomFormTextField(
                          name: "Room Rate",
                          value: room.rate,
                          onChanged: (e) {
                            room.rate = e!;
                          },
                          validators: const []),
                    ],
                  ))
            ])));
  }
}
