import 'dart:convert';
import 'package:cat20mixing/enviroment/api.dart';
import 'package:cat20mixing/models/mixin_order_resource.dart';
import 'package:cat20mixing/widgets/barcode_dialog.dart';
import 'package:cat20mixing/services/mixing_order_controller/add_cutomer_controller.dart';
import 'package:cat20mixing/services/mixing_order_controller/bank_details_controller.dart';
import 'package:cat20mixing/services/user_managmenet_controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class MixingOrderController extends GetxController {
  var currentSession = {'id': 0, 'name': ''}.obs;
  var categoryId = 1.obs;
  var selectedOrderStatus = 1.obs;
  var barcode = ''.obs;
  var mixingOrderList = <MixingOrderResource>[].obs;
  var nonFilterdMixingOrderList = <MixingOrderResource>[].obs;
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;
  MixingOrderAddCustomerController mixingOrderAddCustomerController =
      Get.find();
  UserController userController = Get.find();

  BankDetailsController bankDetailsController = Get.find();

  //Change State Related
  var selectedStatus = 10.obs;

  //Payment Method Related
  var selectedPaymentMethod = 1.obs; // Default to 'Cash'
  var chequeNumber = ''.obs;
  var bankName = ''.obs;
  var chequeDate = Rxn<DateTime>();

  String getPaymentMethodName(int? paymentMethodId) {
    const paymentMethods = {
      1: 'Cash',
      2: 'Cheque',
      3: 'Cross',
      4: 'Direct',
    };

    return paymentMethods[paymentMethodId] ?? 'Unknown';
  }
  //

  // Method to change the status
  void updateStatus(int status) {
    selectedStatus.value = status;
    print('Selected Status: $status');
  }

  @override
  void onInit() {
    super.onInit();
    // Load initial session and orders
    currentSession.value = {'id': 1, 'name': 'Active Session'};
    getPlacedOrdersByUserByCategoryByState(
        int.parse(userController.currentUserId.value) ?? 3,
        categoryId.value,
        selectedOrderStatus.value);
    mixingOrderList.value = mixingOrderList.value;
  }

  void refreshList() {
    this.isLoading.value = true;
    //orders.refresh(); // To simulate a refresh
    getPlacedOrdersByUserByCategoryByState(
        int.parse(userController.currentUserId.value) ?? 3,
        categoryId.value,
        selectedOrderStatus.value);
    mixingOrderList.value = mixingOrderList.value;
  }

  void applyFilter(String filter) {
    var filteredOrders = mixingOrderList.where((order) {
      // Assuming the customer name is a field in the MixingOrderResource model
      return order.customerName!.toLowerCase().contains(filter.toLowerCase());
    }).toList();

    // Update the list with the filtered orders
    mixingOrderList.assignAll(filteredOrders);
    if (filter == '') {
      mixingOrderList.assignAll(nonFilterdMixingOrderList.value);
    }
  }

  void changeStatus(int status) {
    selectedOrderStatus.value = status;
    Get.snackbar(
      'Status Updated', // Title
      'Selected Status: ' + getStatusString(status), // Message
      snackPosition: SnackPosition.BOTTOM, // Snackbar position
      backgroundColor: Colors.green, // Snackbar background color
      colorText: Colors.white, // Text color
      duration: Duration(seconds: 3), // Duration
    );
    getPlacedOrdersByUserByCategoryByState(
        int.parse(userController.currentUserId.value) ?? 3,
        categoryId.value,
        selectedOrderStatus.value);
  }

  //API Call and Get The Data
  Future<List<MixingOrderResource>> getPlacedOrdersByUserByCategoryByState(
      int userid, int category, int state) async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      final url = Uri.parse(getPlacedOrdersByUserByCategoryByStateAPI +
          '/$userid/$category/$state');
      final response = await http.get(
        headers: {
          'Content-Type': 'application/json', // Set appropriate headers
          'Authorization': 'Bearer ${userController.currentToken}'
        },
        url,
      );

      if (response.statusCode == 200) {
        print(response.body);
        List<dynamic> body = jsonDecode(response.body);
        var values =
            body.map((json) => MixingOrderResource.fromJson(json)).toList();
        mixingOrderList.assignAll(values);
        nonFilterdMixingOrderList.assignAll(values);
        return values;
      } else {
        throw Exception('Failed to load user details');
      }
    } catch (e) {
      errorMessage.value = 'Error: ${e.toString()}';
      isLoading.value = false;
      return this.mixingOrderList;
    } finally {
      isLoading.value = false;
    }
  }

  String getStatusString(int value) {
    switch (value) {
      case 1:
        return 'Draft';
      case 2:
        return 'Paid';
      case 3:
        return 'Posted';
      case 4:
        return 'Cancel Pending';
      case 5:
        return 'Cancel Approved';
      case 6:
        return 'Cancel Disapproved';
      default:
        return '--Select Status--'; // Default case for invalid or unselected value
    }
  }

  saveMixinOrder(bool dispute, int cId, MixingOrderResource orderResource,
      BuildContext context) async {
    try {
      var json = {
        "id": 0,
        "code": "",
        "customerName": orderResource.customerName ?? 'Customer',
        "customerNicNumber": orderResource.customerNicNumber ?? null,
        "customerMobileNumber": orderResource.customerMobileNumber ?? "string",
        "totalAmount": calculateTotalAmount(orderResource.mixinOrderLine),
        "chequeNumber": orderResource.chequeNumber ?? '',
        "chequeDate": orderResource.paymentMethodId == 4
            ? orderResource.chequeDate ?? ''
            : null,
        "chequeBankName": orderResource.chequeBankName ?? '',
        "state": 1,
        "createdAt": "2024-11-22T02:57:32.592Z",
        "createdBy": int.parse(userController.currentUserId.value) ?? 3,
        "updatedAt": "2024-11-22T02:57:32.592Z",
        "sessionId": 0,
        "paymentMethodId": orderResource.paymentMethodId ?? 4,
        "cashierId": 0,
        "partnerId": orderResource.partnerId ?? 0,
        "officeId": userController.currentOfficeId.value ?? 0,
        "accountDetailId":
            bankDetailsController.selectedBankAccount.value?.id ?? 0,
        "businessId": 0,
        "appCategoryId": 1,
        "businessTaxId": 0,
        "tradeLicenseStatus": 0,
        "taxTypeId": 0,
        "paymentDetailId": 1,
        "assmtBalByExcessDeduction": 0,
        "mixinOrderLine": orderResource.mixinOrderLine!.map((item) {
          return {
            "id": 0,
            "customVoteName": item.customVoteName ?? "string",
            "description": item.description ?? "string",
            "amount": item.amount ?? 0,
            "paymentVatAmount": item.paymentVatAmount ?? 0,
            "paymentNbtAmount": item.paymentNbtAmount ?? 0,
            "stampAmount": item.stampAmount ?? 0,
            "totalAmount": item.totalAmount ?? 0,
            "createdAt": "2024-11-22T02:57:32.592Z",
            "updatedAt": "2024-11-22T02:57:32.592Z",
            "mixinVoteAssignmentDetailId":
                item.mixinVoteAssignmentDetailId ?? 0,
            "voteDetailId": item.voteDetailId ?? 0,
            "classificationId": item.classificationId ?? 0,
            "paymentVatId": item.paymentVatId ?? 0,
            "paymentNbtId": item.paymentNbtId ?? 0,
            "mixinOrderId": item.mixinOrderId ?? 0,
            "voteOrBal": item.voteOrBal,
            "votePaymentTypeId": 0,
            "assmtGrossAmount": 0,
            "assmtDiscountAmount": 0,
            "assmtDiscountRate": 0
          };
        }).toList()
      };
      Get.snackbar(
        'Please wait order progressing', // Title
        'Please wait order progressing', // Message
        snackPosition: SnackPosition.BOTTOM, // Snackbar position
        backgroundColor: const Color.fromARGB(
            255, 70, 205, 137), // Snackbar background color
        colorText: Colors.white, // Text color
        duration: Duration(seconds: 10), // Duration
      );

      // Send the POST request
      final response = await http.post(
        headers: {
          'Content-Type': 'application/json', // Set appropriate headers
          'Authorization': 'Bearer ${userController.currentToken}'
        },
        Uri.parse(saveOnlineMixinOrder),

        body: jsonEncode(json), // Serialize the payload
      );

      // Check the response status
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar(
          'Order Created', // Title
          'Order Created', // Message
          snackPosition: SnackPosition.BOTTOM, // Snackbar position
          backgroundColor: Colors.green, // Snackbar background color
          colorText: Colors.white, // Text color
          duration: Duration(seconds: 3), // Duration
        );
        final barcodeValue = DateTime.now().millisecondsSinceEpoch;
        //clean order lines
        bankDetailsController.mixinOrderLines.clear();

        print('Order saved successfully: ${response.body}');
        Map<String, dynamic> body = jsonDecode(response.body);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            Get.snackbar(
              'Order Created', // Title
              'Order Created', // Message
              snackPosition: SnackPosition.BOTTOM, // Snackbar position
              backgroundColor: Colors.green, // Snackbar background color
              colorText: Colors.white, // Text color
              duration: Duration(seconds: 3), // Duration
            );
            return BarcodeDialog(
              barcodeValue: barcodeValue.toString(),
            );
          },
        );
        //return body;
      } else {
        print(
            'Failed to save order: ${response.statusCode} - ${response.body}');
        Get.snackbar(
          'Order Failed ${response.body}', // Title
          'Order Failed', // Message
          snackPosition: SnackPosition.BOTTOM, // Snackbar position
          backgroundColor: const Color.fromARGB(
              255, 205, 70, 108), // Snackbar background color
          colorText: Colors.white, // Text color
          duration: Duration(seconds: 3), // Duration
        );
        return <dynamic>[];
      }
    } catch (e) {
      Get.snackbar(
        'Order Failed', // Title
        'Order Failed', // Message
        snackPosition: SnackPosition.BOTTOM, // Snackbar position
        backgroundColor: const Color.fromARGB(
            255, 205, 70, 108), // Snackbar background color
        colorText: Colors.white, // Text color
        duration: Duration(seconds: 3), // Duration
      );
      print('Error saving order: $e');
      return <dynamic>[];
    }
  }

  double calculateTotalAmount(List<MixinOrderLine>? mixinOrderLine) {
    if (mixinOrderLine == null || mixinOrderLine.isEmpty) {
      return 0.0; // Return 0 if the list is null or empty
    }
    return mixinOrderLine.fold(
        0.0, (sum, item) => sum + (item.totalAmount ?? 0.0));
  }
}
