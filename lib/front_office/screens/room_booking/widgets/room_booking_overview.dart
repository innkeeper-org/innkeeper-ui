
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/front_office/models/guest.dart';
import 'package:frontend/front_office/models/room_booking.dart';

class RoomBookingOverview extends StatelessWidget {
  RoomBooking roomBooking;
  RoomBookingOverview({super.key, required this.roomBooking});
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
        padding: const EdgeInsets.all(4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GuestOverview(guest: roomBooking.guest!),
            StayOverview(roomBooking: roomBooking)
          ],
        )
    );
  }

}

class GuestOverview extends StatelessWidget {
  Guest guest;

  GuestOverview({super.key, required this.guest});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            Text("Guest Details", style: themeData.textTheme.headlineSmall),
            const SizedBox(height: 20),
        Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: "Guest Name",
                      ),
                      readOnly: true,
                      initialValue: guest!.name,
                    )),
                    Expanded(child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.phone),
                        labelText: "Mobile",
                      ),
                      readOnly: true,
                      initialValue: guest!.phone,
                    )),
                    Expanded(child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.home),
                        labelText: "Address",
                      ),
                      readOnly: true,
                      initialValue: guest!.address,
                    )),
                  ],
                ),
            Row(
              children: [
                Expanded(child: TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: "Email",
                  ),
                  readOnly: true,
                  initialValue: guest!.email,
                )),
                Expanded(child: TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.work),
                    labelText: "Company",
                  ),
                  readOnly: true,
                  initialValue: guest!.company,
                ))
              ],
            )
          ],
        ));
  }

}

class StayOverview extends StatelessWidget {
  RoomBooking roomBooking;

  StayOverview({super.key, required this.roomBooking});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            Text("Stay Overview", style: themeData.textTheme.headlineSmall),
            const SizedBox(height: 20),
            Container(
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.calendar_today),
                        labelText: "Arrival Date",
                      ),
                      readOnly: true,
                      initialValue: roomBooking.checkIn.toString(),
                    )),
                    Expanded(child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.calendar_today),
                        labelText: "Departure Date",
                      ),
                      readOnly: true,
                      initialValue: roomBooking.bookingCheckOut.toString(),
                    )),
                    Expanded(child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.hotel),
                        labelText: "Room",
                      ),
                      readOnly: true,
                      initialValue: roomBooking.room.toString(),
                    )),
                    Expanded(child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.money),
                        labelText: "Total Price",
                      ),
                      readOnly: true,
                      initialValue: roomBooking.totalPrice().toString(),
                    ))
                  ],
                )),
          ],
        ));
  }
}