import 'dart:async';
import 'dart:ui';
import 'package:cat20mixing/models/mixin_order_resource.dart';
import 'package:cat20mixing/widgets/paymentmetho_dialogbox.dart';
import 'package:cat20mixing/widgets/add_customer_container.dart';
import 'package:cat20mixing/widgets/calculation.dart';
import 'package:cat20mixing/services/mixing_order_controller/bank_details_controller.dart';
import 'package:cat20mixing/services/mixing_order_controller/calculation_controller.dart';
import 'package:cat20mixing/services/mixing_order_controller/gn_divitions_controller.dart';
import 'package:cat20mixing/services/mixing_order_controller/add_cutomer_controller.dart';
import 'package:cat20mixing/services/mixing_order_controller/mixing_order_controller.dart';
import 'package:cat20mixing/services/user_managmenet_controller/user_controller.dart';
import 'package:cat20mixing/widgets/glass_container.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateMixIncomeOrderPage extends StatefulWidget {
  @override
  _CreateMixIncomeOrderPageState createState() =>
      _CreateMixIncomeOrderPageState();
}

class _CreateMixIncomeOrderPageState extends State<CreateMixIncomeOrderPage> {
  //Dependecy Injection
  MixingOrderAddCustomerController mixingOrderAddCustomerController =
      Get.find();
  CalculationController calculationController =
      Get.find(); // Initialize the controller

