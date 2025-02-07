
import 'package:flutter/material.dart';
import 'package:frontend/front_office/models/guest.dart';
import 'package:frontend/front_office/models/price.dart';
import 'package:frontend/front_office/models/room_booking.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'billing_account.g.dart';

enum BillingAccountStatus {
  open,
  closed;
}

@JsonSerializable()
class Charge {
  final int id;
  final String description;
  final Price price;
  final DateTime dateTime;
  final RoomBooking? roomBooking;

  Charge({required this.id, required this.description, required this.price, required this.dateTime,  this.roomBooking});
}

@JsonSerializable()
class Payment {
  final int id;
  final double amount;
  final String reference;
  final String collectionBox;
  final DateTime dateTime;

  Payment({
    required this.id,
    required this.amount,
    required this.reference,
    required this.collectionBox,
    required this.dateTime
});
}

@JsonSerializable()
class BillingAccount {
 final int id;
 final Guest guest;
 final BillingAccountStatus status;
 final List<Charge> chargeList;
 final List<Payment> paymentList;
 final List<RoomBooking>? roomBookingList;

 BillingAccount({
   required this.id,
   required this.guest,
   required this.status,
   required this.chargeList,
   required this.paymentList,
   this.roomBookingList,
});

  double getBalance() {
    double balance = 0.0;
    for(Charge charge in chargeList) {
      balance += charge.price.getAmount();
    }
    for(Payment payment in paymentList) {
      balance -= payment.amount;
    }
    return balance;
  }

  bool readyForInvoice() {
    for(RoomBooking roomBooking in roomBookingList ?? []) {
      if(roomBooking.status == RoomBookingStatus.BOOKED || roomBooking.status == RoomBookingStatus.CHECKED_OUT) {
        return false;
      }
    }
    return true;
  }

  Color getColor() {
    if(status == BillingAccountStatus.closed) {
      return Colors.grey.shade200;
    } else if(readyForInvoice()) {
      return Colors.red.shade100;
    } else {
      return Colors.yellowAccent.shade100;
    }
  }

}