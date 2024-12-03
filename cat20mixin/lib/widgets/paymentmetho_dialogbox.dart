import 'package:cat20mixing/services/mixing_order_controller/mixing_order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PaymentDialog extends StatefulWidget {
  @override
  _PaymentDialogState createState() => _PaymentDialogState();
}

class _PaymentDialogState extends State<PaymentDialog> {
  MixingOrderController orderController = Get.find();
  var cheqBank = '';
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Payment Method'),
      content: SingleChildScrollView(
        child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRadioOption(1, 'Cash'),
                _buildRadioOption(2, 'Cheque'),
                if (orderController.selectedPaymentMethod.value == 2)
                  _buildChequeFields(),
                _buildRadioOption(3, 'Cross'),
                _buildRadioOption(4, 'Direct'),
              ],
            )),
      ),
      actions: [
        TextButton(
          onPressed: () {}, // No data returned
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            orderController.bankName.value = cheqBank;
            // Return selected data
            if (orderController.selectedPaymentMethod.value == 2) {
              // Validate Cheque Fields
              if (orderController.chequeNumber.value.isEmpty ||
                  orderController.bankName.value.isEmpty ||
                  orderController.chequeDate.value == null) {
                Get.snackbar(
                  'Error',
                  'Please fill all cheque details',
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Colors.redAccent,
                  colorText: Colors.white,
                );
                return;
              }
            }

            // Return selected data
            Navigator.of(context).pop({
              'paymentMethod': orderController.selectedPaymentMethod.value,
              'chequeNumber': orderController.chequeNumber.value,
              'bankName': orderController.bankName.value,
              'chequeDate': orderController.chequeDate.value,
            });
          },
          child: Text('Submit'),
        ),
      ],
    );
  }

  Widget _buildRadioOption(int value, String label) {
    return Obx(
      () => RadioListTile<int>(
        title: Text(label),
        value: value,
        groupValue: orderController.selectedPaymentMethod.value,
        onChanged: (newValue) {
          orderController.selectedPaymentMethod.value = newValue!;
        },
      ),
    );
  }

  Widget _buildChequeFields() {
    var cheqNumber = '';

    return Column(
      children: [
        TextField(
          controller: TextEditingController(text: cheqNumber),
          onChanged: (value) {
            orderController.chequeNumber.value = value;
            cheqNumber = value;
          },
          decoration: InputDecoration(labelText: 'Cheque Number'),
        ),
        TextField(
          controller: TextEditingController(text: cheqBank),
          onChanged: (value) {
            //orderController.bankName.value = value;
            cheqBank = value;
          },
          decoration: InputDecoration(labelText: 'Bank Name'),
        ),
        SizedBox(height: 10),
        TextButton(
          onPressed: () => _selectDate(context),
          child: Obx(() {
            return Text(
              orderController.chequeDate.value == null
                  ? 'Select Cheque Date'
                  : 'Cheque Date: ${DateFormat('yyyy-MM-dd').format(orderController.chequeDate.value!)}',
            );
          }),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      orderController.chequeDate.value = picked;
    }
  }
}
