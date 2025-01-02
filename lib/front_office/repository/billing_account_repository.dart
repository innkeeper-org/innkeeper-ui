

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
      chargeList.add(Charge(id: i, description: "Room Charge", priceWithoutTax: roomBooking.priceWithoutTax, taxRate: roomBooking.taxRate, dateTime: DateTime.now()));
    }
    List<Payment> paymentList = [];
    for(int j = 0; j < 5; j++) {
      paymentList.add(Payment(id: j, amount: 2000, reference: "Payment", collectionBox: "C1", dateTime: DateTime.now()));
    }
    BillingAccount billingAccount = BillingAccount(id: 123, guest: roomBooking.guest!, billingAccountStatus: BillingAccountStatus.open,
        chargeList: chargeList, paymentList: paymentList);
    return billingAccount;
  }
}