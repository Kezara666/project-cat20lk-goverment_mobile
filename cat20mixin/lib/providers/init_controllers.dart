
import 'package:cat20mixing/services/mixing_order_controller/bank_details_controller.dart';
import 'package:cat20mixing/services/mixing_order_controller/calculation_controller.dart';
import 'package:cat20mixing/services/mixing_order_controller/gn_divitions_controller.dart';
import 'package:cat20mixing/services/mixing_order_controller/add_cutomer_controller.dart';
import 'package:cat20mixing/services/mixing_order_controller/mixing_order_controller.dart';
import 'package:cat20mixing/services/user_managmenet_controller/user_controller.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(() => MixingOrderAddCustomerController());
  Get.lazyPut(() => GNDivitionController());
  Get.lazyPut(() => BankDetailsController());
  Get.lazyPut(() => MixingOrderController());
  Get.lazyPut(() => CalculationController());
  Get.lazyPut(() => UserController());
}
