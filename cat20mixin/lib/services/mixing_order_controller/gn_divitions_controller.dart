import 'dart:convert';

import 'package:cat20mixing/enviroment/api.dart';
import 'package:cat20mixing/models/mixin_order_resource.dart';
import 'package:cat20mixing/services/user_managmenet_controller/user_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GNDivitionController extends GetxController {
  var isLoading = false.obs; // Reactive loading state
  var errorMessage = ''.obs; // Reactive error message
  var gnDivisions = <GnDivisions>[].obs; // Reactive list
  var selectedGNDivision = Rxn<GnDivisions>(); // Reactive nullable object
  UserController userController = Get.find();

  getGNDivitions(int sabaId) async {
    try {
      var sabhaId = userController.sabhaId.value;
      isLoading.value = true;
      final url = Uri.parse(
          getGNDivitionsBySabhaId + '/$sabaId'); // Ensure correct endpoint
      final response = await http.get(headers: {
        'Content-Type': 'application/json', // Set appropriate headers
        'Authorization': 'Bearer ${userController.currentToken}'
      }, url);

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<GnDivisions> values =
            body.map((json) => GnDivisions.fromJson(json)).toList();
        gnDivisions.assignAll(values);
      } else {
        throw Exception('Failed to load GN Divisions');
      }
    } catch (e) {
      errorMessage.value = 'Error: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }
}
