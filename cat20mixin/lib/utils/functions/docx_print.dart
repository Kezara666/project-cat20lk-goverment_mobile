import 'dart:io';
import 'package:cat20mixing/enviroment/api.dart';
import 'package:cat20mixing/models/mixin_order_resource.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
// To use asset loading
import 'package:permission_handler/permission_handler.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<void> callPaidMixinOrder(
    String jwt, MixingOrderResource order, int id, int cashierId) async {
  final String apiUrl =
      '$backendAPI/api/mixin/mixinOrder/paid'; // Replace with your actual base URL
  final String url = '$apiUrl/$id/$cashierId';
  final String orderId = order?.id?.toString() ?? 'unknown';

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json', // Adjust headers if needed
        'Authorization': 'Bearer $jwt', // If token is required
      },
      body: '', // Send an empty body as required
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Order paid successfully: ${response.body}');
      downloadAndSaveDocx(
          'https://test.cat2020.lk/birt/output?__report=mixinorderreceipt_small_57mm_eng.rptdesign&__format=docx&__svg=true&__locale=en_US&__timezone=IST&__masterpage=true&__rtl=false&__cubememsize=10&&__pageoverflow=0&__overwrite=false&printedBy=$cashierId&orderid=$orderId',
          '$orderId.docx');
    } else {
      Get.snackbar('Error', 'Failed to download file: ${response.statusCode}');
      print('Failed to pay order. Status Code: ${response.statusCode}');
      print('Response: ${response.body}');
    }
  } catch (e) {
    Get.snackbar('Error', 'Failed to download file: ${e}');
    print('Error: $e');
  }
}

Future<void> downloadAndSaveDocx(String apiUrl, String fileName) async {
  try {
    // Request storage permissions
    if (await _requestStoragePermission()) {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final directory = await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/$fileName';
        final file = File(filePath);

        await file.writeAsBytes(response.bodyBytes);
        Get.snackbar('File Saved', 'File saved successfully to $filePath');
        await OpenFile.open(filePath);
      } else {
        Get.snackbar('Error', 'Failed to download file: ${response.statusCode}');
      }
    } else {
      Get.snackbar('Permission Denied', 'Storage permission is required.');
    }
  } catch (e) {
    Get.snackbar('Error', 'An error occurred: $e');
  }
}

Future<bool> _requestStoragePermission() async {
  final status = await Permission.storage.request();
  return status.isGranted;
}