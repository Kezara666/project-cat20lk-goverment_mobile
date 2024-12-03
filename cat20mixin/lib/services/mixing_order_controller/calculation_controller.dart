import 'package:cat20mixing/models/mixin_order_resource.dart';
import 'package:get/get.dart';

class CalculationController extends GetxController {
  var amount = '0'.obs; // Observable for amount
  var vatChecked = false.obs;
  var nbtChecked = false.obs;
  var stampChecked = false.obs;

  var vatValue = 0.0.obs;
  var nbtValue = 0.0.obs;
  var stamp = '0'.obs;
  var sumTotal = 0.0.obs;
  var preAmount = '0'.obs;

  var vatRatio = 0.15.obs;
  var nbtRatio = 0.01.obs;

  // Function to fetch the VAT resource and update vatRatio
  Future<void> fetchAndSetVatRatio(int vatRate) async {
    this.vatRatio.value = double.parse(vatRate.toString())/100 ;
  }
  Future<void> fetchAndSetNBTRatio(int nbtPercentage) async{
    this.nbtRatio.value = double.parse(nbtPercentage.toString())/100 ;
  }

  // Function to calculate the sumTotal
  void recalculateSumTotal() {
    //assign vat value
    double amountDouble =
        double.tryParse(amount.value) ?? 0.0; // Safely parse to double
    vatValue.value = vatChecked.value ? amountDouble * vatRatio.value : 0.0;

    //assign NBT value
    // Update NBT value based on the checkbox status
    nbtValue.value = nbtChecked.value ? amountDouble * nbtRatio.value : 0.0;

    sumTotal.value = vatValue.value +
        nbtValue.value +
        (double.tryParse(amount.value) ?? 0.0) +
        (double.tryParse(stamp.value) ?? 0.0);
  }

  // Update the amount
  void updateAmount(String value) {
    preAmount.value = amount.value;
    int? parsedValue = int.tryParse(value);
    if (parsedValue == null) {
      amount.value = '0'; // Default value
    } else {
      amount.value = value; // Valid input
    }

    recalculateSumTotal();
  }

  // Update VAT checkbox
  void updateVatChecked(bool value) {
    vatChecked.value = value;
    // Parse the amount to a double before calculating VAT value

    recalculateSumTotal(); // Ensure this function recalculates the total with VAT
  }

  // Update NBT checkbox
  void updateNbtChecked(bool value) {
    nbtChecked.value = value;

    recalculateSumTotal();
  }

  // Update Stamp checkbox
  void updateStampChecked(bool value) {
    stampChecked.value = value;
    if (!stampChecked.value) {
      stamp.value = '0'; // Reset stamp to 0 if unchecked
    }
    recalculateSumTotal();
  }

  // Update Stamp value
  void updateStamp(String value) {
    int? parsedValue = int.tryParse(value);
    if (parsedValue == null) {
      stamp.value = '0'; // Default value
    } else {
      stamp.value = value; // Valid input
    }
    recalculateSumTotal();
  }

  void clearAll() {
  // Resetting boolean observables
  vatChecked.value = false;
  nbtChecked.value = false;
  stampChecked.value = false;

  // Resetting numeric observables
  amount.value = '0';
  vatValue.value = 0.0;
  nbtValue.value = 0.0;
  stamp.value = '0';
  sumTotal.value = 0.0;
  preAmount.value = '0';

}


  
}
