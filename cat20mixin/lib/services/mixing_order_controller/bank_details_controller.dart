import 'dart:convert';

import 'package:cat20mixing/enviroment/api.dart';
import 'package:cat20mixing/models/mixin_order_resource.dart';
import 'package:cat20mixing/services/user_managmenet_controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BankDetailsController extends GetxController {
  // Declare an RxList to hold AccountDetails
  RxList<AccountDetail> accountDetails = <AccountDetail>[].obs;
  Rx<AccountDetail?> selectedBankAccount = Rx<AccountDetail?>(null);
  RxList<Vote> VotesList = <Vote>[].obs;
  Rx<Vote?> selectedVote = Rx<Vote?>(null);
  RxList<MixinOrderLine> mixinOrderLines = <MixinOrderLine>[].obs;
  var balancesheetTitleList = <BalancesheetTitleResource>[].obs;
  Rx<BalancesheetTitleResource?> selectedBalancesheetTitle =
      Rx<BalancesheetTitleResource?>(null);
  Rx<BalancesheetSubtitle?> selectedBalancesheetSubtitle =
      Rx<BalancesheetSubtitle?>(null);
  Rx<PaymentVatResource?> paymentVatResource = Rx<PaymentVatResource?>(null);
  RxList<BalancesheetSubtitle> balancesheetSubtitleList =
      <BalancesheetSubtitle>[].obs;
  var balancesheetSubtitleListIsLoading = false.obs;

  Rx<NBTResource?> nbtResource = Rx<NBTResource?>(null);
  UserController userController = Get.find();

  // Function to fetch account details from API
  Future<void> fetchAccountDetails(int sabaId) async {
    try {
      final response = await http.get(
          headers: {
            'Content-Type': 'application/json', // Set appropriate headers
            'Authorization': 'Bearer ${userController.currentToken}'
          },
          Uri.parse(getAllAcountDetailsForSabha +
              '/$sabaId')); // Replace with your API URL

      if (response.statusCode == 200) {
        // Parse the response body and map it to AccountDetail list
        List<dynamic> data = json.decode(response.body);
        accountDetails.value = data
            .map((item) => AccountDetail.fromJson(item))
            .toList(); // Update the RxList with parsed data
      } else {
        // Handle error response
        Get.snackbar(
          'Status Updated', // Title
          'Failed to load account details:', // Message
          snackPosition: SnackPosition.TOP, // Snackbar position
          backgroundColor: const Color.fromARGB(
              255, 225, 31, 31), // Snackbar background color
          colorText: Colors.white, // Text color
          duration: Duration(seconds: 3), // Duration
        );
        print('Failed to load account details: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar(
        'Status Updated', // Title
        'Failed to load account details:$e', // Message
        snackPosition: SnackPosition.TOP, // Snackbar position
        backgroundColor:
            const Color.fromARGB(255, 225, 31, 31), // Snackbar background color
        colorText: Colors.white, // Text color
        duration: Duration(seconds: 3), // Duration
      );
      print('Error occurred: $e');
    }
  }

  void getVoteForBankAccount(int officeId, int bankAccountId) async {
    try {
      final response = await http.get(
          headers: {
            'Content-Type': 'application/json', // Set appropriate headers
            'Authorization': 'Bearer ${userController.currentToken}'
          },
          Uri.parse(getAllVoteAssignmentForSabhaAndAccountDetailId +
              '/$officeId/$bankAccountId')); // Replace with your API URL

      if (response.statusCode == 200) {
        // Parse the response body and map it to AccountDetail list
        List<dynamic> data = json.decode(response.body);
        VotesList.value = data
            .where((item) => item['voteAssignmentDetails']?.length > 0)
            .map((item) => Vote.fromJson(item))
            .toList(); // Update the RxList with parsed data
      } else {
        selectedBankAccount.value = null;
        //VotesList.value = [];
        // Handle error response
        Get.snackbar(
          'Status Updated', // Title
          'Failed to load account details:', // Message
          snackPosition: SnackPosition.TOP, // Snackbar position
          backgroundColor: const Color.fromARGB(
              255, 225, 31, 31), // Snackbar background color
          colorText: Colors.white, // Text color
          duration: Duration(seconds: 3), // Duration
        );
        print('Failed to load account details: ${response.statusCode}');
      }
    } catch (e) {
      selectedBankAccount.value = null;
      //VotesList.value = [];
      Get.snackbar(
        'Status Updated', // Title
        'Failed to load account details:$e', // Message
        snackPosition: SnackPosition.TOP, // Snackbar position
        backgroundColor:
            const Color.fromARGB(255, 225, 31, 31), // Snackbar background color
        colorText: Colors.white, // Text color
        duration: Duration(seconds: 3), // Duration
      );
      print('Error occurred: $e');
    }
  }

  //getBalancesheetTitleForSelectedAccountId
  Future<void> getBalancesheetTitleForSelectedAccountId(int accountId) async {
    try {
      final response = await http.get(
          headers: {
            'Content-Type': 'application/json', // Set appropriate headers
            'Authorization': 'Bearer ${userController.currentToken}'
          },
          Uri.parse(getAllBalancesheetTitlesForAccountDetailId +
              '/$accountId')); // Replace with your API URL

      if (response.statusCode == 200) {
        // Parse the response body and map it to AccountDetail list
        List<dynamic> data = json.decode(response.body);
        balancesheetTitleList.value = data
            .map((item) => BalancesheetTitleResource.fromJson(item))
            .toList(); // Update the RxList with parsed data
      } else {
        //VotesList.value = [];
        // Handle error response
        Get.snackbar(
          'Status Updated', // Title
          'Failed to load balancesheetTitleList:', // Message
          snackPosition: SnackPosition.TOP, // Snackbar position
          backgroundColor: const Color.fromARGB(
              255, 225, 31, 31), // Snackbar background color
          colorText: Colors.white, // Text color
          duration: Duration(seconds: 3), // Duration
        );
        print('Failed to load account details: ${response.statusCode}');
      }
    } catch (e) {
      //VotesList.value = [];
      Get.snackbar(
        'Status Updated', // Title
        'Failed to load account details:$e', // Message
        snackPosition: SnackPosition.TOP, // Snackbar position
        backgroundColor:
            const Color.fromARGB(255, 225, 31, 31), // Snackbar background color
        colorText: Colors.white, // Text color
        duration: Duration(seconds: 3), // Duration
      );
      print('Error occurred: $e');
    }
  }

  Future<void> getBalancesheetSubtitlesForTitleAndAccount(
      int titleId, int accountId) async {
    try {
      balancesheetSubtitleListIsLoading.value = true;

      final response = await http.get(
          headers: {
            'Content-Type': 'application/json', // Set appropriate headers
            'Authorization': 'Bearer ${userController.currentToken}'
          },
          Uri.parse(
              '$getAllBalancesheetSubtitlesForTitleIDAndAccountDetailID/$titleId/$accountId')); // Replace with your API URL

      if (response.statusCode == 200) {
        // Parse the response body and map it to BalancesheetSubtitle list
        List<dynamic> data = json.decode(response.body);
        balancesheetSubtitleList.value = data
            .map((item) => BalancesheetSubtitle.fromJson(item))
            .toList(); // Update the RxList with parsed data
        balancesheetSubtitleListIsLoading.value = false;
      } else {
        balancesheetSubtitleListIsLoading.value = false;
        // Handle error response
        Get.snackbar(
          'Error', // Title
          'Failed to load balancesheet subtitles.', // Message
          snackPosition: SnackPosition.TOP, // Snackbar position
          backgroundColor: const Color.fromARGB(
              255, 225, 31, 31), // Snackbar background color
          colorText: Colors.white, // Text color
          duration: const Duration(seconds: 3), // Duration
        );
        print('Failed to load balancesheet subtitles: ${response.statusCode}');
      }
    } catch (e) {
      balancesheetSubtitleListIsLoading.value = false;
      // Handle exceptions
      Get.snackbar(
        'Error', // Title
        'Failed to load balancesheet subtitles: $e', // Message
        snackPosition: SnackPosition.TOP, // Snackbar position
        backgroundColor:
            const Color.fromARGB(255, 225, 31, 31), // Snackbar background color
        colorText: Colors.white, // Text color
        duration: const Duration(seconds: 3), // Duration
      );
      print('Error occurred: $e');
    }
  }

  Future<PaymentVatResource?> fetchPaymentVatResource() async {
    try {
      final response = await http.get(headers: {
        'Content-Type': 'application/json', // Set appropriate headers
        'Authorization': 'Bearer ${userController.currentToken}'
      }, Uri.parse('$getVatRatioAPI'));

      if (response.statusCode == 200) {
        // Parse the response body into a single PaymentVatResource object
        final data = jsonDecode(response.body);
        this.paymentVatResource.value = PaymentVatResource.fromJson(data);
        return paymentVatResource.value;
      } else {
        throw Exception(
            'Failed to load PaymentVatResource: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar(
        'Error', // Title
        'fetchPaymentVatResource $e', // Message
        snackPosition: SnackPosition.TOP, // Snackbar position
        backgroundColor:
            const Color.fromARGB(255, 225, 31, 31), // Snackbar background color
        colorText: Colors.white, // Text color
        duration: const Duration(seconds: 3), // Duration
      );
      print('Error occurred: $e');

      print('Error occurred while fetching PaymentVatResource: $e');
      rethrow;
    }
  }

  Future<NBTResource?> fetchNBTResource() async {
    try {
      final response = await http.get(headers: {
        'Content-Type': 'application/json', // Set appropriate headers
        'Authorization': 'Bearer ${userController.currentToken}'
      }, Uri.parse('$getPaymentNbtsByIdAPI'));

      if (response.statusCode == 200) {
        // Parse the response body into a single NBTResource object
        final data = jsonDecode(response.body);
        this.nbtResource.value = NBTResource.fromJson(data);
        return nbtResource.value;
      } else {
        throw Exception('Failed to load NBTResource: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar(
        'Error', // Title
        'fetchNBTResource $e', // Message
        snackPosition: SnackPosition.TOP, // Snackbar position
        backgroundColor:
            const Color.fromARGB(255, 225, 31, 31), // Snackbar background color
        colorText: Colors.white, // Text color
        duration: const Duration(seconds: 3), // Duration
      );
      print('Error occurred: $e');
      rethrow;
    }
  }

  // Method to add an order line
  void addOrderLine(MixinOrderLine orderLine) {
    mixinOrderLines.add(orderLine);

    Get.snackbar(
      'Mixing Order line', // Title
      'Mixing Order line added', // Message
      snackPosition: SnackPosition.TOP, // Snackbar position
      backgroundColor:
          const Color.fromARGB(255, 11, 136, 219), // Snackbar background color
      colorText: Colors.white, // Text color
      duration: Duration(seconds: 5), // Duration
    );
  }

  // Method to remove an order line by index
  void removeOrderLine(int index) {
    mixinOrderLines.removeAt(index);
  }

  void clearAll() {
    //accountDetails.clear(); // Clear the account details list
    selectedBankAccount.value = null; // Reset selected bank account

    VotesList.clear(); // Clear the votes list
    selectedVote.value = null; // Reset selected vote

    // mixinOrderLines.clear(); // Clear the mixin order lines

    balancesheetTitleList.clear(); // Clear balancesheet title list
    selectedBalancesheetTitle.value = null; // Reset selected balancesheet title

    balancesheetSubtitleList.clear(); // Clear balancesheet subtitle list
    selectedBalancesheetSubtitle.value =
        null; // Reset selected balancesheet subtitle

    //paymentVatResource.value = null; // Reset payment VAT resource
  }

  void cleanBalancesheats() {
    //balancesheetTitleList.clear(); // Clear balancesheet title list
    //balancesheetSubtitleList.clear(); // Clear balancesheet subtitle list
    selectedBalancesheetSubtitle.value = null;
  }

  void cleanVote() {
    selectedVote.value = null;
  }
}
