import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

class BarcodeDialog extends StatelessWidget {
  final String barcodeValue;
  final double width;
  final double height;
  final String format;

  BarcodeDialog({
    required this.barcodeValue,
    this.width = 2,
    this.height = 80,
    this.format = 'CODE128',
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text('Barcode for Last Receipt')),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BarcodeWidget(
            data: barcodeValue,
            barcode: Barcode.code128(), // Use other Barcode types as needed
            width: width * 100, // Adjust width scaling
            height: height,
            drawText: true, // Display barcode text
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
      actions: [
        Center(
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ),
      ],
    );
  }
}
