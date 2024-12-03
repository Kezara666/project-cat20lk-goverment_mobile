import 'package:flutter/material.dart';

//const backendAPI = 'https://test.cat2020.lk';

const backendAPI = 'https://7q90hg3q-5000.asse.devtunnels.ms';
const getPlacedOrdersByUserByCategoryByStateAPI =
    '$backendAPI/api/mixin/mixinOrder/getPlacedOrdersByUserByCategoryByState';
const getPartnerByPhoneNumberAPI =
    '$backendAPI/api/mixin/partners/getByPhoneNo';
const getGNDivitionsBySabhaId = '$backendAPI/api/GnDivisions/getAllForSabha';
const getAllAcountDetailsForSabha =
    '$backendAPI/api/vote/AccountDetails/getAllAccountDetailsForOfficeId';
const getAllVoteAssignmentForSabhaAndAccountDetailId =
    '$backendAPI/api/mixin/voteAssignments/GetAllForOfficeIdAndAccountDetailId';
const savePartnersAPI = '$backendAPI/api/mixin/partners/save';
const saveOnlineMixinOrder = '$backendAPI/api/mixin/mixinOrder/save';
const getAllBalancesheetTitlesForAccountDetailId =
    '$backendAPI/api/vote/balancesheettitles/getAllBalancesheetTitlesForAccountDetailId';
const getAllBalancesheetSubtitlesForTitleIDAndAccountDetailID =
    '$backendAPI/api/vote/balancesheetSubtitles/getAllBalancesheetSubtitlesForTitleIDAndAccountDetailID';
const getVatRatioAPI = '$backendAPI/api/PaymentVats/getById/1';
const getPaymentNbtsByIdAPI = '$backendAPI/api/PaymentNbts/getById/1';
const mixinReciptAPI =
    '$backendAPI/birt/output?__report=mixinorderreceipt_small_57mm_eng.rptdesign&__format=docx&__svg=true&__locale=en_US&__timezone=IST&__masterpage=true&__rtl=false&__cubememsize=10&&__pageoverflow=0&__overwrite=false&printedBy=1&orderid=76958';