  GNDivitionController gNDivitionController = Get.find();
  BankDetailsController bankDetailsController = Get.find();
  MixingOrderController orderController = Get.find();
  UserController userController = Get.find();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var isTemporary = false;
  String description = '';

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  void _initializeData() async {
    //Fetch VAT
    var vatRate = await bankDetailsController.fetchPaymentVatResource();
    // Check if vatRate is not null and cast amountPercentage safely to int
    int vatPercentage = (vatRate?.amountPercentage ?? 15).toInt();
    calculationController.fetchAndSetVatRatio(vatPercentage);
    //Fetch NBT
    var nBTRate = await bankDetailsController.fetchNBTResource();
    int nbtPercentage = (nBTRate?.amountPercentage ?? 15).toInt();
    calculationController.fetchAndSetNBTRatio(nbtPercentage);

    await gNDivitionController
        .getGNDivitions(int.parse(userController.sabhaId.value));
    await bankDetailsController
        .fetchAccountDetails(int.parse(userController.sabhaId.value));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight / 12),
        child: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              "Create Mix Income Order",
              style: TextStyle(color: Colors.white),
            ),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                boxShadow: [],
                //borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
                gradient: LinearGradient(
                  colors: [
                    Colors.blueAccent,
                    Colors.purpleAccent,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            leading: Obx(
                () => mixingOrderAddCustomerController.containValuePartner.value
                    ? Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.account_circle,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              _scaffoldKey.currentState
                                  ?.openDrawer(); // Opens the drawer
                            },
                          ),
                          Text(
                            "1",
                            style: TextStyle(
                                color: const Color.fromARGB(255, 237, 235, 235),
                                fontSize: screenWidth * 0.03),
                          )
                        ],
                      )
                    : Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.account_circle,
                              color: Color.fromARGB(255, 17, 16, 16),
                            ),
                            onPressed: () {
                              _scaffoldKey.currentState
                                  ?.openDrawer(); // Opens the drawer
                            },
                          ),
                        ],
                      )),
            actions: [
              Obx(() => Row(
                    children: [
                      bankDetailsController.mixinOrderLines.value.isEmpty
                          ? Text(
                              "${0}",
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 237, 235, 235),
                                  fontSize: screenWidth * 0.038),
                            )
                          : Text(
                              "${bankDetailsController.mixinOrderLines.value.length ?? 0}",
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 237, 235, 235),
                                  fontSize: screenWidth * 0.038),
                            ),
                      IconButton(
                        icon: Icon(
                          Icons.account_balance,
                          color: bankDetailsController.mixinOrderLines.isEmpty
                              ? Color.fromARGB(255, 16, 16, 16)
                              : Colors.white,
                        ), // Bank Icon
                        onPressed: () {
                          _scaffoldKey.currentState
                              ?.openEndDrawer(); // Opens the endDrawer
                        },
                      ),
                    ],
                  )),
            ]),
      ),
      drawer: Drawer(
        width: screenWidth,
        child: addCustomer(screenWidth, screenHeight, context),
      ),
      endDrawer: Drawer(
        width: screenWidth,
        child: addBankDetails(context, screenWidth),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 142, 141, 141)
                  .withOpacity(0.4), // Black with transparency
              Colors.white.withOpacity(0.1), // White with higher transparency
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 121, 121, 121)
                  .withOpacity(0.2), // Dark shadow for depth
              blurRadius: 10,
              offset: Offset(5, 5),
            ),
            BoxShadow(
              color: Colors.white.withOpacity(0.5), // Light shadow for contrast
              blurRadius: 10,
              offset: Offset(-5, -5),
            ),
          ],
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: Obx(
                    () => bankDetailsController.mixinOrderLines.isEmpty
                        ? Center(
                            child: Text("No Order Lines Available"),
                          )
                        : Padding(
                            padding: EdgeInsets.only(top: screenHeight * 0.05),
                            child: ListView.builder(
                              itemCount:
                                  bankDetailsController.mixinOrderLines.length,
                              itemBuilder: (context, index) {
                                final item = bankDetailsController
                                    .mixinOrderLines[index];
                                // Required for BackdropFilter

                                return Card(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  elevation: 0, // Remove default card shadow
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        15), // Rounded corners
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        15), // Rounded corners
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 10,
                                          sigmaY:
                                              10), // Blur effect for glassmorphism
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              const Color.fromARGB(
                                                      255, 165, 162, 162)
                                                  .withOpacity(
                                                      0.3), // Black with some transparency
                                              Colors.white.withOpacity(
                                                  0.2), // White with low opacity
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color.fromARGB(
                                                      255, 205, 204, 204)
                                                  .withOpacity(0.3),
                                              blurRadius: 15,
                                              offset: Offset(5, 5),
                                            ),
                                            BoxShadow(
                                              color:
                                                  Colors.white.withOpacity(0.4),
                                              blurRadius: 15,
                                              offset: Offset(-5, -5),
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "No: ${index + 1}",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.blueAccent,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      bankDetailsController
                                                          .removeOrderLine(
                                                              index);
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          const Color.fromARGB(
                                                              255, 198, 18, 18),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal:
                                                            screenWidth * 0.001,
                                                        vertical: screenHeight *
                                                            0.001,
                                                      ),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                      ),
                                                    ),
                                                    child: Icon(
                                                      Icons.remove,
                                                      size: screenWidth * 0.05,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 5),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      "Vote: ${item.customVoteName}",
                                                      style: TextStyle(
                                                          fontSize: 14),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      "Description: ${item.description}",
                                                      style: TextStyle(
                                                          fontSize: 14),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 5),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      "VAT: ${item.paymentVatAmount}",
                                                      style: TextStyle(
                                                          fontSize: 14),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      "NBT: ${item.paymentNbtAmount}",
                                                      style: TextStyle(
                                                          fontSize: 14),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 5),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      "Stamp: ${item.stampAmount ?? 0}",
                                                      style: TextStyle(
                                                          fontSize: 14),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      "SubTotal: \$${item.totalAmount}",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color.fromARGB(255, 222, 221, 221)
                            .withOpacity(0.3), // Black with some transparency
                        Colors.white.withOpacity(0.2), // White with low opacity
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 205, 204, 204)
                            .withOpacity(0.3),
                        blurRadius: 15,
                        offset: Offset(5, 5),
                      ),
                      BoxShadow(
                        color: Colors.white.withOpacity(0.4),
                        blurRadius: 15,
                        offset: Offset(-5, -5),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: screenHeight * 0.04, top: screenHeight * 0.02),
                    child: Row(
                      children: [
                        SizedBox(
                          width: screenWidth / 20,
                        ),
                        // -- region Name of Section --
                        ElevatedButton(
                          // -- endregion --
                          onPressed: () async {
                            await showPaymentDialog(context);
                            MixingOrderResource resource = MixingOrderResource(
                              id: 1,
                              code: "ORD123",
                              paymentMethodId:
                                  orderController.selectedPaymentMethod.value,
                              chequeBankName: orderController.bankName.value,
                              chequeDate:
                                  orderController.chequeDate.value.toString(),
                              officeId:
                                  int.parse(userController.sabhaId.value) ?? 0,
                              accountDetailId: bankDetailsController
                                  .selectedBankAccount.value?.id,
                              customerName: mixingOrderAddCustomerController
                                  .partner?.name,
                              customerNicNumber: mixingOrderAddCustomerController
                                  .partner
                                  ?.nicNumber, // Assuming you want to assign this
                              customerMobileNumber: mixingOrderAddCustomerController
                                  .partner
                                  ?.mobileNumber, // Assuming you want to assign this

                              chequeNumber: null,
                              // Assuming you want to assign this from some controller
                              // paymentMethodId: mixingOrderAddCustomerController
                              //     .paymentMethodId, // Assuming you want to assign this from some controller
                              gnDivisions: mixingOrderAddCustomerController
                                  .partner
                                  .gnDivision, // Assuming this is assigned through the controller
                              gnDivisionId: mixingOrderAddCustomerController
                                  .partner
                                  .gnDivisionId, // Assuming this is assigned through the controller
                              // cashier: mixingOrderAddCustomerController
                              //     .cashier, // Assuming this is assigned through the controller
                              // cashierId: mixingOrderAddCustomerController
                              //     .cashierId, // Assuming this is assigned through the controller
                              partner: mixingOrderAddCustomerController
                                  .partner, // Assuming this is assigned through the controller
                              partnerId: mixingOrderAddCustomerController
                                  .partner
                                  .id, // Assuming this is assigned through the controller
                              // officeId: mixingOrderAddCustomerController.partner
                              //     .sabhaId, // Assuming this is assigned through the controller

                              mixinOrderLine: bankDetailsController
                                  .mixinOrderLines.value, // Pass RxList
                              // Assuming this is assigned through the controller
                            );

                            // Handle submission logic

                            if (mixingOrderAddCustomerController.partner.name !=
                                    '' ||
                                mixingOrderAddCustomerController.partner.name !=
                                        null &&
                                    bankDetailsController
                                            .mixinOrderLines.value.length !=
                                        0) {
                              //////////////////////////////Submit the Order //////////////////////////////
                              orderController.saveMixinOrder(
                                  true, 2, resource, context);
                            } else if (mixingOrderAddCustomerController
                                        .partner.name ==
                                    '' ||
                                mixingOrderAddCustomerController.partner.name ==
                                    null) {
                              Get.snackbar(
                                'Mixing Order Customer Not Valid', // Title
                                'Mixing Order Customer Not Valid', // Message
                                snackPosition:
                                    SnackPosition.TOP, // Snackbar position
                                backgroundColor: const Color.fromARGB(255, 209,
                                    25, 25), // Snackbar background color
                                colorText: Colors.white, // Text color
                                duration: Duration(seconds: 5), // Duration
                              );
                            } else {
                              Get.snackbar(
                                'Mixing Order line Not Valid', // Title
                                'Mixing Order line Not Valid', // Message
                                snackPosition:
                                    SnackPosition.TOP, // Snackbar position
                                backgroundColor: const Color.fromARGB(255, 209,
                                    25, 25), // Snackbar background color
                                colorText: Colors.white, // Text color
                                duration: Duration(seconds: 5), // Duration
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                bankDetailsController.mixinOrderLines.length >
                                            0 &&
                                        mixingOrderAddCustomerController
                                                .partner.name !=
                                            null
                                    ? Colors.blueAccent
                                    : Colors.transparent,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              fontSize: screenWidth * 0.028,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth / 2.5,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Handle submission logic
                            bankDetailsController.mixinOrderLines.clear();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 198, 18, 18),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 6,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          child: Icon(
                            Icons.delete,
                            size: screenWidth * 0.08,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Add Bank Details
  GestureDetector addBankDetails(BuildContext context, double screenWidth) {
    return GestureDetector(
      onTap: () => {FocusScope.of(context).unfocus()},
      child: Container(
        child: Stack(
          children: [
            // Background Gradient
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blueAccent,
                    Color.fromARGB(255, 43, 167, 224),
                    Color.fromARGB(255, 201, 132, 239),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            // Glassmorphic Card
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.03),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(4, 4),
                            blurRadius: 15,
                          ),
                          BoxShadow(
                            color: Colors.white.withOpacity(0.6),
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(screenWidth * 0.03),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            glassmorphismContainer('ADD ORDER ITEM', context, [
                              // Base color - light blue
                              Color(0xFFBDD6F5),

                              // Add some purples and darker shades for the gradient effect
                              Color.fromARGB(
                                  255, 160, 58, 170), // Medium Purple
                              Color.fromARGB(255, 94, 6, 149), // Dark Purple
                              Color.fromARGB(
                                  255, 210, 7, 183), // Bright Pinkish Purple
                              Color.fromARGB(255, 26, 79, 153),
                              // Light Pink
                            ]),

                            const SizedBox(height: 16),
                            // Bank Account Dropdown
                            Obx(() {
                              return IgnorePointer(
                                ignoring: (bankDetailsController
                                            .selectedBankAccount.value?.id ??
                                        0) >
                                    0,
                                child: DropdownButtonFormField<AccountDetail>(
                                  decoration: InputDecoration(
                                    labelText: 'Select Bank Account',
                                    labelStyle:
                                        const TextStyle(color: Colors.white),
                                    filled: true,
                                    fillColor:
                                        const Color.fromARGB(255, 29, 29, 29)
                                            .withOpacity(0.2),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  dropdownColor:
                                      const Color.fromARGB(255, 29, 29, 29)
                                          .withOpacity(0.9),
                                  value: bankDetailsController
                                      .selectedBankAccount.value,
                                  onChanged: (AccountDetail? newValue) {
                                    // Assuming this is part of your logic where you want to check and update
                                    if (bankDetailsController
                                            .selectedBankAccount.value ==
                                        null) {
                                      bankDetailsController
                                          .selectedBankAccount.value = newValue;
                                      /////////////////////////////////////////////// VOTE deails getting pass bank account
                                      bankDetailsController
                                          .getVoteForBankAccount(
                                              int.parse(userController
                                                      .currentOfficeId.value) ??
                                                  0,
                                              newValue?.id ?? 0);
                                      /////////////////////////////////////////////// BalanceSheet list
                                      bankDetailsController
                                          .getBalancesheetTitleForSelectedAccountId(
                                              bankDetailsController
                                                      .selectedBankAccount
                                                      .value
                                                      ?.id ??
                                                  0);
                                    } else {}
                                  },
                                  items: bankDetailsController.accountDetails
                                      .map((AccountDetail account) {
                                    return DropdownMenuItem<AccountDetail>(
                                      value: account,
                                      child: SizedBox(
                                        height: 30,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            account.nameSinhala ??
                                                'No Name', // Adjust based on available data
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              );
                            }),
                            const SizedBox(height: 16),

                            // Vote Dropdown
                            Obx(() {
                              return bankDetailsController
                                              .selectedBankAccount.value ==
                                          null ||
                                      (bankDetailsController
                                                  .selectedBankAccount.value !=
                                              null &&
                                          bankDetailsController
                                                  .VotesList.value.length >
                                              0)
                                  ? DropdownButtonFormField<Vote>(
                                      decoration: InputDecoration(
                                        labelText: 'Select Vote',
                                        labelStyle: const TextStyle(
                                            color: Colors.white),
                                        filled: true,
                                        fillColor: const Color.fromARGB(
                                                255, 29, 29, 29)
                                            .withOpacity(0.2),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                      dropdownColor:
                                          const Color.fromARGB(255, 29, 29, 29)
                                              .withOpacity(0.9),
                                      value: bankDetailsController
                                          .selectedVote.value,
                                      onChanged: (Vote? newValue) {
                                        bankDetailsController
                                            .selectedVote.value = newValue;
                                        // Balance sheat values clean
                                        bankDetailsController
                                            .cleanBalancesheats();
                                        //bankDetailsController.getVoteForBankAccount(118,21);
                                      },
                                      items:
                                          bankDetailsController.VotesList.map(
                                              (Vote vote) {
                                        return DropdownMenuItem<Vote>(
                                          value: vote,
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              //vote.voteCode.toString()+
                                              vote!.voteDetail!
                                                      .incomeSubtitleNameSinhala
                                                      .toString() ??
                                                  'No Name', // Adjust based on available data
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: screenWidth * 0.025,
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    )
                                  : Row(
                                      children: [
                                        CircularProgressIndicator(
                                          color: Colors.green,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                              style: TextStyle(
                                                  color: Colors.green),
                                              "Vote list loading for : ${bankDetailsController.selectedBankAccount.value!.bankDetail!.description}"),
                                        )
                                      ],
                                    );
                            }),
                            const SizedBox(height: 16),
                            // Balance Sheet Title Dropdown
                            Obx(() {
                              return DropdownButtonFormField<
                                  BalancesheetTitleResource>(
                                decoration: InputDecoration(
                                  labelText: 'Select Balancesheet Title',
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(255, 29, 29, 29)
                                          .withOpacity(0.2),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                dropdownColor:
                                    const Color.fromARGB(255, 29, 29, 29)
                                        .withOpacity(0.9),
                                value: bankDetailsController
                                    .selectedBalancesheetTitle.value,
                                onChanged:
                                    (BalancesheetTitleResource? newValue) {
                                  // Update selected balance sheet title
                                  bankDetailsController
                                      .selectedBalancesheetSubtitle
                                      .value = null;
                                  bankDetailsController
                                      .selectedBalancesheetTitle
                                      .value = newValue;
                                  bankDetailsController
                                      .getBalancesheetSubtitlesForTitleAndAccount(
                                          newValue?.id ?? 0,
                                          bankDetailsController
                                                  .selectedBankAccount
                                                  .value
                                                  ?.id ??
                                              0);

                                  // Perform any additional logic here if needed
                                },
                                items: bankDetailsController
                                    .balancesheetTitleList
                                    .map((BalancesheetTitleResource title) {
                                  return DropdownMenuItem<
                                      BalancesheetTitleResource>(
                                    value: title,
                                    child: SizedBox(
                                      height: 30,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          title.nameSinhala ??
                                              'No Title', // Adjust to match your model's field
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              );
                            }),
                            const SizedBox(height: 16),
                            Obx(() {
                              var subtitleList = bankDetailsController
                                      .balancesheetSubtitleList ??
                                  <BalancesheetSubtitle>[];

                              // Ensure the value is valid or null
                              return bankDetailsController
                                      .balancesheetSubtitleListIsLoading.value
                                  ? Container(
                                      child: Center(
                                        child: LinearProgressIndicator(),
                                      ),
                                    )
                                  : DropdownButtonFormField<
                                      BalancesheetSubtitle>(
                                      decoration: InputDecoration(
                                        labelText: 'Select Subtitle',
                                        labelStyle: const TextStyle(
                                            color: Colors.white),
                                        filled: true,
                                        fillColor: const Color.fromARGB(
                                                255, 29, 29, 29)
                                            .withOpacity(0.2),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                      dropdownColor:
                                          const Color.fromARGB(255, 29, 29, 29)
                                              .withOpacity(0.9),
                                      value: bankDetailsController
                                          .selectedBalancesheetSubtitle.value,
                                      onChanged:
                                          (BalancesheetSubtitle? newValue) {
                                        bankDetailsController
                                            .selectedBalancesheetSubtitle
                                            .value = newValue;
                                        //clean vote
                                        bankDetailsController.cleanVote();
                                      },
                                      items: subtitleList
                                          .map((BalancesheetSubtitle subtitle) {
                                        return DropdownMenuItem<
                                            BalancesheetSubtitle>(
                                          value: subtitle,
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              subtitle.nameSinhala ??
                                                  'No Name', // Adjust as necessary
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: screenWidth * 0.025,
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    );
                            }),

                            const SizedBox(height: 16),
                            // Balance Sheet Subtitle Dropdown
                            // buildDropdownField(
                            //   'Balancesheet Subtitle',
                            //   selectedBalanceSheetSubtitle,
                            //   balanceSheetSubtitles,
                            //   (value) {
                            //     setState(() {
                            //       selectedBalanceSheetSubtitle = value;
                            //     });
                            //   },
                            // ),
                            const SizedBox(height: 16),
                            // Description TextField
                            buildTextFieldBanking(
                              'Description',
                              maxLines: 3,
                              onChanged: (value) {
                                setState(() {
                                  description = value;
                                });
                              },
                            ),
                            SizedBox(height: 10),

                            // Submit Button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    // Handle submission logic
                                    if (bankDetailsController.selectedVote.value ==
                                            null &&
                                        bankDetailsController
                                                .selectedBalancesheetTitle.value ==
                                            null) {
                                              Get.snackbar(
                                        'Add any Vote Or BalanceSheet', // Title
                                        'Amount Value Not Valid', // Message
                                        snackPosition: SnackPosition
                                            .TOP, // Snackbar position
                                        backgroundColor: const Color.fromARGB(
                                            255,
                                            209,
                                            25,
                                            25), // Background color
                                        colorText: Colors.white, // Text color
                                        duration:
                                            Duration(seconds: 2), // Duration
                                      );
                                      return;
                                    }

                                    if (kDebugMode) {}
                                    if (double.parse(calculationController
                                            .amount.value) >
                                        0) {
                                      try {
                                        var mixingOrderLine =
                                            new MixinOrderLine();

                                        //if bank account section selected vote
                                        if (bankDetailsController
                                                    .selectedVote.value?.id !=
                                                null &&
                                            bankDetailsController
                                                    .selectedVote.value!.id! >
                                                0) {
                                          mixingOrderLine.voteOrBal = 1;
                                        }
                                        // if balance sheat set mixing order line is bal
                                        else {
                                          mixingOrderLine.voteOrBal = 2;
                                        }
                                        mixingOrderLine.customVoteName =
                                            bankDetailsController.selectedVote
                                                    .value?.voteNameSinahala ??
                                                bankDetailsController
                                                    .selectedBalancesheetSubtitle
                                                    .value
                                                    ?.nameSinhala;
                                        mixingOrderLine.voteDetailId =
                                            bankDetailsController.selectedVote
                                                    .value?.voteDetail?.id ??
                                                0;
                                        /////////////////////////////
                                        ///Mixin Order Assignment details Id
                                        ///
                                        mixingOrderLine
                                                .mixinVoteAssignmentDetailId =
                                            bankDetailsController
                                                    .selectedVote
                                                    ?.value
                                                    ?.voteAssignmentDetails
                                                    ?.first
                                                    .id ??
                                                bankDetailsController
                                                    .selectedBalancesheetSubtitle
                                                    .value
                                                    ?.id;

                                        mixingOrderLine.amount =
                                            double.tryParse(
                                                    calculationController
                                                        .amount.value) ??
                                                0.0;
                                        mixingOrderLine.totalAmount =
                                            calculationController.sumTotal.value
                                                .toInt();
                                        mixingOrderLine.paymentNbtAmount =
                                            calculationController
                                                .nbtValue.value;
                                        mixingOrderLine.stampAmount =
                                            calculationController.stamp.value;
                                        mixingOrderLine.paymentVatAmount =
                                            calculationController
                                                .vatValue.value;
                                        mixingOrderLine.voteDetail =
                                            bankDetailsController
                                                .selectedVote.value?.voteDetail;

                                        mixingOrderLine.description =
                                            description;

                                        bankDetailsController
                                            .addOrderLine(mixingOrderLine);
                                        calculationController.clearAll();
                                        _scaffoldKey.currentState
                                            ?.closeEndDrawer();
                                      } catch (e) {
                                        Get.snackbar(
                                          'Mixing Order line Not Valid', // Title
                                          'Mixing Order line Not Valid:', // Message
                                          snackPosition: SnackPosition
                                              .TOP, // Snackbar position
                                          backgroundColor: const Color.fromARGB(
                                              255,
                                              209,
                                              25,
                                              25), // Snackbar background color
                                          colorText: Colors.white, // Text color
                                          duration:
                                              Duration(seconds: 5), // Duration
                                        );
                                      }
                                    } else {
                                      Get.snackbar(
                                        'Amount Not Valid', // Title
                                        'Amount Value Not Valid', // Message
                                        snackPosition: SnackPosition
                                            .TOP, // Snackbar position
                                        backgroundColor: const Color.fromARGB(
                                            255,
                                            209,
                                            25,
                                            25), // Background color
                                        colorText: Colors.white, // Text color
                                        duration:
                                            Duration(seconds: 2), // Duration
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueAccent,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 40,
                                      vertical: 15,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.028,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: screenWidth * 0.05),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 255, 68, 134),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 40,
                                        vertical: 15,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: Text(
                                      'Clear',
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.028,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    onPressed: () {
                                      calculationController.clearAll();
                                      bankDetailsController.clearAll();
                                    },
                                  ),
                                )
                              ],
                            ),
                            CalculationPage()
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Obx addCustomer(
      double screenWidth, double screenHeight, BuildContext context) {
    return Obx(() => Container(
          padding: EdgeInsets.all(screenWidth * 0.01),
          decoration: BoxDecoration(
              gradient:
                  mixingOrderAddCustomerController.containValuePartner.value
                      ? LinearGradient(
                          colors: [
                            const Color.fromARGB(255, 33, 107, 203),
                            Color.fromARGB(255, 43, 224, 212),
                            Color.fromARGB(255, 9, 192, 134),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : LinearGradient(
                          colors: [
                            Colors.blueAccent,
                            Color.fromARGB(255, 43, 167, 224),
                            Color.fromARGB(255, 201, 132, 239),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )),
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              //padding: EdgeInsets.all(screenWidth * 0.005),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: screenHeight / 50, bottom: screenHeight / 100),
                    child: glassmorphismContainer(
                        'ADD CUSTOMER DETAILS', context, [
                      Color(0xFF418DFB),
                      Color.fromARGB(255, 59, 129, 227),
                      Color.fromARGB(255, 7, 83, 235),
                      Color.fromARGB(255, 165, 17, 160), // Blue Accent
                      Color(0xFF2BA7E0), // Light Blue
                      // Light Lavender
                    ]),
                  ),
                  //SizedBox(height: screenHeight * 0.02),
                  // Radio Buttons with Glassmorphism
                  glassmorphicContainer(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: ListTile(
                              title: Text(
                                'New',
                                style: TextStyle(
                                    fontSize: screenWidth * 0.04,
                                    color: Colors.white),
                              ),
                              leading: Radio<bool>(
                                fillColor: MaterialStateProperty.all(Colors
                                    .white), // Corrected the color assignment
                                value: false, // The value for this radio button
                                groupValue:
                                    isTemporary, // The group value that will hold the selected value
                                onChanged: (bool? value) {
                                  // Added type for value
                                  setState(() {
                                    isTemporary = value ??
                                        false; // Ensure that the value is properly assigned
                                  });
                                },
                              )),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text('Temp',
                                style: TextStyle(
                                    fontSize: screenWidth * 0.04,
                                    color: Colors.white)),
                            leading: Radio<bool>(
                              fillColor:
                                  MaterialStateProperty.all(Colors.white),
                              value: true,
                              groupValue: isTemporary,
                              onChanged: (value) {
                                setState(() {
                                  isTemporary = true;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Form Fields with Glassmorphism
                  Padding(
                    padding: EdgeInsets.all(screenWidth * 0.03),
                    child: glassmorphicContainer(
                      child: Padding(
                        padding: EdgeInsets.all(screenWidth * 0.03),
                        child: Column(
                          children: [
                            buildTextField(
                              mixingOrderAddCustomerController.nameController,
                              'Name',
                            ),
                            if (!isTemporary)
                              buildTextField(
                                mixingOrderAddCustomerController
                                    .mobileController,
                                'Mobile',
                                keyboardType: TextInputType.phone,
                                onChanged: (value) {
                                  mixingOrderAddCustomerController
                                      .getPartnerByPhoneNumber(value);
                                },
                              ),
                            if (!isTemporary)
                              buildTextField(
                                  mixingOrderAddCustomerController
                                      .nicController,
                                  'NIC'),
                            buildTextField(
                                mixingOrderAddCustomerController
                                    .street1Controller,
                                'Street 1'),
                            buildTextField(
                                mixingOrderAddCustomerController
                                    .street2Controller,
                                'Street 2'),
                            buildTextField(
                                mixingOrderAddCustomerController.cityController,
                                'City'),
                            buildTextField(
                                mixingOrderAddCustomerController.zipController,
                                'ZIP Code'),
                            buildTextField(
                              mixingOrderAddCustomerController.emailController,
                              'Email',
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (value) {
                                // Your onChanged logic here
                              },
                            ),
                            buildTextField(
                                mixingOrderAddCustomerController
                                    .passportController,
                                'Passport'),
                            const SizedBox(height: 10),
                            Obx(
                              () => DropdownButtonFormField<GnDivisions>(
                                focusColor: Colors.white,
                                value: gNDivitionController
                                    .selectedGNDivision.value,
                                items: gNDivitionController.gnDivisions
                                    .map((division) {
                                  return DropdownMenuItem(
                                    value: division,
                                    child: Text(
                                      division.description ?? 'Test',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  gNDivitionController
                                      .selectedGNDivision.value = value!;
                                },
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                decoration: InputDecoration(
                                  labelText: "Select GN Division",
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(255, 29, 29, 29)
                                          .withOpacity(0.2),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                dropdownColor:
                                    const Color.fromARGB(255, 29, 29, 29)
                                        .withOpacity(0.9),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  //Submit Button with Glassmorphism
                  Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.05),
                    child: GestureDetector(
                      onTap: () {
                        Get.snackbar(
                          'Form Submitted',
                          'Details have been saved successfully!',
                          backgroundColor: Colors.green,
                          colorText: Colors.white,
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      },
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // Center buttons horizontally
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                // Handle submission logic
                                await mixingOrderAddCustomerController
                                    .savePartners(12);
                                _scaffoldKey.currentState?.closeDrawer();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 40,
                                  vertical: 15,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.03,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                                width: 20), // Add spacing between buttons
                            ElevatedButton(
                              onPressed: () {
                                mixingOrderAddCustomerController.clearPartner();
                                // Handle clear logic
                                Get.snackbar(
                                  'Form Cleared',
                                  'All fields have been reset!',
                                  backgroundColor: Colors.redAccent,
                                  colorText: Colors.white,
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 40,
                                  vertical: 15,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                'Clear',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.03,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Future<Map<String, dynamic>?> showPaymentDialog(BuildContext context) {
    return showDialog<Map<String, dynamic>>(
      context: context,
      builder: (BuildContext context) => PaymentDialog(),
    );
  }

  Widget buildDropdownField(
    String label,
    String? value,
    List<Map<String, String>> items,
    ValueChanged<String?> onChanged,
  ) {
    return DropdownButtonFormField<String>(
      alignment: Alignment.center,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: const Color.fromARGB(255, 29, 29, 29).withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      dropdownColor: const Color.fromARGB(255, 29, 29, 29)
          .withOpacity(0.9), // Dropdown list background color
      value: value,
      onChanged: onChanged,
      items: items.map(
        (item) {
          return DropdownMenuItem<String>(
            value: item['id'],
            child: SizedBox(
              height: 30, // Reduced height
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  item['label']!,
                  style: const TextStyle(
                      color: Colors.white, fontSize: 14), // Adjust font size
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }

  Widget buildCheckbox(
      String title, bool value, ValueChanged<bool?> onChanged) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: const Color.fromARGB(232, 2, 131, 186),
          checkColor: Colors.white,
          side: const BorderSide(color: Colors.white),
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget buildTextFieldBanking(
    String label, {
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    required ValueChanged<String> onChanged,
  }) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Color.fromARGB(234, 247, 248, 249)),
        filled: true,
        fillColor: const Color.fromARGB(255, 29, 29, 29).withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      keyboardType: keyboardType,
      maxLines: maxLines,
      onChanged: onChanged,
    );
  }

  // // TextField Builder
  Widget buildTextField(
    TextEditingController controller,
    String label, {
    TextInputType keyboardType = TextInputType.text,
    void Function(String)?
        onChanged, // Accept onChanged as an optional parameter
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white54),
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
