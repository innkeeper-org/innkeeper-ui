

import 'dart:math';

import 'package:frontend/front_office/models/billing_account.dart';
import 'package:frontend/front_office/models/room_booking.dart';

import '../models/billing_account.dart';

abstract class BillingAccountRepository {
  BillingAccount getBillingAccountByRoomBooking({required RoomBooking roomBooking});
  BillingAccount addCharge({required int id, required Charge charge});
  BillingAccount addPayment({required int id, required Payment payment});

  static BillingAccount getDefaultBillingAccount({required RoomBooking roomBooking}) {
    List<Charge> chargeList = [];
    for(int i = 0; i < 10; i++) {
      chargeList.add(Charge(id: i, description: "Room Charge", price: roomBooking.price, dateTime: DateTime.now()));
    }
    List<Payment> paymentList = [];
    for(int j = 0; j < 5; j++) {
      paymentList.add(Payment(id: j, amount: 2000, reference: "Payment", collectionBox: "C1", dateTime: DateTime.now()));
    }
    BillingAccount billingAccount = BillingAccount(id: 123, guest: roomBooking.guest!, status: BillingAccountStatus.open,
        chargeList: chargeList, paymentList: paymentList);
    return billingAccount;
  }

  static BillingAccount getDefaultBillingAccountForRBL({required List<RoomBooking> roomBookingList}) {
    List<Charge> chargeList = [];
    for(RoomBooking roomBooking in roomBookingList) {
      for (int i = 0; i < 10; i++) {
        chargeList.add(Charge(id: i,
            description: "Room Charge",
            price: roomBooking.price,
            dateTime: DateTime.now()));
      }
    }
    List<Payment> paymentList = [];
    for(int j = 0; j < 5; j++) {
      paymentList.add(Payment(id: j, amount: 5000, reference: "Payment", collectionBox: "C1", dateTime: DateTime.now()));
    }
    BillingAccount billingAccount = BillingAccount(id: 123, guest: roomBookingList[0].guest!, status: BillingAccountStatus.open,
        chargeList: chargeList, paymentList: paymentList,
     roomBookingList: roomBookingList.getRange(Random().nextInt(roomBookingList.length), roomBookingList.length - 1).toList());
    return billingAccount;
  }
}