import 'dart:convert';

import 'package:cat20mixing/enviroment/api.dart';
import 'package:cat20mixing/models/mixin_order_resource.dart';
import 'package:cat20mixing/services/mixing_order_controller/gn_divitions_controller.dart';
import 'package:cat20mixing/services/user_managmenet_controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MixingOrderAddCustomerController extends GetxController {
  Partner partner = Partner();
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;
  RxBool containValuePartner = false.obs;
  UserController userController = Get.find();
  GNDivitionController gNDivitionController = Get.find();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController nicController = TextEditingController();
  final TextEditingController street1Controller = TextEditingController();
  final TextEditingController street2Controller = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController zipController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passportController = TextEditingController();

  // Method to update the Partner object
  void updatePartner(Partner newPartner) {
    partner = newPartner;
  }

  // Method to clear the Partner object
  void clearPartner() {
    partner = Partner();
    nameController.text = partner.name ?? '';
    mobileController.text = partner.mobileNumber ?? '';
    nicController.text = partner.nicNumber ?? '';
    street1Controller.text = partner.street1 ?? '';
    street2Controller.text = partner.street2 ?? '';
    cityController.text = partner.city ?? '';
    zipController.text = partner.zip ?? '';
    emailController.text = partner.email ?? '';
    passportController.text = partner.passportNo ?? '';
    gNDivitionController.selectedGNDivision.value = partner.gnDivision;
    update();
    containValuePartner.value = false;
  }

  getPartnerByPhoneNumber(String phoneNumber) async {
    if (phoneNumber.length == 10) {
      //print(phoneNumber);
      try {
        final url = Uri.parse(getPartnerByPhoneNumberAPI + '/$phoneNumber');
        final response = await http.get(headers: {
          'Content-Type': 'application/json', // Set appropriate headers
          'Authorization': 'Bearer ${userController.currentToken}'
        }, url);

        if (response.statusCode == 200) {
          var body = jsonDecode(response.body);

          // Check if the response is a list or a map (object)
          // Check if the response is a list or a map (object)
          if (body is List) {
            // If the body is a list, map it to Partner objects
            var values = body.map((json) => Partner.fromJson(json)).toList();
            return values;
          } else if (body is Map) {
            // Explicitly cast to Map<String, dynamic> to satisfy the method expectation
            var mapBody = body as Map<String, dynamic>;
            print(mapBody);
            // If the body is a map (e.g., a JSON object), handle accordingly
            //this.partner.value = Partner(id: mapBody["id"]);
            this.partner = Partner.fromJson(mapBody);
            // Update the TextEditingController values
            nameController.text = partner.name ?? '';
            mobileController.text = partner.mobileNumber ?? '';
            nicController.text = partner.nicNumber ?? '';
            street1Controller.text = partner.street1 ?? '';
            street2Controller.text = partner.street2 ?? '';
            cityController.text = partner.city ?? '';
            zipController.text = partner.zip ?? '';
            emailController.text = partner.email ?? '';
            passportController.text = partner.passportNo ?? '';
            gNDivitionController.selectedGNDivision.value = partner.gnDivision;
            update();
            containValuePartner.value = true;
            print(partner);
            Get.snackbar(
              'Selected Partner', // Title
              'Selected Partner: ${partner.name}', // Message
              snackPosition: SnackPosition.TOP, // Snackbar position
              backgroundColor: Colors.green, // Snackbar background color
              colorText: Colors.white, // Text color
              duration: Duration(seconds: 3), // Duration
            );
          }
        } else {
          Get.snackbar('Partner Missing',
              'Partner Missing You are going to create new user',
              snackPosition: SnackPosition.TOP);
          throw Exception('Failed to load user details');
        }
      } catch (e) {
        Get.snackbar('Partner Missing',
            'Partner Missing You are going to create new user',
            snackPosition: SnackPosition.TOP);
        // throw Exception('Failed to load user details');
        //errorMessage.value = 'Error: ${e.toString()}';
        isLoading.value = false;
        containValuePartner.value = false;
        //return this.mixingOrderList;
      } finally {
        isLoading.value = false;
      }
    }
  }

  savePartners(int loginUser) async {
    isLoading.value = true; // Show loading indicator
    try {
      // Construct the API endpoint
      final url =
          Uri.parse(savePartnersAPI); // Replace with your actual API URL

      // Create the request body using the Partner object
      final Map<String, dynamic> requestBody = {
        "id": this.partner.id != null && partner.id! >= 1 ? this.partner.id : 0,
        "name": nameController.text,
        "nicNumber": nicController.text,
        "mobileNumber": mobileController.text.isEmpty
            ? '0777951818'
            : mobileController.text,
        "phoneNumber": "string",
        "street1": street1Controller.text,
        "street2": street2Controller.text,
        "city": cityController.text,
        "zip": zipController.text,
        "email": emailController.text,
        "passportNo": passportController.text,
        "active": 0,
        "createdAt": "2024-11-21T16:30:55.342Z",
        "updatedAt": "2024-11-21T16:30:55.342Z",
        "isEditable": 0,
        "createdBy": int.parse(userController.currentUserId.value) ?? 3,
        "updatedBy": int.parse(userController.currentUserId.value) ?? 3,
        "gnDivisionId": gNDivitionController.selectedGNDivision.value?.id ?? 0,
        "gnDivision": null,
        "sabhaId": int.parse(userController.sabhaId.value) ?? 3,
        "isTempory": this.partner.id != null && partner.id! > 1 ? 0 : 1,
        "isBusinessOwner": 0,
        "isPropertyOwner": 0,
        "isBusiness": 0,
        "businessRegNo": "string",
        "profilePicPath": "string",
        "partnerMobiles": [],
        "partnerDocuments": [],
        "status": 0,
      };

      // Make the POST request
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json', // Set appropriate headers
          'Authorization': 'Bearer ${userController.currentToken}'
        },
        body: jsonEncode(requestBody), // Convert the request body to JSON
      );

      // Handle the response
      if (response.statusCode == 201 || response.statusCode == 200) {
        // Success
        var body = jsonDecode(response.body);

        // Check if the response is a list or a map (object)
        // Check if the response is a list or a map (object)
        if (body is Map) {
          // Explicitly cast to Map<String, dynamic> to satisfy the method expectation
          var mapBody = body as Map<String, dynamic>;
          print(mapBody);
          // If the body is a map (e.g., a JSON object), handle accordingly
          //this.partner.value = Partner(id: mapBody["id"]);
          this.partner = Partner.fromJson(mapBody);
          // Update the TextEditingController values
          nameController.text = partner.name ?? '';
          mobileController.text = partner.mobileNumber ?? '';
          nicController.text = partner.nicNumber ?? '';
          street1Controller.text = partner.street1 ?? '';
          street2Controller.text = partner.street2 ?? '';
          cityController.text = partner.city ?? '';
          zipController.text = partner.zip ?? '';
          emailController.text = partner.email ?? '';
          passportController.text = partner.passportNo ?? '';
          gNDivitionController.selectedGNDivision.value = partner.gnDivision;

          print(partner);
          update();
          containValuePartner.value = true;
        }
        //print('Partner saved successfully: $responseBody');
        Get.snackbar('Success', 'Partner saved successfully',
            snackPosition: SnackPosition.TOP);
        Get.snackbar(
          'Selected Partner', // Title
          'Selected Partner: ${partner.name}', // Message
          snackPosition: SnackPosition.BOTTOM, // Snackbar position
          backgroundColor: Colors.green, // Snackbar background color
          colorText: Colors.white, // Text color
          duration: Duration(seconds: 3), // Duration
        );
      } else {
        // Failure
        print('Failed to save partner: ${response.body}');
        errorMessage.value = 'Failed to save partner: ${response.body}';
        Get.snackbar('Error', 'Failed to save partner',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print('Error while saving partner: $e');
      errorMessage.value = 'Error: $e';
      Get.snackbar('Error', 'An error occurred: $e',
          snackPosition: SnackPosition.TOP);
    } finally {
      isLoading.value = false; // Hide loading indicator
    }
  }
}
