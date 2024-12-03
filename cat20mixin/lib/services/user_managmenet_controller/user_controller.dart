import 'dart:convert';
import 'package:get/get.dart';
import 'package:jwt_decode/jwt_decode.dart';

class UserController extends GetxController {
  var user = {}.obs;
  var currentUserId = ''.obs;
  var currentUserName = ''.obs;
  var isAdmin = ''.obs;
  var currentToken = ''.obs;
  var currentSessionExp = ''.obs;
  var currentUserNameWithInitials = ''.obs;
  var sabhaId = ''.obs;
  var sabhaCode = ''.obs;
  var currentLogoPath = ''.obs;
  var currentOfficeId = ''.obs;
  var currentSabhaName = ''.obs;
  var currentOfficeName = ''.obs;
  var currentSabhaNameEnglish = ''.obs;
  var currentDistrictName = ''.obs;
  var currentProvinceName = ''.obs;
  var currentSabhaLangId = ''.obs;
  var currentSabhaLang = ''.obs;
  var isFinalAccountsEnabled = ''.obs;
  var chartOfAccountVersionId = ''.obs;
  var accountSystemVersionId = ''.obs;
  var currentSession = dynamic.obs ;
  var assignedRuleList = [].obs;
  var assignedModuleList = [].obs;

  void saveUserData(String token, String expiration) {
    // Decode the token
    Map<String, dynamic> decoded = Jwt.parseJwt(token);
    // Assign values to observable variables
    currentToken.value = token;
    currentSessionExp.value = expiration;
    currentUserId.value = decoded['userid'].toString();
    currentUserName.value = decoded['username'];
    isAdmin.value = decoded['isadmin'];
    currentUserNameWithInitials.value = decoded['namewithinitials'];
    sabhaId.value = decoded['sabhaId'].toString();
    sabhaCode.value = decoded['sabhaCode'];
    currentLogoPath.value = decoded['sabhaLogoPath'];
    currentOfficeId.value = decoded['officeID'].toString();
    currentSabhaName.value = decoded['sabhaName'];
    currentOfficeName.value = decoded['officeName'];
    currentSabhaNameEnglish.value = decoded['sabhaNameEnglish'];
    currentDistrictName.value = decoded['districtName'];
    currentProvinceName.value = decoded['provinceName'];
    currentSabhaLangId.value = decoded['languageid'].toString();
    currentSabhaLang.value = decoded['language'];
    isFinalAccountsEnabled.value = decoded['IsFinalAccountsEnabled'];
    chartOfAccountVersionId.value = decoded['ChartOfAccountVersionId'].toString();
    accountSystemVersionId.value = decoded['AccountSystemVersionId'].toString();
    //currentSession.value = decoded['CurrentSession'] ?? {};
    //assignedRuleList.value = decoded['userAssignedRuleList'];
   // assignedModuleList.value = decoded['userAssignedModuleList'];

    // Store user data
    user.value = decoded;

  }
}
