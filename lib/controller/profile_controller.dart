import 'package:get/get.dart';

import '../bottomnavigation/profile/payment_selection.dart';

class ProfileController extends GetxController {
  
  var payment = PayMethod.BankAccount;

  void updatPayment(PayMethod? payMethod) {
    payment = payMethod ?? PayMethod.Card;
    update();
  }
}
