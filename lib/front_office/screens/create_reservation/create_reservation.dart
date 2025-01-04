import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frontend/front_office/models/create_reservation_model.dart';
import 'package:frontend/front_office/screens/create_reservation/widgets/billing_information.dart';
import 'package:frontend/front_office/screens/create_reservation/widgets/guest_information.dart';
import 'package:frontend/front_office/screens/create_reservation/widgets/room_information.dart';
import 'package:frontend/util/constants.dart';
import 'package:provider/provider.dart';

class CreateReservationPageView extends StatefulWidget {
  const CreateReservationPageView({super.key});

  @override
  State<CreateReservationPageView> createState() => _CreateReservationState();
}

class _CreateReservationState extends State<CreateReservationPageView>
    with TickerProviderStateMixin {
  CreateReservationModel reservationModel =
      CreateReservationModel.fromJson(Constants.emptyCreateReservationModel);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => reservationModel,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.width * 0.5,
          child: DefaultTabController(
            length: 3,
            initialIndex: 0,
            child: Scaffold(
              appBar: AppBar(
                title: const Text("Create Reservation"),
                bottom: const TabBar(tabs: <Widget>[
                  Tab(text: "Guest Information", icon: Icon(Icons.person)),
                  Tab(text: "Room Information", icon: Icon(Icons.local_hotel)),
                  Tab(text: "Billing Information", icon: Icon(Icons.list))
                ]),
              ),
              body: TabBarView(children: <Widget>[
                GuestRegistrationWidget(),
                const RoomInformationWidget(),
                BillingInformationWidget(),
              ]),
            ),
          ),
        ));
  }
}
