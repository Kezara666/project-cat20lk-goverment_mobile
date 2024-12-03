import 'dart:ui';

import 'package:cat20mixing/services/mixing_order_controller/calculation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculationPage extends StatelessWidget {
  final CalculationController controller = Get.put(CalculationController()); // Initialize the controller

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double padding = screenWidth * 0.02; // Relative padding
    double spacing = screenWidth * 0.02; // Relative spacing
    double textSize = screenWidth * 0.06; // Relative text size
    double inputWidth = screenWidth * 0.7; // Relative width for input fields
    double resultWidth = screenWidth * 0.45; // Relative width for results box
    double resultPadding = screenWidth * 0.02; // Relative padding for results box
    double borderRadius = screenWidth * 0.02; // Relative border radius
    double blurRadius = screenWidth * 0.01; // Relative blur radius
    double boxShadowOffset = screenWidth * 0.005; // Relative shadow offset

    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        children: [
          // Amount input
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    controller.updateAmount(value);
                  },
                  decoration: InputDecoration(labelText: 'Amount'),
                ),
              ),
              SizedBox(width: spacing),
              // VAT, NBT, and Stamp checkboxes wrapped in a Container for layout
              
            ],
          ),
          Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => Container(
                        width: screenWidth * 0.7, // Set a relative width for the CheckboxListTile
                        child: CheckboxListTile(
                          title: Text('VAT ${controller.vatRatio *100} %', style: TextStyle(fontSize: textSize*0.8)),
                          value: controller.vatChecked.value,
                          onChanged: (value) {
                            controller.updateVatChecked(value!);
                          },
                        ),
                      )),
                  Obx(() => Container(
                        width: screenWidth * 0.7, // Set a relative width for the CheckboxListTile
                        child: CheckboxListTile(
                          title: Text('NBT ${controller.nbtRatio *100} %', style: TextStyle(fontSize: textSize*0.8)),
                          value: controller.nbtChecked.value,
                          onChanged: (value) {
                            controller.updateNbtChecked(value!);
                          },
                        ),
                      )),
                  Obx(() => Container(
                        width: screenWidth * 0.7, // Set a relative width for the CheckboxListTile
                        child: CheckboxListTile(
                          title: Text('Stamp', style: TextStyle(fontSize: textSize*0.8)),
                          value: controller.stampChecked.value,
                          onChanged: (value) {
                            controller.updateStampChecked(value!);
                          },
                        ),
                      )),
                ],
              ),
          Obx(() => controller.stampChecked.value
              ? Padding(
                  padding: EdgeInsets.only(left: screenWidth / 3),
                  child: Container(
                    width: screenWidth * 0.3,
                    child: TextField(
                      onChanged: (value) {
                        controller.updateStamp(value);
                      },
                      decoration: InputDecoration(labelText: 'Stamp'),
                    ),
                  ),
                )
              : Container()),

          // Display results
          Obx(() => ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: blurRadius, sigmaY: blurRadius),
                  child: Container(
                    width: screenWidth*0.8,
                    padding: EdgeInsets.all(resultPadding),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.green.withOpacity(0.1),
                          Colors.greenAccent.withOpacity(0.1),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.15),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(borderRadius),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          offset: Offset(boxShadowOffset, boxShadowOffset),
                          blurRadius: 7,
                        ),
                        BoxShadow(
                          color: Colors.white.withOpacity(0.1),
                          offset: Offset(-boxShadowOffset, -boxShadowOffset),
                          blurRadius: 7,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Amount: ${controller.amount.value}",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: textSize * 0.8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "VAT Value: ${controller.vatValue.value.toStringAsFixed(2)}",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: textSize * 0.8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "NBT Value: ${controller.nbtValue.value.toStringAsFixed(2)}",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: textSize * 0.8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Stamp Value: ${controller.stamp.value}",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: textSize * 0.8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(color: Colors.green, thickness: 0.5, height: 10),
                        Text(
                          "Sum Total: ${controller.sumTotal.value.toStringAsFixed(2)}",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: textSize * 0.9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
