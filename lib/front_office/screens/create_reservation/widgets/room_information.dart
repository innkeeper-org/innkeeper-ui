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
import '../../../util/custom_input_decoration.dart';

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
        elevation: 2,
        child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              FormBuilder(
                  key: GlobalKey<FormBuilderState>(),
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        name: "Room Booking ID",
                        initialValue: roomBooking.roomBookingId,
                        decoration: CustomInputDecoration(
                                labelText: "Booking ID",
                                hintText: "Booking ID",
                                icon: Icons.info_outline_rounded)
                            .formField,
                        onChanged: (e) {
                          roomBooking.roomBookingId = e!;
                        },
                        validator: FormBuilderValidators.compose(
                            [FormBuilderValidators.required()]),
                      ),
                      const SizedBox(
                        height: 20,
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
                          decoration: CustomInputDecoration(
                            labelText: "Status",
                            hintText: "Status",
                          ).formField,
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
                            decoration: CustomInputDecoration(
                                    labelText: "Room",
                                    hintText: "Room",
                                    icon: Icons.room_preferences_outlined)
                                .formField,
                            dropdownColor: Colors.white,
                            initialValue: roomBooking.room,
                            onChanged: (e) {
                              roomBooking.room = e!;
                            },
                          ),
                        )
                      ]),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(children: [
                        Expanded(
                          child: FormBuilderDateTimePicker(
                            name: "Booking Check In",
                            initialValue:
                                roomBooking.bookingCheckIn.toString() ==
                                        Constants.epochDate
                                    ? DateTime.now()
                                    : roomBooking.bookingCheckIn,
                            decoration: CustomInputDecoration(
                                    labelText: "Booking Check In",
                                    hintText: "Booking Check In",
                                    icon: Icons.calendar_month_outlined)
                                .formField,
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
                            decoration: CustomInputDecoration(
                                    labelText: "Booking Check Out",
                                    hintText: "Booking Check Out",
                                    icon: Icons.calendar_month_outlined)
                                .formField,
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
                              decoration: CustomInputDecoration(
                                labelText: "Pax",
                                hintText: "Pax",
                              ).formField,
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
                      const SizedBox(
                        height: 20,
                      ),
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
                                decoration: CustomInputDecoration(
                                        labelText: "Price (Tax Excluded)",
                                        hintText: "Price (Tax Excluded)",
                                        icon: Icons.currency_rupee_rounded)
                                    .formField,
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
                                decoration: CustomInputDecoration(
                                        labelText: "Price Discount",
                                        hintText: "Price Discount",
                                        icon: Icons.currency_rupee_rounded)
                                    .formField,
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
                                decoration: CustomInputDecoration(
                                        labelText: "Tax Rate",
                                        hintText: "Tax Rate",
                                        icon: Icons.percent_outlined)
                                    .formField,
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
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                          onPressed: () {
                            onDelete(roomBooking.roomBookingId);
                          },
                          color:
                              Colors.pink.shade50, // Pinkish background color
                          textColor: Colors.white, // Text color
                          padding: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(8.0), // Rounded corners
                          ),
                          elevation: 0,
                          child: const Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 30,
                            ),
                          ),
                    ],
                  ))
            ])));
  }
}
