import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:frontend/front_office/enum/room_booking_status.dart';
import 'package:frontend/front_office/models/create_reservation_model.dart';
import 'package:frontend/util/constants.dart';
import 'package:provider/provider.dart';

import '../../../models/room.dart';
import '../../../models/room_booking.dart';

class RoomInformationWidget extends StatelessWidget {
  const RoomInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<CreateReservationModel>(context);
    final roomBookings = model.roomBookings;
    return Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          MaterialButton(
              color: Colors.blueAccent,
              onPressed: () {
                model.addRoom(
                    RoomBooking.fromJson(Constants.emptyRoomBookingModel));
              },
              child: const Text("Add Booking")),
          const Divider(
            thickness: 2,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: roomBookings.length,
              itemBuilder: (context, index) {
                return RoomInformationDetailsItem(
                  roomBooking: roomBookings[index],
                  onDelete: model.removeRoom,
                );
              },
            ),
          )
        ]));
  }
}

class RoomInformationDetailsItem extends StatelessWidget {
  final RoomBooking roomBooking;
  final Function(String) onDelete;
  const RoomInformationDetailsItem(
      {required this.roomBooking, required this.onDelete, super.key});

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
                    onDelete(roomBooking.roomBookingId);
                  },
                  child: const Text("Remove Booking")),
              FormBuilder(
                  key: GlobalKey<FormBuilderState>(),
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        name: "Room Booking ID",
                        initialValue: roomBooking.roomBookingId,
                        decoration: const InputDecoration(labelText: "Booking ID"),
                        onChanged: (e) {
                          roomBooking.roomBookingId = e!;
                        },
                        validator: FormBuilderValidators.compose(
                            [FormBuilderValidators.required()]),
                      ),
                      Row(children: [
                        Expanded(
                            child: FormBuilderDropdown(
                          name: "Status",
                          items: [
                            ...RoomBookingStatus.values.map((e) =>
                                DropdownMenuItem(
                                    value: e, child: Text(e.toString())))
                          ],
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                          decoration:
                              const InputDecoration(labelText: "Status"),
                          dropdownColor: Colors.white,
                          initialValue: roomBooking.status,
                          onChanged: (e) {
                            roomBooking.status = e!;
                          },
                        )),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: FormBuilderDropdown(
                            name: "Room",
                            items: [
                              ...Room.getRoomList().map((e) => DropdownMenuItem(
                                  value: e, child: Text(e.name)))
                            ],
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                            decoration:
                                const InputDecoration(labelText: "Room"),
                            dropdownColor: Colors.white,
                            initialValue: roomBooking.room,
                            onChanged: (e) {
                              roomBooking.room = e!;
                            },
                          ),
                        )
                      ]),
                      Row(children: [
                        Expanded(
                          child: FormBuilderDateTimePicker(
                            name: "Booking Check In",
                            initialValue:
                                roomBooking.bookingCheckIn.toString() ==
                                        Constants.epochDate
                                    ? DateTime.now()
                                    : roomBooking.bookingCheckIn,
                            decoration: const InputDecoration(
                                labelText: "Booking Check In"),
                            inputType: InputType.date,
                            initialEntryMode: DatePickerEntryMode.calendarOnly,
                            onChanged: (v) {
                              roomBooking.bookingCheckIn = v!;
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: FormBuilderDateTimePicker(
                            name: "Booking Check Out",
                            initialValue: roomBooking.bookingCheckOut
                                        .toString() ==
                                    Constants.epochDate
                                ? DateTime.now().add(const Duration(days: 1))
                                : roomBooking.bookingCheckOut,
                            decoration: const InputDecoration(
                                labelText: "Booking Check Out"),
                            inputType: InputType.date,
                            initialEntryMode: DatePickerEntryMode.calendarOnly,
                            onChanged: (v) {
                              roomBooking.bookingCheckOut = v!;
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: FormBuilderTextField(
                              name: "Pax",
                              initialValue: roomBooking.pax.toString(),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                roomBooking.pax = int.tryParse(value!)!;
                              },
                              decoration:
                                  const InputDecoration(labelText: "Pax"),
                              inputFormatters: [
                                FilteringTextInputFormatter
                                    .digitsOnly, // Allow only digits
                              ],
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.numeric(),
                              ])),
                        )
                      ]),
                      Row(
                        children: [
                          Expanded(
                            child: FormBuilderTextField(
                                name: "Price (Tax Excluded)",
                                initialValue: roomBooking.price.priceWithoutTax
                                    .toString(),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  roomBooking.price.priceWithoutTax =
                                      double.tryParse(value!)!;
                                },
                                decoration: const InputDecoration(
                                    labelText: "Price (Tax Excluded)"),
                                inputFormatters: [
                                  FilteringTextInputFormatter
                                      .digitsOnly, // Allow only digits
                                ],
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.numeric(),
                                ])),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: FormBuilderTextField(
                                name: "Price Discount",
                                initialValue:
                                    roomBooking.price.discountRate.toString(),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  roomBooking.price.discountRate =
                                      double.tryParse(value!)!;
                                },
                                decoration: const InputDecoration(
                                    labelText: "Price Discount"),
                                inputFormatters: [
                                  FilteringTextInputFormatter
                                      .digitsOnly, // Allow only digits
                                ],
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.numeric(),
                                ])),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: FormBuilderTextField(
                                name: "Tax Rate",
                                initialValue:
                                    roomBooking.price.taxRate.toString(),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  roomBooking.price.taxRate =
                                      double.tryParse(value!)!;
                                },
                                decoration: const InputDecoration(
                                    labelText: "Tax Rate"),
                                inputFormatters: [
                                  FilteringTextInputFormatter
                                      .digitsOnly, // Allow only digits
                                ],
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.numeric(),
                                ])),
                          )
                        ],
                      )
                    ],
                  ))
            ])));
  }
}
