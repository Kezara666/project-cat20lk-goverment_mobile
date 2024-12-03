import 'package:cat20mixing/enviroment/api.dart';
import 'package:cat20mixing/services/mixing_order_controller/add_cutomer_controller.dart';
import 'package:cat20mixing/services/mixing_order_controller/mixing_order_controller.dart';
import 'package:cat20mixing/services/user_managmenet_controller/user_controller.dart';
import 'package:cat20mixing/utils/functions/docx_print.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class OrderListPage extends StatelessWidget {
  final MixingOrderController orderController =
      Get.put(MixingOrderController());
  UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFFEBEBEB),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blueAccent,
                Color.fromARGB(255, 43, 167, 224),
                Color.fromARGB(255, 201, 132, 239)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent, // Make AppBar transparent
            elevation: 0, // Remove shadow
            title: const Text(
              'Mix Income List',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      body: Obx(() {
        // Show loading spinner
        if (orderController.isLoading.value) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.blue,
          ));
        }

        // Show error message if any
        if (orderController.errorMessage.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, color: Colors.red, size: 50),
                const SizedBox(height: 10),
                Text(
                  orderController.errorMessage.value,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                ),
                ElevatedButton(
                  onPressed: orderController.refreshList,
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }
        return Column(
          children: [
            // Toolbar
            Padding(
              padding: EdgeInsets.all(screenWidth / 20),
              child: Row(
                children: [
                  SizedBox(width: screenWidth / 40),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.amber),
                      child: IconButton(
                        //backgroundColor: const Color.fromRGBO(247, 239, 2, 0.7),
                        onPressed: orderController.refreshList,
                        icon: const Icon(
                          Icons.refresh,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(screenWidth / 80),
                      height: screenHeight / 20,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26, // Shadow color
                            blurRadius: 8, // Adjust for shadow softness
                            offset:
                                Offset(0, 4), // Horizontal & vertical offset
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                            style: TextStyle(color: Colors.white),
                            'Current Session: ${orderController.currentSession['name']}'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth / 40,
                  ),
                ],
              ),
            ),
            // Filter and Status Dropdown
            Padding(
              padding: EdgeInsets.all(screenHeight * screenWidth * 0.000004),
              child: Container(
                decoration: BoxDecoration(
                  //color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26, // Shadow color
                      blurRadius: 20, // Adjust for shadow softness
                      offset: Offset(0, 2), // Horizontal & vertical offset
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: TextField(
                      onChanged: (value) => orderController.applyFilter(value),
                      decoration: InputDecoration(
                        labelText: 'Filter by Customer Name',
                        prefixIcon: Icon(
                          Icons.filter_list,
                          color: Color.fromRGBO(246, 245, 245, 1),
                        ),
                        labelStyle: TextStyle(
                            color: Color.fromRGBO(
                                251, 250, 250, 1)), // White label text
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white), // White underline
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 245, 245,
                                  246)), // Blue underline when focused
                        ),
                      ),
                      style: TextStyle(
                        color: Color.fromARGB(255, 243, 244,
                            245), // Set the text color for the selected item to red
                      ),
                      cursorColor: const Color.fromARGB(
                          255, 246, 247, 247), // Blue cursor color
                    )),
                    SizedBox(width: screenWidth / 40),
                    DropdownButton<int>(
                      dropdownColor: Color.fromRGBO(201, 201, 199, 0.5),
                      value: orderController.selectedOrderStatus.value,
                      onChanged: (status) {
                        orderController.changeStatus(status!);
                      },
                      items: const [
                        DropdownMenuItem(value: 1, child: Text('Draft')),
                        DropdownMenuItem(value: 2, child: Text('Paid')),
                        DropdownMenuItem(value: 3, child: Text('Posted')),
                        DropdownMenuItem(
                            value: 4, child: Text('Cancel Pending')),
                        DropdownMenuItem(
                            value: 5, child: Text('Cancel Approved')),
                        DropdownMenuItem(
                            value: 6, child: Text('Cancel Disapproved')),
                      ],
                      focusColor: Color.fromRGBO(118, 118, 118, 1),
                      iconEnabledColor: const Color.fromARGB(
                          255, 245, 243, 243), // Color of the icon (down arrow)
                      iconDisabledColor:
                          const Color.fromARGB(255, 247, 246, 246),
                      style: TextStyle(
                        color: Color.fromARGB(255, 247, 247,
                            247), // Set the text color for the selected item to red
                      ),
                    ),
                  ],
                ),
              ),
            ),
            orderController.mixingOrderList.isNotEmpty
                ?
                // Table
                Expanded(
                    child: ListView.builder(
                      itemCount: orderController.mixingOrderList.length,
                      itemBuilder: (context, index) {
                        var order = orderController.mixingOrderList[index];
                        return Padding(
                          padding: const EdgeInsets.all(20),
                          child: Card(
                            elevation: 50,
                            color: Color.fromRGBO(250, 250, 250, 1),
                            shadowColor: Color.fromRGBO(0, 0, 0, 1),
                            child: ListTile(
                              title: Text(
                                'Receipt No: ${order.id}',
                                style: TextStyle(
                                  color: Color.fromRGBO(118, 118, 118, 1),
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Customer: ${order.customerName}',
                                    style: TextStyle(
                                        color: const Color.fromRGBO(
                                            118, 118, 118, 1),
                                        fontSize: screenWidth / 30),
                                  ),
                                  Text(
                                    'Account Number: ${order.accountDetail!.accountNo}',
                                  ),
                                ],
                              ),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Total Amount: ${order.totalAmount}',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: screenWidth / 30),
                                  ),
                                  Text(
                                    'Payment Method: ${getPaymentMethodName(order.paymentMethodId)}',
                                  ),
                                ],
                              ),
                              onTap: () async {
                                // Handle order view
                                // await generateDocument(order);
                                try {
                                  // Call API
                                  callPaidMixinOrder(
                                       userController.currentToken.value,
                                      order,
                                      order.id ?? 0,
                                      int.parse(
                                          userController.currentUserId.value));
                                  final fileName =
                                      'downloaded_file.docx'; // Desired file name

                                  Get.snackbar('File Saved', 'File saved');
                                } catch (e) {
                                  Get.snackbar('File Saved', '$e');
                                }
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Expanded(
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'No Orders Found',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 10, 10, 10),
                              fontSize: screenWidth / 20),
                        ),
                        SizedBox(
                          width: screenWidth / 20,
                        ),
                        Icon(
                          Icons.remove_shopping_cart,
                          color: const Color.fromARGB(255, 4, 4, 4),
                        )
                      ],
                    )),
                  ),

            SizedBox(
              height: screenHeight / 30,
            )
          ],
        );
      }),
    );
  }

  String getPaymentMethodName(int? paymentMethodId) {
    const paymentMethods = {
      1: 'Cash',
      2: 'Cheque',
      3: 'Cross',
      4: 'Direct',
    };

    return paymentMethods[paymentMethodId] ?? 'Unknown';
  }
}
