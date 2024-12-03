class MixingOrderResource {
  int? id;
  String? code;
  String? customerName;
  String? customerNicNumber;
  String? customerMobileNumber;
  double? totalAmount;
  double? discountRate;
  double? discountAmount;
  String? chequeNumber;
  String? chequeDate;
  String? chequeBankName;
  int? state;
  String? createdAt;
  int? createdBy;
  String? updatedAt;
  int? sessionId;
  int? paymentMethodId;
  GnDivisions? gnDivisions;
  int? gnDivisionId;
  Cashier? cashier;
  int? cashierId;
  Partner? partner;
  int? partnerId;
  Office? office;
  int? officeId;
  int? accountDetailId;
  int? businessId;
  int? appCategoryId;
  int? businessTaxId;
  int? tradeLicenseStatus;
  int? taxTypeId;
  MixinCancelOrder? mixinCancelOrder;
  AccountDetail? accountDetail;
  List<MixinOrderLine>? mixinOrderLine;
  dynamic? assmtBalByExcessDeduction;

  MixingOrderResource(
      {this.id,
      this.code,
      this.customerName,
      this.customerNicNumber,
      this.customerMobileNumber,
      this.totalAmount,
      this.discountRate,
      this.discountAmount,
      this.chequeNumber,
      this.chequeDate,
      this.chequeBankName,
      this.state,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.sessionId,
      this.paymentMethodId,
      this.gnDivisions,
      this.gnDivisionId,
      this.cashier,
      this.cashierId,
      this.partner,
      this.partnerId,
      this.office,
      this.officeId,
      this.accountDetailId,
      this.businessId,
      this.appCategoryId,
      this.businessTaxId,
      this.tradeLicenseStatus,
      this.taxTypeId,
      this.mixinCancelOrder,
      this.accountDetail,
      this.mixinOrderLine,
      this.assmtBalByExcessDeduction});

  MixingOrderResource.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    customerName = json['customerName'];
    customerNicNumber = json['customerNicNumber'];
    customerMobileNumber = json['customerMobileNumber'];
    totalAmount = json['totalAmount'];
    discountRate = json['discountRate'];
    discountAmount = json['discountAmount'];
    chequeNumber = json['chequeNumber'];
    chequeDate = json['chequeDate'];
    chequeBankName = json['chequeBankName'];
    state = json['state'];
    createdAt = json['createdAt'];
    createdBy = json['createdBy'];
    updatedAt = json['updatedAt'];
    sessionId = json['sessionId'];
    paymentMethodId = json['paymentMethodId'];
    gnDivisions = json['gnDivisions'] != null
        ? new GnDivisions.fromJson(json['gnDivisions'])
        : null;
    gnDivisionId = json['gnDivisionId'];
    cashier =
        json['cashier'] != null ? new Cashier.fromJson(json['cashier']) : null;
    cashierId = json['cashierId'];
    partner =
        json['partner'] != null ? new Partner.fromJson(json['partner']) : null;
    partnerId = json['partnerId'];
    office =
        json['office'] != null ? new Office.fromJson(json['office']) : null;
    officeId = json['officeId'];
    accountDetailId = json['accountDetailId'];
    businessId = json['businessId'];
    appCategoryId = json['appCategoryId'];
    businessTaxId = json['businessTaxId'];
    tradeLicenseStatus = json['tradeLicenseStatus'];
    taxTypeId = json['taxTypeId'];
    mixinCancelOrder = json['mixinCancelOrder'] != null
        ? new MixinCancelOrder.fromJson(json['mixinCancelOrder'])
        : null;
    accountDetail = json['accountDetail'] != null
        ? new AccountDetail.fromJson(json['accountDetail'])
        : null;
    if (json['mixinOrderLine'] != null) {
      mixinOrderLine = <MixinOrderLine>[];
      json['mixinOrderLine'].forEach((v) {
        mixinOrderLine!.add(new MixinOrderLine.fromJson(v));
      });
    }
    assmtBalByExcessDeduction = json['assmtBalByExcessDeduction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['customerName'] = this.customerName;
    data['customerNicNumber'] = this.customerNicNumber;
    data['customerMobileNumber'] = this.customerMobileNumber;
    data['totalAmount'] = this.totalAmount;
    data['discountRate'] = this.discountRate;
    data['discountAmount'] = this.discountAmount;
    data['chequeNumber'] = this.chequeNumber;
    data['chequeDate'] = this.chequeDate;
    data['chequeBankName'] = this.chequeBankName;
    data['state'] = this.state;
    data['createdAt'] = this.createdAt;
    data['createdBy'] = this.createdBy;
    data['updatedAt'] = this.updatedAt;
    data['sessionId'] = this.sessionId;
    data['paymentMethodId'] = this.paymentMethodId;
    if (this.gnDivisions != null) {
      data['gnDivisions'] = this.gnDivisions!.toJson();
    }
    data['gnDivisionId'] = this.gnDivisionId;
    if (this.cashier != null) {
      data['cashier'] = this.cashier!.toJson();
    }
    data['cashierId'] = this.cashierId;
    if (this.partner != null) {
      data['partner'] = this.partner!.toJson();
    }
    data['partnerId'] = this.partnerId;
    if (this.office != null) {
      data['office'] = this.office!.toJson();
    }
    data['officeId'] = this.officeId;
    data['accountDetailId'] = this.accountDetailId;
    data['businessId'] = this.businessId;
    data['appCategoryId'] = this.appCategoryId;
    data['businessTaxId'] = this.businessTaxId;
    data['tradeLicenseStatus'] = this.tradeLicenseStatus;
    data['taxTypeId'] = this.taxTypeId;
    if (this.mixinCancelOrder != null) {
      data['mixinCancelOrder'] = this.mixinCancelOrder!.toJson();
    }
    if (this.accountDetail != null) {
      data['accountDetail'] = this.accountDetail!.toJson();
    }
    if (this.mixinOrderLine != null) {
      data['mixinOrderLine'] =
          this.mixinOrderLine!.map((v) => v.toJson()).toList();
    }
    data['assmtBalByExcessDeduction'] = this.assmtBalByExcessDeduction;
    return data;
  }
}

class GnDivisions {
  int? id;
  String? description;
  String? code;
  int? officeId;
  String? createdAt;
  String? updatedAt;
  bool? active;

  GnDivisions(
      {this.id,
      this.description,
      this.code,
      this.officeId,
      this.createdAt,
      this.updatedAt,
      this.active});

  GnDivisions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    code = json['code'];
    officeId = json['officeId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['code'] = this.code;
    data['officeId'] = this.officeId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['active'] = this.active;
    return data;
  }
}

class Cashier {
  int? id;
  String? nameInFull;
  String? nameWithInitials;
  String? username;
  String? password;
  String? pin;
  String? nic;
  String? contactNo;
  String? birthday;
  int? sabhaID;
  int? officeID;
  int? activeStatus;
  int? genderID;
  String? profilePicPath;
  String? userSignPath;
  String? profilePic;
  String? userSign;
  int? q1Id;
  String? answer1;
  int? q2Id;
  String? answer2;
  int? isAdmin;

  Cashier(
      {this.id,
      this.nameInFull,
      this.nameWithInitials,
      this.username,
      this.password,
      this.pin,
      this.nic,
      this.contactNo,
      this.birthday,
      this.sabhaID,
      this.officeID,
      this.activeStatus,
      this.genderID,
      this.profilePicPath,
      this.userSignPath,
      this.profilePic,
      this.userSign,
      this.q1Id,
      this.answer1,
      this.q2Id,
      this.answer2,
      this.isAdmin});

  Cashier.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameInFull = json['nameInFull'];
    nameWithInitials = json['nameWithInitials'];
    username = json['username'];
    password = json['password'];
    pin = json['pin'];
    nic = json['nic'];
    contactNo = json['contactNo'];
    birthday = json['birthday'];
    sabhaID = json['sabhaID'];
    officeID = json['officeID'];
    activeStatus = json['activeStatus'];
    genderID = json['genderID'];
    profilePicPath = json['profilePicPath'];
    userSignPath = json['userSignPath'];
    profilePic = json['profilePic'];
    userSign = json['userSign'];
    q1Id = json['q1Id'];
    answer1 = json['answer1'];
    q2Id = json['q2Id'];
    answer2 = json['answer2'];
    isAdmin = json['isAdmin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameInFull'] = this.nameInFull;
    data['nameWithInitials'] = this.nameWithInitials;
    data['username'] = this.username;
    data['password'] = this.password;
    data['pin'] = this.pin;
    data['nic'] = this.nic;
    data['contactNo'] = this.contactNo;
    data['birthday'] = this.birthday;
    data['sabhaID'] = this.sabhaID;
    data['officeID'] = this.officeID;
    data['activeStatus'] = this.activeStatus;
    data['genderID'] = this.genderID;
    data['profilePicPath'] = this.profilePicPath;
    data['userSignPath'] = this.userSignPath;
    data['profilePic'] = this.profilePic;
    data['userSign'] = this.userSign;
    data['q1Id'] = this.q1Id;
    data['answer1'] = this.answer1;
    data['q2Id'] = this.q2Id;
    data['answer2'] = this.answer2;
    data['isAdmin'] = this.isAdmin;
    return data;
  }
}

class Partner {
  int? id;
  String? name;
  String? nicNumber;
  String? passportNo;
  String? mobileNumber;
  String? phoneNumber;
  String? street1;
  String? street2;
  String? city;
  String? zip;
  String? email;
  int? active;
  String? createdAt;
  String? updatedAt;
  int? isEditable;
  int? createdBy;
  int? updatedBy;
  int? gnDivisionId;
  int? sabhaId;
  int? isTempory;
  int? isBusinessOwner;
  int? isPropertyOwner;
  int? isBusiness;
  String? businessRegNo;
  String? profilePicPath;
  GnDivisions? gnDivision;
  List<PartnerMobiles>? partnerMobiles;
  List<PartnerDocuments>? partnerDocuments;
  List<PermittedThirdPartyAssessments>? permittedThirdPartyAssessments;

  Partner(
      {this.id,
      this.name,
      this.nicNumber,
      this.passportNo,
      this.mobileNumber,
      this.phoneNumber,
      this.street1,
      this.street2,
      this.city,
      this.zip,
      this.email,
      this.active,
      this.createdAt,
      this.updatedAt,
      this.isEditable,
      this.createdBy,
      this.updatedBy,
      this.gnDivisionId,
      this.sabhaId,
      this.isTempory,
      this.isBusinessOwner,
      this.isPropertyOwner,
      this.isBusiness,
      this.businessRegNo,
      this.profilePicPath,
      this.gnDivision,
      this.partnerMobiles,
      this.partnerDocuments,
      this.permittedThirdPartyAssessments});

  Partner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nicNumber = json['nicNumber'];
    passportNo = json['passportNo'];
    mobileNumber = json['mobileNumber'];
    phoneNumber = json['phoneNumber'];
    street1 = json['street1'];
    street2 = json['street2'];
    city = json['city'];
    zip = json['zip'];
    email = json['email'];
    active = json['active'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isEditable = json['isEditable'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    gnDivisionId = json['gnDivisionId'];
    sabhaId = json['sabhaId'];
    isTempory = json['isTempory'];
    isBusinessOwner = json['isBusinessOwner'];
    isPropertyOwner = json['isPropertyOwner'];
    isBusiness = json['isBusiness'];
    businessRegNo = json['businessRegNo'];
    profilePicPath = json['profilePicPath'];
    gnDivision = null;
    partnerMobiles = <PartnerMobiles>[];
    partnerDocuments = <PartnerDocuments>[];
    permittedThirdPartyAssessments = <PermittedThirdPartyAssessments>[];
    if (json['partnerMobiles'] != null) {
      partnerMobiles = <PartnerMobiles>[];
      json['partnerMobiles'].forEach((v) {
        partnerMobiles!.add(new PartnerMobiles.fromJson(v));
      });
    }
    if (json['partnerDocuments'] != null) {
      partnerDocuments = <PartnerDocuments>[];
      json['partnerDocuments'].forEach((v) {
        partnerDocuments!.add(new PartnerDocuments.fromJson(v));
      });
    }
    if (json['permittedThirdPartyAssessments'] != null) {
      permittedThirdPartyAssessments = <PermittedThirdPartyAssessments>[];
      json['permittedThirdPartyAssessments'].forEach((v) {
        permittedThirdPartyAssessments!
            .add(new PermittedThirdPartyAssessments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['nicNumber'] = this.nicNumber;
    data['passportNo'] = this.passportNo;
    data['mobileNumber'] = this.mobileNumber;
    data['phoneNumber'] = this.phoneNumber;
    data['street1'] = this.street1;
    data['street2'] = this.street2;
    data['city'] = this.city;
    data['zip'] = this.zip;
    data['email'] = this.email;
    data['active'] = this.active;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['isEditable'] = this.isEditable;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['gnDivisionId'] = this.gnDivisionId;
    data['sabhaId'] = this.sabhaId;
    data['isTempory'] = this.isTempory;
    data['isBusinessOwner'] = this.isBusinessOwner;
    data['isPropertyOwner'] = this.isPropertyOwner;
    data['isBusiness'] = this.isBusiness;
    data['businessRegNo'] = this.businessRegNo;
    data['profilePicPath'] = this.profilePicPath;
    if (this.gnDivision != null) {
      data['gnDivision'] = this.gnDivision!.toJson();
    }
    if (this.partnerMobiles != null) {
      data['partnerMobiles'] =
          this.partnerMobiles!.map((v) => v.toJson()).toList();
    }
    if (this.partnerDocuments != null) {
      data['partnerDocuments'] =
          this.partnerDocuments!.map((v) => v.toJson()).toList();
    }
    if (this.permittedThirdPartyAssessments != null) {
      data['permittedThirdPartyAssessments'] =
          this.permittedThirdPartyAssessments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PartnerMobiles {
  int? id;
  String? nic;
  String? nickName;
  String? mobileNo;
  int? partnerId;
  dynamic? partner;
  String? createdAt;
  String? updatedAt;

  PartnerMobiles(
      {this.id,
      this.nic,
      this.nickName,
      this.mobileNo,
      this.partnerId,
      this.partner,
      this.createdAt,
      this.updatedAt});

  PartnerMobiles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nic = json['nic'];
    nickName = json['nickName'];
    mobileNo = json['mobileNo'];
    partnerId = json['partnerId'];
    partner = json['partner'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nic'] = this.nic;
    data['nickName'] = this.nickName;
    data['mobileNo'] = this.mobileNo;
    data['partnerId'] = this.partnerId;
    data['partner'] = this.partner;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class PartnerDocuments {
  int? id;
  int? documentType;
  String? description;
  String? fileName;
  int? partnerId;
  bool? status;
  String? partner;
  String? createdAt;
  String? updatedAt;

  PartnerDocuments(
      {this.id,
      this.documentType,
      this.description,
      this.fileName,
      this.partnerId,
      this.status,
      this.partner,
      this.createdAt,
      this.updatedAt});

  PartnerDocuments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    documentType = json['documentType'];
    description = json['description'];
    fileName = json['fileName'];
    partnerId = json['partnerId'];
    status = json['status'];
    partner = json['partner'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['documentType'] = this.documentType;
    data['description'] = this.description;
    data['fileName'] = this.fileName;
    data['partnerId'] = this.partnerId;
    data['status'] = this.status;
    data['partner'] = this.partner;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class PermittedThirdPartyAssessments {
  int? id;
  int? partnerId;
  int? assessmentId;
  Assessment? assessment;
  dynamic partner;
  int? status;
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;

  PermittedThirdPartyAssessments(
      {this.id,
      this.partnerId,
      this.assessmentId,
      this.assessment,
      this.partner,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt});

  PermittedThirdPartyAssessments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    partnerId = json['partnerId'];
    assessmentId = json['assessmentId'];
    assessment = json['assessment'] != null
        ? new Assessment.fromJson(json['assessment'])
        : null;
    partner = json['partner'];
    status = json['status'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['partnerId'] = this.partnerId;
    data['assessmentId'] = this.assessmentId;
    if (this.assessment != null) {
      data['assessment'] = this.assessment!.toJson();
    }
    data['partner'] = this.partner;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Assessment {
  int? id;
  int? partnerId;
  int? subPartnerId;
  String? partner;
  String? subPartner;
  int? streetId;
  int? propertyTypeId;
  int? descriptionId;
  int? orderNo;
  String? assessmentNo;
  int? assessmentStatus;
  int? syn;
  String? comment;
  String? obsolete;
  int? officeId;
  int? sabhaId;
  bool? isWarrant;
  bool? isPartnerUpdated;
  bool? isSubPartnerUpdated;
  bool? propertyTypeChangeRequest;
  bool? descriptionChangeRequest;
  bool? allocationChangeRequest;
  bool? deleteRequest;
  bool? hasJournalRequest;
  bool? hasAssetsChangeRequest;
  bool? hasBillAdjustmentRequest;
  String? propertyAddress;
  int? nextYearPropertyTypeId;
  int? nextYearDescriptionId;
  int? parentAssessmentId;
  String? createdAt;
  String? updatedAt;
  int? createdBy;
  int? updatedBy;
  String? rowVersion;
  Description? description;
  AssessmentPropertyType? assessmentPropertyType;
  Street? street;
  Allocation? allocation;
  NewAllocationRequest? newAllocationRequest;
  AssessmentTempPartner? assessmentTempPartner;
  List<AssessmentTempSubPartner>? assessmentTempSubPartner;
  AssessmentBalance? assessmentBalance;
  List<AssessmentBalanceHistories>? assessmentBalanceHistories;
  List<Transactions>? transactions;
  List<AssessmentAuditLogs>? assessmentAuditLogs;
  List<AssessmentPropertyTypeLogs>? assessmentPropertyTypeLogs;
  List<AssessmentDescriptionLogs>? assessmentDescriptionLogs;
  List<AssessmentDocuments>? assessmentDocuments;
  List<AssessmentJournals>? assessmentJournals;
  List<AssessmentAssetsChange>? assessmentAssetsChange;
  List<AssessmentQuarterReport>? assessmentQuarterReport;
  List<AssessmentBillAdjustments>? assessmentBillAdjustments;
  List<AmalgamationAssessment>? amalgamationAssessment;
  List<AssessmentATDs>? assessmentATDs;

  Assessment(
      {this.id,
      this.partnerId,
      this.subPartnerId,
      this.partner,
      this.subPartner,
      this.streetId,
      this.propertyTypeId,
      this.descriptionId,
      this.orderNo,
      this.assessmentNo,
      this.assessmentStatus,
      this.syn,
      this.comment,
      this.obsolete,
      this.officeId,
      this.sabhaId,
      this.isWarrant,
      this.isPartnerUpdated,
      this.isSubPartnerUpdated,
      this.propertyTypeChangeRequest,
      this.descriptionChangeRequest,
      this.allocationChangeRequest,
      this.deleteRequest,
      this.hasJournalRequest,
      this.hasAssetsChangeRequest,
      this.hasBillAdjustmentRequest,
      this.propertyAddress,
      this.nextYearPropertyTypeId,
      this.nextYearDescriptionId,
      this.parentAssessmentId,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy,
      this.rowVersion,
      this.description,
      this.assessmentPropertyType,
      this.street,
      this.allocation,
      this.newAllocationRequest,
      this.assessmentTempPartner,
      this.assessmentTempSubPartner,
      this.assessmentBalance,
      this.assessmentBalanceHistories,
      this.transactions,
      this.assessmentAuditLogs,
      this.assessmentPropertyTypeLogs,
      this.assessmentDescriptionLogs,
      this.assessmentDocuments,
      this.assessmentJournals,
      this.assessmentAssetsChange,
      this.assessmentQuarterReport,
      this.assessmentBillAdjustments,
      this.amalgamationAssessment,
      this.assessmentATDs});

  Assessment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    partnerId = json['partnerId'];
    subPartnerId = json['subPartnerId'];
    partner = json['partner'];
    subPartner = json['subPartner'];
    streetId = json['streetId'];
    propertyTypeId = json['propertyTypeId'];
    descriptionId = json['descriptionId'];
    orderNo = json['orderNo'];
    assessmentNo = json['assessmentNo'];
    assessmentStatus = json['assessmentStatus'];
    syn = json['syn'];
    comment = json['comment'];
    obsolete = json['obsolete'];
    officeId = json['officeId'];
    sabhaId = json['sabhaId'];
    isWarrant = json['isWarrant'];
    isPartnerUpdated = json['isPartnerUpdated'];
    isSubPartnerUpdated = json['isSubPartnerUpdated'];
    propertyTypeChangeRequest = json['propertyTypeChangeRequest'];
    descriptionChangeRequest = json['descriptionChangeRequest'];
    allocationChangeRequest = json['allocationChangeRequest'];
    deleteRequest = json['deleteRequest'];
    hasJournalRequest = json['hasJournalRequest'];
    hasAssetsChangeRequest = json['hasAssetsChangeRequest'];
    hasBillAdjustmentRequest = json['hasBillAdjustmentRequest'];
    propertyAddress = json['propertyAddress'];
    nextYearPropertyTypeId = json['nextYearPropertyTypeId'];
    nextYearDescriptionId = json['nextYearDescriptionId'];
    parentAssessmentId = json['parentAssessmentId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    rowVersion = json['rowVersion'];
    description = json['description'] != null
        ? new Description.fromJson(json['description'])
        : null;
    assessmentPropertyType = json['assessmentPropertyType'] != null
        ? new AssessmentPropertyType.fromJson(json['assessmentPropertyType'])
        : null;
    street =
        json['street'] != null ? new Street.fromJson(json['street']) : null;
    allocation = json['allocation'] != null
        ? new Allocation.fromJson(json['allocation'])
        : null;
    newAllocationRequest = json['newAllocationRequest'] != null
        ? new NewAllocationRequest.fromJson(json['newAllocationRequest'])
        : null;
    assessmentTempPartner = json['assessmentTempPartner'] != null
        ? new AssessmentTempPartner.fromJson(json['assessmentTempPartner'])
        : null;
    if (json['assessmentTempSubPartner'] != null) {
      assessmentTempSubPartner = <AssessmentTempSubPartner>[];
      json['assessmentTempSubPartner'].forEach((v) {
        assessmentTempSubPartner!.add(new AssessmentTempSubPartner.fromJson(v));
      });
    }
    assessmentBalance = json['assessmentBalance'] != null
        ? new AssessmentBalance.fromJson(json['assessmentBalance'])
        : null;
    if (json['assessmentBalanceHistories'] != null) {
      assessmentBalanceHistories = <AssessmentBalanceHistories>[];
      json['assessmentBalanceHistories'].forEach((v) {
        assessmentBalanceHistories!
            .add(new AssessmentBalanceHistories.fromJson(v));
      });
    }
    if (json['transactions'] != null) {
      transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        transactions!.add(new Transactions.fromJson(v));
      });
    }
    if (json['assessmentAuditLogs'] != null) {
      assessmentAuditLogs = <AssessmentAuditLogs>[];
      json['assessmentAuditLogs'].forEach((v) {
        assessmentAuditLogs!.add(new AssessmentAuditLogs.fromJson(v));
      });
    }
    if (json['assessmentPropertyTypeLogs'] != null) {
      assessmentPropertyTypeLogs = <AssessmentPropertyTypeLogs>[];
      json['assessmentPropertyTypeLogs'].forEach((v) {
        assessmentPropertyTypeLogs!
            .add(new AssessmentPropertyTypeLogs.fromJson(v));
      });
    }
    if (json['assessmentDescriptionLogs'] != null) {
      assessmentDescriptionLogs = <AssessmentDescriptionLogs>[];
      json['assessmentDescriptionLogs'].forEach((v) {
        assessmentDescriptionLogs!
            .add(new AssessmentDescriptionLogs.fromJson(v));
      });
    }
    if (json['assessmentDocuments'] != null) {
      assessmentDocuments = <AssessmentDocuments>[];
      json['assessmentDocuments'].forEach((v) {
        assessmentDocuments!.add(new AssessmentDocuments.fromJson(v));
      });
    }
    if (json['assessmentJournals'] != null) {
      assessmentJournals = <AssessmentJournals>[];
      json['assessmentJournals'].forEach((v) {
        assessmentJournals!.add(new AssessmentJournals.fromJson(v));
      });
    }
    if (json['assessmentAssetsChange'] != null) {
      assessmentAssetsChange = <AssessmentAssetsChange>[];
      json['assessmentAssetsChange'].forEach((v) {
        assessmentAssetsChange!.add(new AssessmentAssetsChange.fromJson(v));
      });
    }
    if (json['assessmentQuarterReport'] != null) {
      assessmentQuarterReport = <AssessmentQuarterReport>[];
      json['assessmentQuarterReport'].forEach((v) {
        assessmentQuarterReport!.add(new AssessmentQuarterReport.fromJson(v));
      });
    }
    if (json['assessmentBillAdjustments'] != null) {
      assessmentBillAdjustments = <AssessmentBillAdjustments>[];
      json['assessmentBillAdjustments'].forEach((v) {
        assessmentBillAdjustments!
            .add(new AssessmentBillAdjustments.fromJson(v));
      });
    }
    if (json['amalgamationAssessment'] != null) {
      amalgamationAssessment = <AmalgamationAssessment>[];
      json['amalgamationAssessment'].forEach((v) {
        amalgamationAssessment!.add(new AmalgamationAssessment.fromJson(v));
      });
    }
    if (json['assessmentATDs'] != null) {
      assessmentATDs = <AssessmentATDs>[];
      json['assessmentATDs'].forEach((v) {
        assessmentATDs!.add(new AssessmentATDs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['partnerId'] = this.partnerId;
    data['subPartnerId'] = this.subPartnerId;
    data['partner'] = this.partner;
    data['subPartner'] = this.subPartner;
    data['streetId'] = this.streetId;
    data['propertyTypeId'] = this.propertyTypeId;
    data['descriptionId'] = this.descriptionId;
    data['orderNo'] = this.orderNo;
    data['assessmentNo'] = this.assessmentNo;
    data['assessmentStatus'] = this.assessmentStatus;
    data['syn'] = this.syn;
    data['comment'] = this.comment;
    data['obsolete'] = this.obsolete;
    data['officeId'] = this.officeId;
    data['sabhaId'] = this.sabhaId;
    data['isWarrant'] = this.isWarrant;
    data['isPartnerUpdated'] = this.isPartnerUpdated;
    data['isSubPartnerUpdated'] = this.isSubPartnerUpdated;
    data['propertyTypeChangeRequest'] = this.propertyTypeChangeRequest;
    data['descriptionChangeRequest'] = this.descriptionChangeRequest;
    data['allocationChangeRequest'] = this.allocationChangeRequest;
    data['deleteRequest'] = this.deleteRequest;
    data['hasJournalRequest'] = this.hasJournalRequest;
    data['hasAssetsChangeRequest'] = this.hasAssetsChangeRequest;
    data['hasBillAdjustmentRequest'] = this.hasBillAdjustmentRequest;
    data['propertyAddress'] = this.propertyAddress;
    data['nextYearPropertyTypeId'] = this.nextYearPropertyTypeId;
    data['nextYearDescriptionId'] = this.nextYearDescriptionId;
    data['parentAssessmentId'] = this.parentAssessmentId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['rowVersion'] = this.rowVersion;
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    if (this.assessmentPropertyType != null) {
      data['assessmentPropertyType'] = this.assessmentPropertyType!.toJson();
    }
    if (this.street != null) {
      data['street'] = this.street!.toJson();
    }
    if (this.allocation != null) {
      data['allocation'] = this.allocation!.toJson();
    }
    if (this.newAllocationRequest != null) {
      data['newAllocationRequest'] = this.newAllocationRequest!.toJson();
    }
    if (this.assessmentTempPartner != null) {
      data['assessmentTempPartner'] = this.assessmentTempPartner!.toJson();
    }
    if (this.assessmentTempSubPartner != null) {
      data['assessmentTempSubPartner'] =
          this.assessmentTempSubPartner!.map((v) => v.toJson()).toList();
    }
    if (this.assessmentBalance != null) {
      data['assessmentBalance'] = this.assessmentBalance!.toJson();
    }
    if (this.assessmentBalanceHistories != null) {
      data['assessmentBalanceHistories'] =
          this.assessmentBalanceHistories!.map((v) => v.toJson()).toList();
    }
    if (this.transactions != null) {
      data['transactions'] = this.transactions!.map((v) => v.toJson()).toList();
    }
    if (this.assessmentAuditLogs != null) {
      data['assessmentAuditLogs'] =
          this.assessmentAuditLogs!.map((v) => v.toJson()).toList();
    }
    if (this.assessmentPropertyTypeLogs != null) {
      data['assessmentPropertyTypeLogs'] =
          this.assessmentPropertyTypeLogs!.map((v) => v.toJson()).toList();
    }
    if (this.assessmentDescriptionLogs != null) {
      data['assessmentDescriptionLogs'] =
          this.assessmentDescriptionLogs!.map((v) => v.toJson()).toList();
    }
    if (this.assessmentDocuments != null) {
      data['assessmentDocuments'] =
          this.assessmentDocuments!.map((v) => v.toJson()).toList();
    }
    if (this.assessmentJournals != null) {
      data['assessmentJournals'] =
          this.assessmentJournals!.map((v) => v.toJson()).toList();
    }
    if (this.assessmentAssetsChange != null) {
      data['assessmentAssetsChange'] =
          this.assessmentAssetsChange!.map((v) => v.toJson()).toList();
    }
    if (this.assessmentQuarterReport != null) {
      data['assessmentQuarterReport'] =
          this.assessmentQuarterReport!.map((v) => v.toJson()).toList();
    }
    if (this.assessmentBillAdjustments != null) {
      data['assessmentBillAdjustments'] =
          this.assessmentBillAdjustments!.map((v) => v.toJson()).toList();
    }
    if (this.amalgamationAssessment != null) {
      data['amalgamationAssessment'] =
          this.amalgamationAssessment!.map((v) => v.toJson()).toList();
    }
    if (this.assessmentATDs != null) {
      data['assessmentATDs'] =
          this.assessmentATDs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Description {
  int? id;
  int? descriptionNo;
  String? descriptionText;
  int? sabhaId;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? createdBy;
  int? updatedBy;
  List<String>? assessments;

  Description(
      {this.id,
      this.descriptionNo,
      this.descriptionText,
      this.sabhaId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy,
      this.assessments});

  Description.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descriptionNo = json['descriptionNo'];
    descriptionText = json['descriptionText'];
    sabhaId = json['sabhaId'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    assessments = json['assessments'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descriptionNo'] = this.descriptionNo;
    data['descriptionText'] = this.descriptionText;
    data['sabhaId'] = this.sabhaId;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['assessments'] = this.assessments;
    return data;
  }
}

class AssessmentPropertyType {
  int? id;
  String? propertyTypeName;
  int? propertyTypeNo;
  int? quarterRate;
  int? warrantRate;
  int? sabhaId;
  int? status;
  int? nextYearQuarterRate;
  int? nextYearWarrantRate;
  List<String>? assessments;
  List<PropertyTypesLogs>? propertyTypesLogs;
  String? createdAt;
  String? updatedAt;
  int? createdBy;
  int? updatedBy;

  AssessmentPropertyType(
      {this.id,
      this.propertyTypeName,
      this.propertyTypeNo,
      this.quarterRate,
      this.warrantRate,
      this.sabhaId,
      this.status,
      this.nextYearQuarterRate,
      this.nextYearWarrantRate,
      this.assessments,
      this.propertyTypesLogs,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy});

  AssessmentPropertyType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyTypeName = json['propertyTypeName'];
    propertyTypeNo = json['propertyTypeNo'];
    quarterRate = json['quarterRate'];
    warrantRate = json['warrantRate'];
    sabhaId = json['sabhaId'];
    status = json['status'];
    nextYearQuarterRate = json['nextYearQuarterRate'];
    nextYearWarrantRate = json['nextYearWarrantRate'];
    assessments = json['assessments'].cast<String>();
    if (json['propertyTypesLogs'] != null) {
      propertyTypesLogs = <PropertyTypesLogs>[];
      json['propertyTypesLogs'].forEach((v) {
        propertyTypesLogs!.add(new PropertyTypesLogs.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['propertyTypeName'] = this.propertyTypeName;
    data['propertyTypeNo'] = this.propertyTypeNo;
    data['quarterRate'] = this.quarterRate;
    data['warrantRate'] = this.warrantRate;
    data['sabhaId'] = this.sabhaId;
    data['status'] = this.status;
    data['nextYearQuarterRate'] = this.nextYearQuarterRate;
    data['nextYearWarrantRate'] = this.nextYearWarrantRate;
    data['assessments'] = this.assessments;
    if (this.propertyTypesLogs != null) {
      data['propertyTypesLogs'] =
          this.propertyTypesLogs!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}

class PropertyTypesLogs {
  int? id;
  int? propertyTypeId;
  String? propertyTypeName;
  int? propertyTypeNo;
  int? quarterRate;
  int? warrantRate;
  String? assessmentPropertyType;
  int? changeFiled;
  String? dateFrom;
  String? dateTo;
  String? createdAt;
  int? createdBy;

  PropertyTypesLogs(
      {this.id,
      this.propertyTypeId,
      this.propertyTypeName,
      this.propertyTypeNo,
      this.quarterRate,
      this.warrantRate,
      this.assessmentPropertyType,
      this.changeFiled,
      this.dateFrom,
      this.dateTo,
      this.createdAt,
      this.createdBy});

  PropertyTypesLogs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyTypeId = json['propertyTypeId'];
    propertyTypeName = json['propertyTypeName'];
    propertyTypeNo = json['propertyTypeNo'];
    quarterRate = json['quarterRate'];
    warrantRate = json['warrantRate'];
    assessmentPropertyType = json['assessmentPropertyType'];
    changeFiled = json['changeFiled'];
    dateFrom = json['dateFrom'];
    dateTo = json['dateTo'];
    createdAt = json['createdAt'];
    createdBy = json['createdBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['propertyTypeId'] = this.propertyTypeId;
    data['propertyTypeName'] = this.propertyTypeName;
    data['propertyTypeNo'] = this.propertyTypeNo;
    data['quarterRate'] = this.quarterRate;
    data['warrantRate'] = this.warrantRate;
    data['assessmentPropertyType'] = this.assessmentPropertyType;
    data['changeFiled'] = this.changeFiled;
    data['dateFrom'] = this.dateFrom;
    data['dateTo'] = this.dateTo;
    data['createdAt'] = this.createdAt;
    data['createdBy'] = this.createdBy;
    return data;
  }
}

class Street {
  int? id;
  String? streetName;
  String? streetNo;
  String? streetCode;
  int? wardId;
  Ward? ward;
  List<String>? assessments;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? createdBy;
  int? updatedBy;

  Street(
      {this.id,
      this.streetName,
      this.streetNo,
      this.streetCode,
      this.wardId,
      this.ward,
      this.assessments,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy});

  Street.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    streetName = json['streetName'];
    streetNo = json['streetNo'];
    streetCode = json['streetCode'];
    wardId = json['wardId'];
    ward = json['ward'] != null ? new Ward.fromJson(json['ward']) : null;
    assessments = json['assessments'].cast<String>();
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['streetName'] = this.streetName;
    data['streetNo'] = this.streetNo;
    data['streetCode'] = this.streetCode;
    data['wardId'] = this.wardId;
    if (this.ward != null) {
      data['ward'] = this.ward!.toJson();
    }
    data['assessments'] = this.assessments;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}

class Ward {
  int? id;
  String? wardName;
  String? wardNo;
  String? wardCode;
  int? officeId;
  int? sabhaId;
  List<String>? streets;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? createdBy;
  int? updatedBy;

  Ward(
      {this.id,
      this.wardName,
      this.wardNo,
      this.wardCode,
      this.officeId,
      this.sabhaId,
      this.streets,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy});

  Ward.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    wardName = json['wardName'];
    wardNo = json['wardNo'];
    wardCode = json['wardCode'];
    officeId = json['officeId'];
    sabhaId = json['sabhaId'];
    streets = json['streets'].cast<String>();
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['wardName'] = this.wardName;
    data['wardNo'] = this.wardNo;
    data['wardCode'] = this.wardCode;
    data['officeId'] = this.officeId;
    data['sabhaId'] = this.sabhaId;
    data['streets'] = this.streets;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}

class Allocation {
  int? id;
  int? allocationAmount;
  String? changedDate;
  String? allocationDescription;
  int? assessmentId;
  String? assessment;
  List<AllocationLogs>? allocationLogs;
  int? nextYearAllocationAmount;
  String? nextYearAllocationDescription;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? createdBy;
  int? updatedBy;

  Allocation(
      {this.id,
      this.allocationAmount,
      this.changedDate,
      this.allocationDescription,
      this.assessmentId,
      this.assessment,
      this.allocationLogs,
      this.nextYearAllocationAmount,
      this.nextYearAllocationDescription,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy});

  Allocation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    allocationAmount = json['allocationAmount'];
    changedDate = json['changedDate'];
    allocationDescription = json['allocationDescription'];
    assessmentId = json['assessmentId'];
    assessment = json['assessment'];
    if (json['allocationLogs'] != null) {
      allocationLogs = <AllocationLogs>[];
      json['allocationLogs'].forEach((v) {
        allocationLogs!.add(new AllocationLogs.fromJson(v));
      });
    }
    nextYearAllocationAmount = json['nextYearAllocationAmount'];
    nextYearAllocationDescription = json['nextYearAllocationDescription'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['allocationAmount'] = this.allocationAmount;
    data['changedDate'] = this.changedDate;
    data['allocationDescription'] = this.allocationDescription;
    data['assessmentId'] = this.assessmentId;
    data['assessment'] = this.assessment;
    if (this.allocationLogs != null) {
      data['allocationLogs'] =
          this.allocationLogs!.map((v) => v.toJson()).toList();
    }
    data['nextYearAllocationAmount'] = this.nextYearAllocationAmount;
    data['nextYearAllocationDescription'] = this.nextYearAllocationDescription;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}

class AllocationLogs {
  int? id;
  int? amount;
  String? fromDate;
  String? toDate;
  String? description;
  int? allocationId;
  String? allocation;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? createdBy;
  int? updatedBy;

  AllocationLogs(
      {this.id,
      this.amount,
      this.fromDate,
      this.toDate,
      this.description,
      this.allocationId,
      this.allocation,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy});

  AllocationLogs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    fromDate = json['fromDate'];
    toDate = json['toDate'];
    description = json['description'];
    allocationId = json['allocationId'];
    allocation = json['allocation'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['fromDate'] = this.fromDate;
    data['toDate'] = this.toDate;
    data['description'] = this.description;
    data['allocationId'] = this.allocationId;
    data['allocation'] = this.allocation;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}

class NewAllocationRequest {
  int? id;
  int? allocationAmount;
  String? allocationDescription;
  int? assessmentId;
  String? assessment;
  int? activationYear;
  int? activationQuarter;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? createdBy;
  int? updatedBy;

  NewAllocationRequest(
      {this.id,
      this.allocationAmount,
      this.allocationDescription,
      this.assessmentId,
      this.assessment,
      this.activationYear,
      this.activationQuarter,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy});

  NewAllocationRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    allocationAmount = json['allocationAmount'];
    allocationDescription = json['allocationDescription'];
    assessmentId = json['assessmentId'];
    assessment = json['assessment'];
    activationYear = json['activationYear'];
    activationQuarter = json['activationQuarter'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['allocationAmount'] = this.allocationAmount;
    data['allocationDescription'] = this.allocationDescription;
    data['assessmentId'] = this.assessmentId;
    data['assessment'] = this.assessment;
    data['activationYear'] = this.activationYear;
    data['activationQuarter'] = this.activationQuarter;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}

class AssessmentTempPartner {
  int? id;
  String? name;
  String? nicNumber;
  String? mobileNumber;
  String? street1;
  String? street2;
  String? email;
  int? assessmentId;
  String? assessment;
  String? createdAt;
  String? updatedAt;
  int? createdBy;
  int? updatedBy;

  AssessmentTempPartner(
      {this.id,
      this.name,
      this.nicNumber,
      this.mobileNumber,
      this.street1,
      this.street2,
      this.email,
      this.assessmentId,
      this.assessment,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy});

  AssessmentTempPartner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nicNumber = json['nicNumber'];
    mobileNumber = json['mobileNumber'];
    street1 = json['street1'];
    street2 = json['street2'];
    email = json['email'];
    assessmentId = json['assessmentId'];
    assessment = json['assessment'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['nicNumber'] = this.nicNumber;
    data['mobileNumber'] = this.mobileNumber;
    data['street1'] = this.street1;
    data['street2'] = this.street2;
    data['email'] = this.email;
    data['assessmentId'] = this.assessmentId;
    data['assessment'] = this.assessment;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}

class AssessmentTempSubPartner {
  int? id;
  String? name;
  String? nicNumber;
  String? mobileNumber;
  String? street1;
  String? street2;
  int? assessmentId;
  String? assessment;
  String? createdAt;
  String? updatedAt;
  int? createdBy;
  int? updatedBy;

  AssessmentTempSubPartner(
      {this.id,
      this.name,
      this.nicNumber,
      this.mobileNumber,
      this.street1,
      this.street2,
      this.assessmentId,
      this.assessment,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy});

  AssessmentTempSubPartner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nicNumber = json['nicNumber'];
    mobileNumber = json['mobileNumber'];
    street1 = json['street1'];
    street2 = json['street2'];
    assessmentId = json['assessmentId'];
    assessment = json['assessment'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['nicNumber'] = this.nicNumber;
    data['mobileNumber'] = this.mobileNumber;
    data['street1'] = this.street1;
    data['street2'] = this.street2;
    data['assessmentId'] = this.assessmentId;
    data['assessment'] = this.assessment;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}

class AssessmentBalance {
  int? id;
  int? assessmentId;
  int? year;
  String? startDate;
  int? excessPayment;
  int? lyArrears;
  int? lyWarrant;
  int? tyArrears;
  int? tyWarrant;
  int? annualAmount;
  int? byExcessDeduction;
  int? paid;
  int? numberOfPayments;
  int? numberOfCancels;
  int? overPayment;
  int? discountRate;
  int? discount;
  int? currentQuarter;
  bool? isCompleted;
  bool? hasTransaction;
  int? reportBalance;
  Q1? q1;
  Q1? q2;
  Q1? q3;
  Q1? q4;
  NQ1? nQ1;
  NQ1? nQ2;
  NQ1? nQ3;
  NQ1? nQ4;
  int? lyArrearsAdjustment;
  int? lyWarrantAdjustment;
  int? tyArrearsAdjustment;
  int? tyWarrantAdjustment;
  int? overPayAdjustment;
  String? assessment;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? createdBy;
  int? updatedBy;
  String? rowVersion;

  AssessmentBalance(
      {this.id,
      this.assessmentId,
      this.year,
      this.startDate,
      this.excessPayment,
      this.lyArrears,
      this.lyWarrant,
      this.tyArrears,
      this.tyWarrant,
      this.annualAmount,
      this.byExcessDeduction,
      this.paid,
      this.numberOfPayments,
      this.numberOfCancels,
      this.overPayment,
      this.discountRate,
      this.discount,
      this.currentQuarter,
      this.isCompleted,
      this.hasTransaction,
      this.reportBalance,
      this.q1,
      this.q2,
      this.q3,
      this.q4,
      this.nQ1,
      this.nQ2,
      this.nQ3,
      this.nQ4,
      this.lyArrearsAdjustment,
      this.lyWarrantAdjustment,
      this.tyArrearsAdjustment,
      this.tyWarrantAdjustment,
      this.overPayAdjustment,
      this.assessment,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy,
      this.rowVersion});

  AssessmentBalance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assessmentId = json['assessmentId'];
    year = json['year'];
    startDate = json['startDate'];
    excessPayment = json['excessPayment'];
    lyArrears = json['lyArrears'];
    lyWarrant = json['lyWarrant'];
    tyArrears = json['tyArrears'];
    tyWarrant = json['tyWarrant'];
    annualAmount = json['annualAmount'];
    byExcessDeduction = json['byExcessDeduction'];
    paid = json['paid'];
    numberOfPayments = json['numberOfPayments'];
    numberOfCancels = json['numberOfCancels'];
    overPayment = json['overPayment'];
    discountRate = json['discountRate'];
    discount = json['discount'];
    currentQuarter = json['currentQuarter'];
    isCompleted = json['isCompleted'];
    hasTransaction = json['hasTransaction'];
    reportBalance = json['reportBalance'];
    q1 = json['q1'] != null ? new Q1.fromJson(json['q1']) : null;
    q2 = json['q2'] != null ? new Q1.fromJson(json['q2']) : null;
    q3 = json['q3'] != null ? new Q1.fromJson(json['q3']) : null;
    q4 = json['q4'] != null ? new Q1.fromJson(json['q4']) : null;
    nQ1 = json['nQ1'] != null ? new NQ1.fromJson(json['nQ1']) : null;
    nQ2 = json['nQ2'] != null ? new NQ1.fromJson(json['nQ2']) : null;
    nQ3 = json['nQ3'] != null ? new NQ1.fromJson(json['nQ3']) : null;
    nQ4 = json['nQ4'] != null ? new NQ1.fromJson(json['nQ4']) : null;
    lyArrearsAdjustment = json['lyArrearsAdjustment'];
    lyWarrantAdjustment = json['lyWarrantAdjustment'];
    tyArrearsAdjustment = json['tyArrearsAdjustment'];
    tyWarrantAdjustment = json['tyWarrantAdjustment'];
    overPayAdjustment = json['overPayAdjustment'];
    assessment = json['assessment'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    rowVersion = json['rowVersion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['assessmentId'] = this.assessmentId;
    data['year'] = this.year;
    data['startDate'] = this.startDate;
    data['excessPayment'] = this.excessPayment;
    data['lyArrears'] = this.lyArrears;
    data['lyWarrant'] = this.lyWarrant;
    data['tyArrears'] = this.tyArrears;
    data['tyWarrant'] = this.tyWarrant;
    data['annualAmount'] = this.annualAmount;
    data['byExcessDeduction'] = this.byExcessDeduction;
    data['paid'] = this.paid;
    data['numberOfPayments'] = this.numberOfPayments;
    data['numberOfCancels'] = this.numberOfCancels;
    data['overPayment'] = this.overPayment;
    data['discountRate'] = this.discountRate;
    data['discount'] = this.discount;
    data['currentQuarter'] = this.currentQuarter;
    data['isCompleted'] = this.isCompleted;
    data['hasTransaction'] = this.hasTransaction;
    data['reportBalance'] = this.reportBalance;
    if (this.q1 != null) {
      data['q1'] = this.q1!.toJson();
    }
    if (this.q2 != null) {
      data['q2'] = this.q2!.toJson();
    }
    if (this.q3 != null) {
      data['q3'] = this.q3!.toJson();
    }
    if (this.q4 != null) {
      data['q4'] = this.q4!.toJson();
    }
    if (this.nQ1 != null) {
      data['nQ1'] = this.nQ1!.toJson();
    }
    if (this.nQ2 != null) {
      data['nQ2'] = this.nQ2!.toJson();
    }
    if (this.nQ3 != null) {
      data['nQ3'] = this.nQ3!.toJson();
    }
    if (this.nQ4 != null) {
      data['nQ4'] = this.nQ4!.toJson();
    }
    data['lyArrearsAdjustment'] = this.lyArrearsAdjustment;
    data['lyWarrantAdjustment'] = this.lyWarrantAdjustment;
    data['tyArrearsAdjustment'] = this.tyArrearsAdjustment;
    data['tyWarrantAdjustment'] = this.tyWarrantAdjustment;
    data['overPayAdjustment'] = this.overPayAdjustment;
    data['assessment'] = this.assessment;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['rowVersion'] = this.rowVersion;
    return data;
  }
}

class Q1 {
  int? id;
  int? amount;
  int? byExcessDeduction;
  int? paid;
  int? discount;
  int? warrant;
  int? warrantMethod;
  String? startDate;
  String? endDate;
  bool? isCompleted;
  bool? isOver;
  int? balanceId;
  String? assessmentBalance;
  int? warrantBy;
  int? discountRate;
  int? warrantRate;
  String? rowVersion;
  int? adjustment;
  int? qReportAdjustment;

  Q1(
      {this.id,
      this.amount,
      this.byExcessDeduction,
      this.paid,
      this.discount,
      this.warrant,
      this.warrantMethod,
      this.startDate,
      this.endDate,
      this.isCompleted,
      this.isOver,
      this.balanceId,
      this.assessmentBalance,
      this.warrantBy,
      this.discountRate,
      this.warrantRate,
      this.rowVersion,
      this.adjustment,
      this.qReportAdjustment});

  Q1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    byExcessDeduction = json['byExcessDeduction'];
    paid = json['paid'];
    discount = json['discount'];
    warrant = json['warrant'];
    warrantMethod = json['warrantMethod'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    isCompleted = json['isCompleted'];
    isOver = json['isOver'];
    balanceId = json['balanceId'];
    assessmentBalance = json['assessmentBalance'];
    warrantBy = json['warrantBy'];
    discountRate = json['discountRate'];
    warrantRate = json['warrantRate'];
    rowVersion = json['rowVersion'];
    adjustment = json['adjustment'];
    qReportAdjustment = json['qReportAdjustment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['byExcessDeduction'] = this.byExcessDeduction;
    data['paid'] = this.paid;
    data['discount'] = this.discount;
    data['warrant'] = this.warrant;
    data['warrantMethod'] = this.warrantMethod;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['isCompleted'] = this.isCompleted;
    data['isOver'] = this.isOver;
    data['balanceId'] = this.balanceId;
    data['assessmentBalance'] = this.assessmentBalance;
    data['warrantBy'] = this.warrantBy;
    data['discountRate'] = this.discountRate;
    data['warrantRate'] = this.warrantRate;
    data['rowVersion'] = this.rowVersion;
    data['adjustment'] = this.adjustment;
    data['qReportAdjustment'] = this.qReportAdjustment;
    return data;
  }
}

class NQ1 {
  int? id;
  int? amount;
  int? balanceId;
  String? assessmentBalance;
  String? rowVersion;

  NQ1(
      {this.id,
      this.amount,
      this.balanceId,
      this.assessmentBalance,
      this.rowVersion});

  NQ1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    balanceId = json['balanceId'];
    assessmentBalance = json['assessmentBalance'];
    rowVersion = json['rowVersion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['balanceId'] = this.balanceId;
    data['assessmentBalance'] = this.assessmentBalance;
    data['rowVersion'] = this.rowVersion;
    return data;
  }
}

class AssessmentBalanceHistories {
  int? id;
  int? assessmentId;
  int? year;
  String? startDate;
  String? endData;
  int? excessPayment;
  int? lyWarrant;
  int? lyArrears;
  int? tyWarrant;
  int? tyArrears;
  int? byExcessDeduction;
  int? paid;
  int? numberOfPayments;
  int? numberOfCancels;
  int? overPayment;
  int? discountRate;
  int? discount;
  bool? isCompleted;
  QH1? qH1;
  QH1? qH2;
  QH1? qH3;
  QH1? qH4;
  String? assessment;
  int? transactionsType;
  String? sessionDate;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? createdBy;
  int? updatedBy;
  String? rowVersion;

  AssessmentBalanceHistories(
      {this.id,
      this.assessmentId,
      this.year,
      this.startDate,
      this.endData,
      this.excessPayment,
      this.lyWarrant,
      this.lyArrears,
      this.tyWarrant,
      this.tyArrears,
      this.byExcessDeduction,
      this.paid,
      this.numberOfPayments,
      this.numberOfCancels,
      this.overPayment,
      this.discountRate,
      this.discount,
      this.isCompleted,
      this.qH1,
      this.qH2,
      this.qH3,
      this.qH4,
      this.assessment,
      this.transactionsType,
      this.sessionDate,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy,
      this.rowVersion});

  AssessmentBalanceHistories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assessmentId = json['assessmentId'];
    year = json['year'];
    startDate = json['startDate'];
    endData = json['endData'];
    excessPayment = json['excessPayment'];
    lyWarrant = json['lyWarrant'];
    lyArrears = json['lyArrears'];
    tyWarrant = json['tyWarrant'];
    tyArrears = json['tyArrears'];
    byExcessDeduction = json['byExcessDeduction'];
    paid = json['paid'];
    numberOfPayments = json['numberOfPayments'];
    numberOfCancels = json['numberOfCancels'];
    overPayment = json['overPayment'];
    discountRate = json['discountRate'];
    discount = json['discount'];
    isCompleted = json['isCompleted'];
    qH1 = json['qH1'] != null ? new QH1.fromJson(json['qH1']) : null;
    qH2 = json['qH2'] != null ? new QH1.fromJson(json['qH2']) : null;
    qH3 = json['qH3'] != null ? new QH1.fromJson(json['qH3']) : null;
    qH4 = json['qH4'] != null ? new QH1.fromJson(json['qH4']) : null;
    assessment = json['assessment'];
    transactionsType = json['transactionsType'];
    sessionDate = json['sessionDate'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    rowVersion = json['rowVersion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['assessmentId'] = this.assessmentId;
    data['year'] = this.year;
    data['startDate'] = this.startDate;
    data['endData'] = this.endData;
    data['excessPayment'] = this.excessPayment;
    data['lyWarrant'] = this.lyWarrant;
    data['lyArrears'] = this.lyArrears;
    data['tyWarrant'] = this.tyWarrant;
    data['tyArrears'] = this.tyArrears;
    data['byExcessDeduction'] = this.byExcessDeduction;
    data['paid'] = this.paid;
    data['numberOfPayments'] = this.numberOfPayments;
    data['numberOfCancels'] = this.numberOfCancels;
    data['overPayment'] = this.overPayment;
    data['discountRate'] = this.discountRate;
    data['discount'] = this.discount;
    data['isCompleted'] = this.isCompleted;
    if (this.qH1 != null) {
      data['qH1'] = this.qH1!.toJson();
    }
    if (this.qH2 != null) {
      data['qH2'] = this.qH2!.toJson();
    }
    if (this.qH3 != null) {
      data['qH3'] = this.qH3!.toJson();
    }
    if (this.qH4 != null) {
      data['qH4'] = this.qH4!.toJson();
    }
    data['assessment'] = this.assessment;
    data['transactionsType'] = this.transactionsType;
    data['sessionDate'] = this.sessionDate;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['rowVersion'] = this.rowVersion;
    return data;
  }
}

class QH1 {
  int? id;
  int? amount;
  int? byExcessDeduction;
  int? paid;
  int? discount;
  int? warrant;
  int? warrantMethod;
  String? startDate;
  String? endDate;
  bool? isCompleted;
  int? balanceHistoryId;
  String? assessmentBalanceHistory;
  int? warrantBy;
  int? discountRate;
  int? warrantRate;
  int? adjustment;
  int? qReportAdjustment;
  String? rowVersion;

  QH1(
      {this.id,
      this.amount,
      this.byExcessDeduction,
      this.paid,
      this.discount,
      this.warrant,
      this.warrantMethod,
      this.startDate,
      this.endDate,
      this.isCompleted,
      this.balanceHistoryId,
      this.assessmentBalanceHistory,
      this.warrantBy,
      this.discountRate,
      this.warrantRate,
      this.adjustment,
      this.qReportAdjustment,
      this.rowVersion});

  QH1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    byExcessDeduction = json['byExcessDeduction'];
    paid = json['paid'];
    discount = json['discount'];
    warrant = json['warrant'];
    warrantMethod = json['warrantMethod'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    isCompleted = json['isCompleted'];
    balanceHistoryId = json['balanceHistoryId'];
    assessmentBalanceHistory = json['assessmentBalanceHistory'];
    warrantBy = json['warrantBy'];
    discountRate = json['discountRate'];
    warrantRate = json['warrantRate'];
    adjustment = json['adjustment'];
    qReportAdjustment = json['qReportAdjustment'];
    rowVersion = json['rowVersion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['byExcessDeduction'] = this.byExcessDeduction;
    data['paid'] = this.paid;
    data['discount'] = this.discount;
    data['warrant'] = this.warrant;
    data['warrantMethod'] = this.warrantMethod;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['isCompleted'] = this.isCompleted;
    data['balanceHistoryId'] = this.balanceHistoryId;
    data['assessmentBalanceHistory'] = this.assessmentBalanceHistory;
    data['warrantBy'] = this.warrantBy;
    data['discountRate'] = this.discountRate;
    data['warrantRate'] = this.warrantRate;
    data['adjustment'] = this.adjustment;
    data['qReportAdjustment'] = this.qReportAdjustment;
    data['rowVersion'] = this.rowVersion;
    return data;
  }
}

class Transactions {
  int? id;
  String? dateTime;
  String? sessionDate;
  int? type;
  int? lyArrears;
  int? lyWarrant;
  int? tyArrears;
  int? tyWarrant;
  int? q1;
  int? q2;
  int? q3;
  int? q4;
  int? runningOverPay;
  int? discountRate;
  int? runningDiscount;
  int? runningTotal;
  int? assessmentId;
  String? assessment;

  Transactions(
      {this.id,
      this.dateTime,
      this.sessionDate,
      this.type,
      this.lyArrears,
      this.lyWarrant,
      this.tyArrears,
      this.tyWarrant,
      this.q1,
      this.q2,
      this.q3,
      this.q4,
      this.runningOverPay,
      this.discountRate,
      this.runningDiscount,
      this.runningTotal,
      this.assessmentId,
      this.assessment});

  Transactions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateTime = json['dateTime'];
    sessionDate = json['sessionDate'];
    type = json['type'];
    lyArrears = json['lyArrears'];
    lyWarrant = json['lyWarrant'];
    tyArrears = json['tyArrears'];
    tyWarrant = json['tyWarrant'];
    q1 = json['q1'];
    q2 = json['q2'];
    q3 = json['q3'];
    q4 = json['q4'];
    runningOverPay = json['runningOverPay'];
    discountRate = json['discountRate'];
    runningDiscount = json['runningDiscount'];
    runningTotal = json['runningTotal'];
    assessmentId = json['assessmentId'];
    assessment = json['assessment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dateTime'] = this.dateTime;
    data['sessionDate'] = this.sessionDate;
    data['type'] = this.type;
    data['lyArrears'] = this.lyArrears;
    data['lyWarrant'] = this.lyWarrant;
    data['tyArrears'] = this.tyArrears;
    data['tyWarrant'] = this.tyWarrant;
    data['q1'] = this.q1;
    data['q2'] = this.q2;
    data['q3'] = this.q3;
    data['q4'] = this.q4;
    data['runningOverPay'] = this.runningOverPay;
    data['discountRate'] = this.discountRate;
    data['runningDiscount'] = this.runningDiscount;
    data['runningTotal'] = this.runningTotal;
    data['assessmentId'] = this.assessmentId;
    data['assessment'] = this.assessment;
    return data;
  }
}

class AssessmentAuditLogs {
  int? id;
  int? assessmentId;
  String? assessment;
  int? action;
  String? timestamp;
  int? actionBy;
  int? entityType;

  AssessmentAuditLogs(
      {this.id,
      this.assessmentId,
      this.assessment,
      this.action,
      this.timestamp,
      this.actionBy,
      this.entityType});

  AssessmentAuditLogs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assessmentId = json['assessmentId'];
    assessment = json['assessment'];
    action = json['action'];
    timestamp = json['timestamp'];
    actionBy = json['actionBy'];
    entityType = json['entityType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['assessmentId'] = this.assessmentId;
    data['assessment'] = this.assessment;
    data['action'] = this.action;
    data['timestamp'] = this.timestamp;
    data['actionBy'] = this.actionBy;
    data['entityType'] = this.entityType;
    return data;
  }
}

class AssessmentPropertyTypeLogs {
  int? id;
  int? propertyTypeId;
  String? comment;
  AssessmentPropertyType? propertyType;
  int? actionBy;
  String? actionNote;
  String? activatedDate;
  int? assessmentId;
  String? assessment;
  int? activationYear;
  int? activationQuarter;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? createdBy;
  int? updatedBy;

  AssessmentPropertyTypeLogs(
      {this.id,
      this.propertyTypeId,
      this.comment,
      this.propertyType,
      this.actionBy,
      this.actionNote,
      this.activatedDate,
      this.assessmentId,
      this.assessment,
      this.activationYear,
      this.activationQuarter,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy});

  AssessmentPropertyTypeLogs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyTypeId = json['propertyTypeId'];
    comment = json['comment'];
    propertyType = json['propertyType'] != null
        ? new AssessmentPropertyType.fromJson(json['propertyType'])
        : null;
    actionBy = json['actionBy'];
    actionNote = json['actionNote'];
    activatedDate = json['activatedDate'];
    assessmentId = json['assessmentId'];
    assessment = json['assessment'];
    activationYear = json['activationYear'];
    activationQuarter = json['activationQuarter'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['propertyTypeId'] = this.propertyTypeId;
    data['comment'] = this.comment;
    if (this.propertyType != null) {
      data['propertyType'] = this.propertyType!.toJson();
    }
    data['actionBy'] = this.actionBy;
    data['actionNote'] = this.actionNote;
    data['activatedDate'] = this.activatedDate;
    data['assessmentId'] = this.assessmentId;
    data['assessment'] = this.assessment;
    data['activationYear'] = this.activationYear;
    data['activationQuarter'] = this.activationQuarter;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}

class AssessmentDescriptionLogs {
  int? id;
  int? descriptionId;
  String? comment;
  Description? description;
  int? actionBy;
  String? actionNote;
  String? activatedDate;
  int? assessmentId;
  String? assessment;
  int? activationYear;
  int? activationQuarter;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? createdBy;
  int? updatedBy;

  AssessmentDescriptionLogs(
      {this.id,
      this.descriptionId,
      this.comment,
      this.description,
      this.actionBy,
      this.actionNote,
      this.activatedDate,
      this.assessmentId,
      this.assessment,
      this.activationYear,
      this.activationQuarter,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy});

  AssessmentDescriptionLogs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descriptionId = json['descriptionId'];
    comment = json['comment'];
    description = json['description'] != null
        ? new Description.fromJson(json['description'])
        : null;
    actionBy = json['actionBy'];
    actionNote = json['actionNote'];
    activatedDate = json['activatedDate'];
    assessmentId = json['assessmentId'];
    assessment = json['assessment'];
    activationYear = json['activationYear'];
    activationQuarter = json['activationQuarter'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descriptionId'] = this.descriptionId;
    data['comment'] = this.comment;
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    data['actionBy'] = this.actionBy;
    data['actionNote'] = this.actionNote;
    data['activatedDate'] = this.activatedDate;
    data['assessmentId'] = this.assessmentId;
    data['assessment'] = this.assessment;
    data['activationYear'] = this.activationYear;
    data['activationQuarter'] = this.activationQuarter;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}

class AssessmentDocuments {
  int? id;
  String? docType;
  String? uri;
  String? file;
  int? assessmentId;
  String? assessment;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? createdBy;
  int? updatedBy;

  AssessmentDocuments(
      {this.id,
      this.docType,
      this.uri,
      this.file,
      this.assessmentId,
      this.assessment,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy});

  AssessmentDocuments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    docType = json['docType'];
    uri = json['uri'];
    file = json['file'];
    assessmentId = json['assessmentId'];
    assessment = json['assessment'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['docType'] = this.docType;
    data['uri'] = this.uri;
    data['file'] = this.file;
    data['assessmentId'] = this.assessmentId;
    data['assessment'] = this.assessment;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}

class AssessmentJournals {
  int? id;
  int? assessmentId;
  String? assessment;
  int? oldAllocation;
  int? newAllocation;
  int? oldExcessPayment;
  int? newExcessPayment;
  int? oldLYArrears;
  int? newLYArrears;
  int? oldLYWarrant;
  int? newLYWarrant;
  int? oldTYArrears;
  int? newTYArrears;
  int? newTYWarrant;
  int? oldTYWarrant;
  String? changingProperties;
  int? draftApproveReject;
  int? oldPropertyTypeId;
  int? newPropertyTypeId;
  String? requestDate;
  int? requestBy;
  String? requestNote;
  String? actionDate;
  int? actionBy;
  String? actionNote;
  int? q1Adjustment;
  int? q2Adjustment;
  int? q3Adjustment;
  int? q4Adjustment;

  AssessmentJournals(
      {this.id,
      this.assessmentId,
      this.assessment,
      this.oldAllocation,
      this.newAllocation,
      this.oldExcessPayment,
      this.newExcessPayment,
      this.oldLYArrears,
      this.newLYArrears,
      this.oldLYWarrant,
      this.newLYWarrant,
      this.oldTYArrears,
      this.newTYArrears,
      this.newTYWarrant,
      this.oldTYWarrant,
      this.changingProperties,
      this.draftApproveReject,
      this.oldPropertyTypeId,
      this.newPropertyTypeId,
      this.requestDate,
      this.requestBy,
      this.requestNote,
      this.actionDate,
      this.actionBy,
      this.actionNote,
      this.q1Adjustment,
      this.q2Adjustment,
      this.q3Adjustment,
      this.q4Adjustment});

  AssessmentJournals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assessmentId = json['assessmentId'];
    assessment = json['assessment'];
    oldAllocation = json['oldAllocation'];
    newAllocation = json['newAllocation'];
    oldExcessPayment = json['oldExcessPayment'];
    newExcessPayment = json['newExcessPayment'];
    oldLYArrears = json['oldLYArrears'];
    newLYArrears = json['newLYArrears'];
    oldLYWarrant = json['oldLYWarrant'];
    newLYWarrant = json['newLYWarrant'];
    oldTYArrears = json['oldTYArrears'];
    newTYArrears = json['newTYArrears'];
    newTYWarrant = json['newTYWarrant'];
    oldTYWarrant = json['oldTYWarrant'];
    changingProperties = json['changingProperties'];
    draftApproveReject = json['draftApproveReject'];
    oldPropertyTypeId = json['oldPropertyTypeId'];
    newPropertyTypeId = json['newPropertyTypeId'];
    requestDate = json['requestDate'];
    requestBy = json['requestBy'];
    requestNote = json['requestNote'];
    actionDate = json['actionDate'];
    actionBy = json['actionBy'];
    actionNote = json['actionNote'];
    q1Adjustment = json['q1Adjustment'];
    q2Adjustment = json['q2Adjustment'];
    q3Adjustment = json['q3Adjustment'];
    q4Adjustment = json['q4Adjustment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['assessmentId'] = this.assessmentId;
    data['assessment'] = this.assessment;
    data['oldAllocation'] = this.oldAllocation;
    data['newAllocation'] = this.newAllocation;
    data['oldExcessPayment'] = this.oldExcessPayment;
    data['newExcessPayment'] = this.newExcessPayment;
    data['oldLYArrears'] = this.oldLYArrears;
    data['newLYArrears'] = this.newLYArrears;
    data['oldLYWarrant'] = this.oldLYWarrant;
    data['newLYWarrant'] = this.newLYWarrant;
    data['oldTYArrears'] = this.oldTYArrears;
    data['newTYArrears'] = this.newTYArrears;
    data['newTYWarrant'] = this.newTYWarrant;
    data['oldTYWarrant'] = this.oldTYWarrant;
    data['changingProperties'] = this.changingProperties;
    data['draftApproveReject'] = this.draftApproveReject;
    data['oldPropertyTypeId'] = this.oldPropertyTypeId;
    data['newPropertyTypeId'] = this.newPropertyTypeId;
    data['requestDate'] = this.requestDate;
    data['requestBy'] = this.requestBy;
    data['requestNote'] = this.requestNote;
    data['actionDate'] = this.actionDate;
    data['actionBy'] = this.actionBy;
    data['actionNote'] = this.actionNote;
    data['q1Adjustment'] = this.q1Adjustment;
    data['q2Adjustment'] = this.q2Adjustment;
    data['q3Adjustment'] = this.q3Adjustment;
    data['q4Adjustment'] = this.q4Adjustment;
    return data;
  }
}

class AssessmentAssetsChange {
  int? id;
  int? assessmentId;
  String? assessment;
  String? oldNumber;
  String? newNumber;
  String? oldName;
  String? newName;
  String? oldAddressLine1;
  String? newAddressLine1;
  String? oldAddressLine2;
  String? newAddressLine2;
  String? changingProperties;
  int? draftApproveReject;
  String? requestDate;
  int? requestBy;
  String? requestNote;
  String? actionDate;
  int? actionBy;
  String? actionNote;

  AssessmentAssetsChange(
      {this.id,
      this.assessmentId,
      this.assessment,
      this.oldNumber,
      this.newNumber,
      this.oldName,
      this.newName,
      this.oldAddressLine1,
      this.newAddressLine1,
      this.oldAddressLine2,
      this.newAddressLine2,
      this.changingProperties,
      this.draftApproveReject,
      this.requestDate,
      this.requestBy,
      this.requestNote,
      this.actionDate,
      this.actionBy,
      this.actionNote});

  AssessmentAssetsChange.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assessmentId = json['assessmentId'];
    assessment = json['assessment'];
    oldNumber = json['oldNumber'];
    newNumber = json['newNumber'];
    oldName = json['oldName'];
    newName = json['newName'];
    oldAddressLine1 = json['oldAddressLine1'];
    newAddressLine1 = json['newAddressLine1'];
    oldAddressLine2 = json['oldAddressLine2'];
    newAddressLine2 = json['newAddressLine2'];
    changingProperties = json['changingProperties'];
    draftApproveReject = json['draftApproveReject'];
    requestDate = json['requestDate'];
    requestBy = json['requestBy'];
    requestNote = json['requestNote'];
    actionDate = json['actionDate'];
    actionBy = json['actionBy'];
    actionNote = json['actionNote'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['assessmentId'] = this.assessmentId;
    data['assessment'] = this.assessment;
    data['oldNumber'] = this.oldNumber;
    data['newNumber'] = this.newNumber;
    data['oldName'] = this.oldName;
    data['newName'] = this.newName;
    data['oldAddressLine1'] = this.oldAddressLine1;
    data['newAddressLine1'] = this.newAddressLine1;
    data['oldAddressLine2'] = this.oldAddressLine2;
    data['newAddressLine2'] = this.newAddressLine2;
    data['changingProperties'] = this.changingProperties;
    data['draftApproveReject'] = this.draftApproveReject;
    data['requestDate'] = this.requestDate;
    data['requestBy'] = this.requestBy;
    data['requestNote'] = this.requestNote;
    data['actionDate'] = this.actionDate;
    data['actionBy'] = this.actionBy;
    data['actionNote'] = this.actionNote;
    return data;
  }
}

class AssessmentQuarterReport {
  int? id;
  String? dateTime;
  int? year;
  int? quarterNo;
  int? annualAmount;
  int? qAmount;
  int? qWarrant;
  int? qDiscount;
  int? m1Paid;
  int? m2Paid;
  int? m3Paid;
  int? lyArrears;
  int? lyWarrant;
  int? tyArrears;
  int? tyWarrant;
  int? runningBalance;
  int? adjustment;
  int? assessmentId;
  String? assessment;
  int? useTransactionsType;
  List<AssessmentQuarterReportLogs>? assessmentQuarterReportLogs;
  String? createdAt;
  String? updatedAt;
  int? createdBy;
  int? updatedBy;
  String? rowVersion;

  AssessmentQuarterReport(
      {this.id,
      this.dateTime,
      this.year,
      this.quarterNo,
      this.annualAmount,
      this.qAmount,
      this.qWarrant,
      this.qDiscount,
      this.m1Paid,
      this.m2Paid,
      this.m3Paid,
      this.lyArrears,
      this.lyWarrant,
      this.tyArrears,
      this.tyWarrant,
      this.runningBalance,
      this.adjustment,
      this.assessmentId,
      this.assessment,
      this.useTransactionsType,
      this.assessmentQuarterReportLogs,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy,
      this.rowVersion});

  AssessmentQuarterReport.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateTime = json['dateTime'];
    year = json['year'];
    quarterNo = json['quarterNo'];
    annualAmount = json['annualAmount'];
    qAmount = json['qAmount'];
    qWarrant = json['qWarrant'];
    qDiscount = json['qDiscount'];
    m1Paid = json['m1Paid'];
    m2Paid = json['m2Paid'];
    m3Paid = json['m3Paid'];
    lyArrears = json['lyArrears'];
    lyWarrant = json['lyWarrant'];
    tyArrears = json['tyArrears'];
    tyWarrant = json['tyWarrant'];
    runningBalance = json['runningBalance'];
    adjustment = json['adjustment'];
    assessmentId = json['assessmentId'];
    assessment = json['assessment'];
    useTransactionsType = json['useTransactionsType'];
    if (json['assessmentQuarterReportLogs'] != null) {
      assessmentQuarterReportLogs = <AssessmentQuarterReportLogs>[];
      json['assessmentQuarterReportLogs'].forEach((v) {
        assessmentQuarterReportLogs!
            .add(new AssessmentQuarterReportLogs.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    rowVersion = json['rowVersion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dateTime'] = this.dateTime;
    data['year'] = this.year;
    data['quarterNo'] = this.quarterNo;
    data['annualAmount'] = this.annualAmount;
    data['qAmount'] = this.qAmount;
    data['qWarrant'] = this.qWarrant;
    data['qDiscount'] = this.qDiscount;
    data['m1Paid'] = this.m1Paid;
    data['m2Paid'] = this.m2Paid;
    data['m3Paid'] = this.m3Paid;
    data['lyArrears'] = this.lyArrears;
    data['lyWarrant'] = this.lyWarrant;
    data['tyArrears'] = this.tyArrears;
    data['tyWarrant'] = this.tyWarrant;
    data['runningBalance'] = this.runningBalance;
    data['adjustment'] = this.adjustment;
    data['assessmentId'] = this.assessmentId;
    data['assessment'] = this.assessment;
    data['useTransactionsType'] = this.useTransactionsType;
    if (this.assessmentQuarterReportLogs != null) {
      data['assessmentQuarterReportLogs'] =
          this.assessmentQuarterReportLogs!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['rowVersion'] = this.rowVersion;
    return data;
  }
}

class AssessmentQuarterReportLogs {
  int? id;
  String? dateTime;
  int? year;
  int? quarterNo;
  int? annualAmount;
  int? qAmount;
  int? qWarrant;
  int? qDiscount;
  int? m1Paid;
  int? m2Paid;
  int? m3Paid;
  int? lyArrears;
  int? lyWarrant;
  int? tyArrears;
  int? tyWarrant;
  int? runningBalance;
  int? assessmentId;
  String? assessmentQuarterReport;
  int? useTransactionsType;
  String? sessionDate;
  String? createdAt;
  String? updatedAt;
  int? createdBy;
  int? updatedBy;
  String? rowVersion;

  AssessmentQuarterReportLogs(
      {this.id,
      this.dateTime,
      this.year,
      this.quarterNo,
      this.annualAmount,
      this.qAmount,
      this.qWarrant,
      this.qDiscount,
      this.m1Paid,
      this.m2Paid,
      this.m3Paid,
      this.lyArrears,
      this.lyWarrant,
      this.tyArrears,
      this.tyWarrant,
      this.runningBalance,
      this.assessmentId,
      this.assessmentQuarterReport,
      this.useTransactionsType,
      this.sessionDate,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy,
      this.rowVersion});

  AssessmentQuarterReportLogs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateTime = json['dateTime'];
    year = json['year'];
    quarterNo = json['quarterNo'];
    annualAmount = json['annualAmount'];
    qAmount = json['qAmount'];
    qWarrant = json['qWarrant'];
    qDiscount = json['qDiscount'];
    m1Paid = json['m1Paid'];
    m2Paid = json['m2Paid'];
    m3Paid = json['m3Paid'];
    lyArrears = json['lyArrears'];
    lyWarrant = json['lyWarrant'];
    tyArrears = json['tyArrears'];
    tyWarrant = json['tyWarrant'];
    runningBalance = json['runningBalance'];
    assessmentId = json['assessmentId'];
    assessmentQuarterReport = json['assessmentQuarterReport'];
    useTransactionsType = json['useTransactionsType'];
    sessionDate = json['sessionDate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    rowVersion = json['rowVersion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dateTime'] = this.dateTime;
    data['year'] = this.year;
    data['quarterNo'] = this.quarterNo;
    data['annualAmount'] = this.annualAmount;
    data['qAmount'] = this.qAmount;
    data['qWarrant'] = this.qWarrant;
    data['qDiscount'] = this.qDiscount;
    data['m1Paid'] = this.m1Paid;
    data['m2Paid'] = this.m2Paid;
    data['m3Paid'] = this.m3Paid;
    data['lyArrears'] = this.lyArrears;
    data['lyWarrant'] = this.lyWarrant;
    data['tyArrears'] = this.tyArrears;
    data['tyWarrant'] = this.tyWarrant;
    data['runningBalance'] = this.runningBalance;
    data['assessmentId'] = this.assessmentId;
    data['assessmentQuarterReport'] = this.assessmentQuarterReport;
    data['useTransactionsType'] = this.useTransactionsType;
    data['sessionDate'] = this.sessionDate;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['rowVersion'] = this.rowVersion;
    return data;
  }
}

class AssessmentBillAdjustments {
  int? id;
  int? assessmentId;
  int? mixOrderId;
  String? requestDate;
  int? requestBy;
  String? requestNote;
  int? draftApproveRejectWithdraw;
  String? actionDate;
  int? actionBy;
  String? actionNote;
  String? assessment;

  AssessmentBillAdjustments(
      {this.id,
      this.assessmentId,
      this.mixOrderId,
      this.requestDate,
      this.requestBy,
      this.requestNote,
      this.draftApproveRejectWithdraw,
      this.actionDate,
      this.actionBy,
      this.actionNote,
      this.assessment});

  AssessmentBillAdjustments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assessmentId = json['assessmentId'];
    mixOrderId = json['mixOrderId'];
    requestDate = json['requestDate'];
    requestBy = json['requestBy'];
    requestNote = json['requestNote'];
    draftApproveRejectWithdraw = json['draftApproveRejectWithdraw'];
    actionDate = json['actionDate'];
    actionBy = json['actionBy'];
    actionNote = json['actionNote'];
    assessment = json['assessment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['assessmentId'] = this.assessmentId;
    data['mixOrderId'] = this.mixOrderId;
    data['requestDate'] = this.requestDate;
    data['requestBy'] = this.requestBy;
    data['requestNote'] = this.requestNote;
    data['draftApproveRejectWithdraw'] = this.draftApproveRejectWithdraw;
    data['actionDate'] = this.actionDate;
    data['actionBy'] = this.actionBy;
    data['actionNote'] = this.actionNote;
    data['assessment'] = this.assessment;
    return data;
  }
}

class AmalgamationAssessment {
  int? id;
  int? assessmentId;
  int? kFormId;
  String? assessment;

  AmalgamationAssessment(
      {this.id, this.assessmentId, this.kFormId, this.assessment});

  AmalgamationAssessment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assessmentId = json['assessmentId'];
    kFormId = json['kFormId'];
    assessment = json['assessment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['assessmentId'] = this.assessmentId;
    data['kFormId'] = this.kFormId;
    data['assessment'] = this.assessment;
    return data;
  }
}

class AssessmentATDs {
  int? id;
  int? assessmentId;
  String? assessment;
  int? atdRequestStatus;
  String? requestDate;
  int? requestBy;
  String? requestNote;
  String? actionDate;
  int? actionBy;
  String? actionNote;
  int? officeId;
  int? sabhaId;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? createdBy;
  int? updatedBy;
  List<AssessmentATDOwnerslogs>? assessmentATDOwnerslogs;

  AssessmentATDs(
      {this.id,
      this.assessmentId,
      this.assessment,
      this.atdRequestStatus,
      this.requestDate,
      this.requestBy,
      this.requestNote,
      this.actionDate,
      this.actionBy,
      this.actionNote,
      this.officeId,
      this.sabhaId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy,
      this.assessmentATDOwnerslogs});

  AssessmentATDs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assessmentId = json['assessmentId'];
    assessment = json['assessment'];
    atdRequestStatus = json['atdRequestStatus'];
    requestDate = json['requestDate'];
    requestBy = json['requestBy'];
    requestNote = json['requestNote'];
    actionDate = json['actionDate'];
    actionBy = json['actionBy'];
    actionNote = json['actionNote'];
    officeId = json['officeId'];
    sabhaId = json['sabhaId'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    if (json['assessmentATDOwnerslogs'] != null) {
      assessmentATDOwnerslogs = <AssessmentATDOwnerslogs>[];
      json['assessmentATDOwnerslogs'].forEach((v) {
        assessmentATDOwnerslogs!.add(new AssessmentATDOwnerslogs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['assessmentId'] = this.assessmentId;
    data['assessment'] = this.assessment;
    data['atdRequestStatus'] = this.atdRequestStatus;
    data['requestDate'] = this.requestDate;
    data['requestBy'] = this.requestBy;
    data['requestNote'] = this.requestNote;
    data['actionDate'] = this.actionDate;
    data['actionBy'] = this.actionBy;
    data['actionNote'] = this.actionNote;
    data['officeId'] = this.officeId;
    data['sabhaId'] = this.sabhaId;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    if (this.assessmentATDOwnerslogs != null) {
      data['assessmentATDOwnerslogs'] =
          this.assessmentATDOwnerslogs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AssessmentATDOwnerslogs {
  int? id;
  int? assessmentATDId;
  int? partnerId;
  String? ownerNIC;
  String? ownerName;
  String? addressLine1;
  String? addressLine2;
  int? ownerType;
  int? ownerStatus;
  String? assessmentATD;

  AssessmentATDOwnerslogs(
      {this.id,
      this.assessmentATDId,
      this.partnerId,
      this.ownerNIC,
      this.ownerName,
      this.addressLine1,
      this.addressLine2,
      this.ownerType,
      this.ownerStatus,
      this.assessmentATD});

  AssessmentATDOwnerslogs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assessmentATDId = json['assessmentATDId'];
    partnerId = json['partnerId'];
    ownerNIC = json['ownerNIC'];
    ownerName = json['ownerName'];
    addressLine1 = json['addressLine1'];
    addressLine2 = json['addressLine2'];
    ownerType = json['ownerType'];
    ownerStatus = json['ownerStatus'];
    assessmentATD = json['assessmentATD'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['assessmentATDId'] = this.assessmentATDId;
    data['partnerId'] = this.partnerId;
    data['ownerNIC'] = this.ownerNIC;
    data['ownerName'] = this.ownerName;
    data['addressLine1'] = this.addressLine1;
    data['addressLine2'] = this.addressLine2;
    data['ownerType'] = this.ownerType;
    data['ownerStatus'] = this.ownerStatus;
    data['assessmentATD'] = this.assessmentATD;
    return data;
  }
}

class Office {
  int? id;
  int? sabhaID;
  String? nameSinhala;
  String? nameEnglish;
  String? nameTamil;
  int? officeTypeID;
  int? status;
  String? code;
  String? createdDate;
  Sabha? sabha;
  OfficeType? officeType;
  int? latitude;
  int? longitude;
  String? createdAt;
  String? updatedAt;

  Office(
      {this.id,
      this.sabhaID,
      this.nameSinhala,
      this.nameEnglish,
      this.nameTamil,
      this.officeTypeID,
      this.status,
      this.code,
      this.createdDate,
      this.sabha,
      this.officeType,
      this.latitude,
      this.longitude,
      this.createdAt,
      this.updatedAt});

  Office.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sabhaID = json['sabhaID'];
    nameSinhala = json['nameSinhala'];
    nameEnglish = json['nameEnglish'];
    nameTamil = json['nameTamil'];
    officeTypeID = json['officeTypeID'];
    status = json['status'];
    code = json['code'];
    createdDate = json['createdDate'];
    sabha = json['sabha'] != null ? new Sabha.fromJson(json['sabha']) : null;
    officeType = json['officeType'] != null
        ? new OfficeType.fromJson(json['officeType'])
        : null;
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sabhaID'] = this.sabhaID;
    data['nameSinhala'] = this.nameSinhala;
    data['nameEnglish'] = this.nameEnglish;
    data['nameTamil'] = this.nameTamil;
    data['officeTypeID'] = this.officeTypeID;
    data['status'] = this.status;
    data['code'] = this.code;
    data['createdDate'] = this.createdDate;
    if (this.sabha != null) {
      data['sabha'] = this.sabha!.toJson();
    }
    if (this.officeType != null) {
      data['officeType'] = this.officeType!.toJson();
    }
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Sabha {
  int? id;
  int? districtID;
  String? nameSinhala;
  String? nameEnglish;
  String? nameTamil;
  String? code;
  String? logoPath;
  int? status;
  String? createdDate;
  String? telephone1;
  String? telephone2;
  String? addressSinhala;
  String? addressEnglish;
  String? addressTamil;
  int? accountSystemVersionId;
  int? isFinalAccountsEnabled;
  int? chartOfAccountVersionId;
  int? sabhaType;
  int? latitude;
  int? longitude;
  District? district;
  List<String>? office;
  String? secretarySignPath;
  String? chairmanSignPath;
  String? createdAt;
  String? updatedAt;

  Sabha(
      {this.id,
      this.districtID,
      this.nameSinhala,
      this.nameEnglish,
      this.nameTamil,
      this.code,
      this.logoPath,
      this.status,
      this.createdDate,
      this.telephone1,
      this.telephone2,
      this.addressSinhala,
      this.addressEnglish,
      this.addressTamil,
      this.accountSystemVersionId,
      this.isFinalAccountsEnabled,
      this.chartOfAccountVersionId,
      this.sabhaType,
      this.latitude,
      this.longitude,
      this.district,
      this.office,
      this.secretarySignPath,
      this.chairmanSignPath,
      this.createdAt,
      this.updatedAt});

  Sabha.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    districtID = json['districtID'];
    nameSinhala = json['nameSinhala'];
    nameEnglish = json['nameEnglish'];
    nameTamil = json['nameTamil'];
    code = json['code'];
    logoPath = json['logoPath'];
    status = json['status'];
    createdDate = json['createdDate'];
    telephone1 = json['telephone1'];
    telephone2 = json['telephone2'];
    addressSinhala = json['addressSinhala'];
    addressEnglish = json['addressEnglish'];
    addressTamil = json['addressTamil'];
    accountSystemVersionId = json['accountSystemVersionId'];
    isFinalAccountsEnabled = json['isFinalAccountsEnabled'];
    chartOfAccountVersionId = json['chartOfAccountVersionId'];
    sabhaType = json['sabhaType'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    district = json['district'] != null
        ? new District.fromJson(json['district'])
        : null;
    office = json['office'].cast<String>();
    secretarySignPath = json['secretarySignPath'];
    chairmanSignPath = json['chairmanSignPath'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['districtID'] = this.districtID;
    data['nameSinhala'] = this.nameSinhala;
    data['nameEnglish'] = this.nameEnglish;
    data['nameTamil'] = this.nameTamil;
    data['code'] = this.code;
    data['logoPath'] = this.logoPath;
    data['status'] = this.status;
    data['createdDate'] = this.createdDate;
    data['telephone1'] = this.telephone1;
    data['telephone2'] = this.telephone2;
    data['addressSinhala'] = this.addressSinhala;
    data['addressEnglish'] = this.addressEnglish;
    data['addressTamil'] = this.addressTamil;
    data['accountSystemVersionId'] = this.accountSystemVersionId;
    data['isFinalAccountsEnabled'] = this.isFinalAccountsEnabled;
    data['chartOfAccountVersionId'] = this.chartOfAccountVersionId;
    data['sabhaType'] = this.sabhaType;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    if (this.district != null) {
      data['district'] = this.district!.toJson();
    }
    data['office'] = this.office;
    data['secretarySignPath'] = this.secretarySignPath;
    data['chairmanSignPath'] = this.chairmanSignPath;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class District {
  int? id;
  int? provinceID;
  String? nameSinhala;
  String? nameEnglish;
  String? nameTamil;
  int? status;
  String? createdAt;
  String? updatedAt;
  Province? province;
  List<String>? sabha;

  District(
      {this.id,
      this.provinceID,
      this.nameSinhala,
      this.nameEnglish,
      this.nameTamil,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.province,
      this.sabha});

  District.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    provinceID = json['provinceID'];
    nameSinhala = json['nameSinhala'];
    nameEnglish = json['nameEnglish'];
    nameTamil = json['nameTamil'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    province = json['province'] != null
        ? new Province.fromJson(json['province'])
        : null;
    sabha = json['sabha'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['provinceID'] = this.provinceID;
    data['nameSinhala'] = this.nameSinhala;
    data['nameEnglish'] = this.nameEnglish;
    data['nameTamil'] = this.nameTamil;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.province != null) {
      data['province'] = this.province!.toJson();
    }
    data['sabha'] = this.sabha;
    return data;
  }
}

class Province {
  int? id;
  String? nameSinhala;
  String? nameEnglish;
  String? nameTamil;
  int? status;
  List<String>? district;

  Province(
      {this.id,
      this.nameSinhala,
      this.nameEnglish,
      this.nameTamil,
      this.status,
      this.district});

  Province.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameSinhala = json['nameSinhala'];
    nameEnglish = json['nameEnglish'];
    nameTamil = json['nameTamil'];
    status = json['status'];
    district = json['district'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameSinhala'] = this.nameSinhala;
    data['nameEnglish'] = this.nameEnglish;
    data['nameTamil'] = this.nameTamil;
    data['status'] = this.status;
    data['district'] = this.district;
    return data;
  }
}

class OfficeType {
  int? id;
  String? description;
  int? status;
  List<String>? office;

  OfficeType({this.id, this.description, this.status, this.office});

  OfficeType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    status = json['status'];
    office = json['office'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['status'] = this.status;
    data['office'] = this.office;
    return data;
  }
}

class MixinCancelOrder {
  int? id;
  String? reason;
  String? createdAt;
  String? updatedAt;
  int? createdBy;
  int? sessionId;
  int? mixinOrderId;
  int? approvedBy;
  String? approvalComment;

  MixinCancelOrder(
      {this.id,
      this.reason,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.sessionId,
      this.mixinOrderId,
      this.approvedBy,
      this.approvalComment});

  MixinCancelOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reason = json['reason'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    createdBy = json['createdBy'];
    sessionId = json['sessionId'];
    mixinOrderId = json['mixinOrderId'];
    approvedBy = json['approvedBy'];
    approvalComment = json['approvalComment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['reason'] = this.reason;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['createdBy'] = this.createdBy;
    data['sessionId'] = this.sessionId;
    data['mixinOrderId'] = this.mixinOrderId;
    data['approvedBy'] = this.approvedBy;
    data['approvalComment'] = this.approvalComment;
    return data;
  }
}

class AccountDetail {
  int? id;
  String? accountNo;
  String? nameSinhala;
  String? nameEnglish;
  String? nameTamil;
  int? bankID;
  int? voteId;
  int? status;
  int? officeID;
  String? bankCode;
  String? branchCode;
  List<AccountBalDetail>? accountBalDetail;
  double? runningBalance;
  double? expenseHold;
  double? accountBalance;
  BankDetail? bankDetail;
  VoteDetail? voteDetail;

  AccountDetail(
      {this.id,
      this.accountNo,
      this.nameSinhala,
      this.nameEnglish,
      this.nameTamil,
      this.bankID,
      this.voteId,
      this.status,
      this.officeID,
      this.bankCode,
      this.branchCode,
      this.accountBalDetail,
      this.runningBalance,
      this.expenseHold,
      this.accountBalance,
      this.bankDetail,
      this.voteDetail});

  AccountDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accountNo = json['accountNo'];
    nameSinhala = json['nameSinhala'];
    nameEnglish = json['nameEnglish'];
    nameTamil = json['nameTamil'];
    bankID = json['bankID'];
    voteId = json['voteId'];
    status = json['status'];
    officeID = json['officeID'];
    bankCode = json['bankCode'];
    branchCode = json['branchCode'];
    if (json['accountBalDetail'] != null) {
      accountBalDetail = <AccountBalDetail>[];
      json['accountBalDetail'].forEach((v) {
        accountBalDetail!.add(new AccountBalDetail.fromJson(v));
      });
    }
    runningBalance = json['runningBalance'];
    expenseHold = json['expenseHold'];
    accountBalance = json['accountBalance'];
    bankDetail = json['bankDetail'] != null
        ? new BankDetail.fromJson(json['bankDetail'])
        : null;
    voteDetail = json['voteDetail'] != null
        ? new VoteDetail.fromJson(json['voteDetail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['accountNo'] = this.accountNo;
    data['nameSinhala'] = this.nameSinhala;
    data['nameEnglish'] = this.nameEnglish;
    data['nameTamil'] = this.nameTamil;
    data['bankID'] = this.bankID;
    data['voteId'] = this.voteId;
    data['status'] = this.status;
    data['officeID'] = this.officeID;
    data['bankCode'] = this.bankCode;
    data['branchCode'] = this.branchCode;
    if (this.accountBalDetail != null) {
      data['accountBalDetail'] =
          this.accountBalDetail!.map((v) => v.toJson()).toList();
    }
    data['runningBalance'] = this.runningBalance;
    data['expenseHold'] = this.expenseHold;
    data['accountBalance'] = this.accountBalance;
    if (this.bankDetail != null) {
      data['bankDetail'] = this.bankDetail!.toJson();
    }
    if (this.voteDetail != null) {
      data['voteDetail'] = this.voteDetail!.toJson();
    }
    return data;
  }
}

class AccountBalDetail {
  int? id;
  int? accountDetailID;
  int? year;
  int? balanceAmount;
  String? enteredDate;
  int? status;
  int? sabhaID;

  AccountBalDetail(
      {this.id,
      this.accountDetailID,
      this.year,
      this.balanceAmount,
      this.enteredDate,
      this.status,
      this.sabhaID});

  AccountBalDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accountDetailID = json['accountDetailID'];
    year = json['year'];
    balanceAmount = json['balanceAmount'];
    enteredDate = json['enteredDate'];
    status = json['status'];
    sabhaID = json['sabhaID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['accountDetailID'] = this.accountDetailID;
    data['year'] = this.year;
    data['balanceAmount'] = this.balanceAmount;
    data['enteredDate'] = this.enteredDate;
    data['status'] = this.status;
    data['sabhaID'] = this.sabhaID;
    return data;
  }
}

class BankDetail {
  int? id;
  String? description;
  int? bankCode;
  int? status;
  List<BankBranch>? bankBranch;

  BankDetail(
      {this.id, this.description, this.bankCode, this.status, this.bankBranch});

  BankDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    bankCode = json['bankCode'];
    status = json['status'];
    if (json['bankBranch'] != null) {
      bankBranch = <BankBranch>[];
      json['bankBranch'].forEach((v) {
        bankBranch!.add(new BankBranch.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['bankCode'] = this.bankCode;
    data['status'] = this.status;
    if (this.bankBranch != null) {
      data['bankBranch'] = this.bankBranch!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BankBranch {
  int? id;
  int? bankCode;
  String? branchName;
  String? branchCode;
  String? branchAddress;
  String? telNo1;
  String? telNo2;
  String? telNo3;
  String? telNo4;
  String? faxNo;
  String? district;
  int? status;
  String? createdAt;
  String? updatedAt;
  Bank? bank;
  List<Agents>? agents;

  BankBranch(
      {this.id,
      this.bankCode,
      this.branchName,
      this.branchCode,
      this.branchAddress,
      this.telNo1,
      this.telNo2,
      this.telNo3,
      this.telNo4,
      this.faxNo,
      this.district,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.bank,
      this.agents});

  BankBranch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankCode = json['bankCode'];
    branchName = json['branchName'];
    branchCode = json['branchCode'];
    branchAddress = json['branchAddress'];
    telNo1 = json['telNo1'];
    telNo2 = json['telNo2'];
    telNo3 = json['telNo3'];
    telNo4 = json['telNo4'];
    faxNo = json['faxNo'];
    district = json['district'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    bank = json['bank'] != null ? new Bank.fromJson(json['bank']) : null;
    if (json['agents'] != null) {
      agents = <Agents>[];
      json['agents'].forEach((v) {
        agents!.add(new Agents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bankCode'] = this.bankCode;
    data['branchName'] = this.branchName;
    data['branchCode'] = this.branchCode;
    data['branchAddress'] = this.branchAddress;
    data['telNo1'] = this.telNo1;
    data['telNo2'] = this.telNo2;
    data['telNo3'] = this.telNo3;
    data['telNo4'] = this.telNo4;
    data['faxNo'] = this.faxNo;
    data['district'] = this.district;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.bank != null) {
      data['bank'] = this.bank!.toJson();
    }
    if (this.agents != null) {
      data['agents'] = this.agents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bank {
  int? id;
  String? description;
  int? bankCode;
  int? status;
  String? createdAt;
  String? updatedAt;
  List<String>? bankBranch;

  Bank(
      {this.id,
      this.description,
      this.bankCode,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.bankBranch});

  Bank.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    bankCode = json['bankCode'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    bankBranch = json['bankBranch'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['bankCode'] = this.bankCode;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['bankBranch'] = this.bankBranch;
    return data;
  }
}

class Agents {
  String? bankBranch;
  String? rowVersion;

  Agents({this.bankBranch, this.rowVersion});

  Agents.fromJson(Map<String, dynamic> json) {
    bankBranch = json['bankBranch'];
    rowVersion = json['rowVersion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bankBranch'] = this.bankBranch;
    data['rowVersion'] = this.rowVersion;
    return data;
  }
}

class VoteDetail {
  int? id;
  String? code;
  String? nameSinhala;
  String? nameEnglish;
  String? nameTamil;
  int? voteOrder;
  int? programmeID;
  String? programmeNameSinhala;
  String? programmeNameEnglish;
  String? programmeNameTamil;
  String? programmeCode;
  int? projectID;
  String? projectNameSinhala;
  String? projectNameEnglish;
  String? projectNameTamil;
  String? projectCode;
  int? subprojectID;
  String? subprojectNameSinhala;
  String? subprojectNameEnglish;
  String? subprojectNameTamil;
  String? subprojectCode;
  int? classificationID;
  String? classsificationDescription;
  int? mainLedgerAccountID;
  String? mainLedgerAccountDescription;
  int? incomeTitleID;
  String? incomeTitleNameSinhala;
  String? incomeTitleNameEnglish;
  String? incomeTitleNameTamil;
  String? incomeTitleCode;
  int? incomeSubtitleID;
  String? incomeSubtitleNameSinhala;
  String? incomeSubtitleNameEnglish;
  String? incomeSubtitleNameTamil;
  String? incomeSubtitleCode;
  int? incomeOrExpense;
  int? voteOrBal;
  int? sabhaID;
  String? sabhaCode;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? createdBy;
  int? updatedBy;
  int? voteIncomeAllocationId;

  VoteDetail(
      {this.id,
      this.code,
      this.nameSinhala,
      this.nameEnglish,
      this.nameTamil,
      this.voteOrder,
      this.programmeID,
      this.programmeNameSinhala,
      this.programmeNameEnglish,
      this.programmeNameTamil,
      this.programmeCode,
      this.projectID,
      this.projectNameSinhala,
      this.projectNameEnglish,
      this.projectNameTamil,
      this.projectCode,
      this.subprojectID,
      this.subprojectNameSinhala,
      this.subprojectNameEnglish,
      this.subprojectNameTamil,
      this.subprojectCode,
      this.classificationID,
      this.classsificationDescription,
      this.mainLedgerAccountID,
      this.mainLedgerAccountDescription,
      this.incomeTitleID,
      this.incomeTitleNameSinhala,
      this.incomeTitleNameEnglish,
      this.incomeTitleNameTamil,
      this.incomeTitleCode,
      this.incomeSubtitleID,
      this.incomeSubtitleNameSinhala,
      this.incomeSubtitleNameEnglish,
      this.incomeSubtitleNameTamil,
      this.incomeSubtitleCode,
      this.incomeOrExpense,
      this.voteOrBal,
      this.sabhaID,
      this.sabhaCode,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy,
      this.voteIncomeAllocationId});

  VoteDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    nameSinhala = json['nameSinhala'];
    nameEnglish = json['nameEnglish'];
    nameTamil = json['nameTamil'];
    voteOrder = json['voteOrder'];
    programmeID = json['programmeID'];
    programmeNameSinhala = json['programmeNameSinhala'];
    programmeNameEnglish = json['programmeNameEnglish'];
    programmeNameTamil = json['programmeNameTamil'];
    programmeCode = json['programmeCode'];
    projectID = json['projectID'];
    projectNameSinhala = json['projectNameSinhala'];
    projectNameEnglish = json['projectNameEnglish'];
    projectNameTamil = json['projectNameTamil'];
    projectCode = json['projectCode'];
    subprojectID = json['subprojectID'];
    subprojectNameSinhala = json['subprojectNameSinhala'];
    subprojectNameEnglish = json['subprojectNameEnglish'];
    subprojectNameTamil = json['subprojectNameTamil'];
    subprojectCode = json['subprojectCode'];
    classificationID = json['classificationID'];
    classsificationDescription = json['classsificationDescription'];
    mainLedgerAccountID = json['mainLedgerAccountID'];
    mainLedgerAccountDescription = json['mainLedgerAccountDescription'];
    incomeTitleID = json['incomeTitleID'];
    incomeTitleNameSinhala = json['incomeTitleNameSinhala'];
    incomeTitleNameEnglish = json['incomeTitleNameEnglish'];
    incomeTitleNameTamil = json['incomeTitleNameTamil'];
    incomeTitleCode = json['incomeTitleCode'];
    incomeSubtitleID = json['incomeSubtitleID'];
    incomeSubtitleNameSinhala = json['incomeSubtitleNameSinhala'];
    incomeSubtitleNameEnglish = json['incomeSubtitleNameEnglish'];
    incomeSubtitleNameTamil = json['incomeSubtitleNameTamil'];
    incomeSubtitleCode = json['incomeSubtitleCode'];
    incomeOrExpense = json['incomeOrExpense'];
    voteOrBal = json['voteOrBal'];
    sabhaID = json['sabhaID'];
    sabhaCode = json['sabhaCode'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    voteIncomeAllocationId = json['voteIncomeAllocationId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['nameSinhala'] = this.nameSinhala;
    data['nameEnglish'] = this.nameEnglish;
    data['nameTamil'] = this.nameTamil;
    data['voteOrder'] = this.voteOrder;
    data['programmeID'] = this.programmeID;
    data['programmeNameSinhala'] = this.programmeNameSinhala;
    data['programmeNameEnglish'] = this.programmeNameEnglish;
    data['programmeNameTamil'] = this.programmeNameTamil;
    data['programmeCode'] = this.programmeCode;
    data['projectID'] = this.projectID;
    data['projectNameSinhala'] = this.projectNameSinhala;
    data['projectNameEnglish'] = this.projectNameEnglish;
    data['projectNameTamil'] = this.projectNameTamil;
    data['projectCode'] = this.projectCode;
    data['subprojectID'] = this.subprojectID;
    data['subprojectNameSinhala'] = this.subprojectNameSinhala;
    data['subprojectNameEnglish'] = this.subprojectNameEnglish;
    data['subprojectNameTamil'] = this.subprojectNameTamil;
    data['subprojectCode'] = this.subprojectCode;
    data['classificationID'] = this.classificationID;
    data['classsificationDescription'] = this.classsificationDescription;
    data['mainLedgerAccountID'] = this.mainLedgerAccountID;
    data['mainLedgerAccountDescription'] = this.mainLedgerAccountDescription;
    data['incomeTitleID'] = this.incomeTitleID;
    data['incomeTitleNameSinhala'] = this.incomeTitleNameSinhala;
    data['incomeTitleNameEnglish'] = this.incomeTitleNameEnglish;
    data['incomeTitleNameTamil'] = this.incomeTitleNameTamil;
    data['incomeTitleCode'] = this.incomeTitleCode;
    data['incomeSubtitleID'] = this.incomeSubtitleID;
    data['incomeSubtitleNameSinhala'] = this.incomeSubtitleNameSinhala;
    data['incomeSubtitleNameEnglish'] = this.incomeSubtitleNameEnglish;
    data['incomeSubtitleNameTamil'] = this.incomeSubtitleNameTamil;
    data['incomeSubtitleCode'] = this.incomeSubtitleCode;
    data['incomeOrExpense'] = this.incomeOrExpense;
    data['voteOrBal'] = this.voteOrBal;
    data['sabhaID'] = this.sabhaID;
    data['sabhaCode'] = this.sabhaCode;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['voteIncomeAllocationId'] = this.voteIncomeAllocationId;
    return data;
  }
}

class MixinOrderLine {
  int? id;
  String? customVoteName;
  String? description;
  double? amount;
  dynamic? paymentVatAmount;
  dynamic? paymentNbtAmount;
  dynamic? stampAmount;
  dynamic? totalAmount;
  String? createdAt;
  String? updatedAt;
  VoteAssignmentDetails? voteAssignmentDetails;
  int? mixinVoteAssignmentDetailId;
  int? voteDetailId;
  int? classificationId;
  PaymentVat? paymentVat;
  int? paymentVatId;
  PaymentVat? paymentNbt;
  int? paymentNbtId;
  MixinOrder? mixinOrder;
  int? mixinOrderId;
  int? voteOrBal;
  VoteDetail? voteDetail;

  MixinOrderLine(
      {this.id,
      this.customVoteName,
      this.description,
      this.amount,
      this.paymentVatAmount,
      this.paymentNbtAmount,
      this.stampAmount,
      this.totalAmount,
      this.createdAt,
      this.updatedAt,
      this.voteAssignmentDetails,
      this.mixinVoteAssignmentDetailId,
      this.voteDetailId,
      this.classificationId,
      this.paymentVat,
      this.paymentVatId,
      this.paymentNbt,
      this.paymentNbtId,
      this.mixinOrder,
      this.mixinOrderId,
      this.voteOrBal,
      this.voteDetail});

  MixinOrderLine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customVoteName = json['customVoteName'];
    description = json['description'];
    amount = json['amount'];
    paymentVatAmount = json['paymentVatAmount'];
    paymentNbtAmount = json['paymentNbtAmount'];
    stampAmount = json['stampAmount'];
    totalAmount = json['totalAmount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    voteAssignmentDetails = json['voteAssignmentDetails'] != null
        ? new VoteAssignmentDetails.fromJson(json['voteAssignmentDetails'])
        : null;
    mixinVoteAssignmentDetailId = json['mixinVoteAssignmentDetailId'];
    voteDetailId = json['voteDetailId'];
    classificationId = json['classificationId'];
    paymentVat = json['paymentVat'] != null
        ? new PaymentVat.fromJson(json['paymentVat'])
        : null;
    paymentVatId = json['paymentVatId'];
    paymentNbt = json['paymentNbt'] != null
        ? new PaymentVat.fromJson(json['paymentNbt'])
        : null;
    paymentNbtId = json['paymentNbtId'];
    mixinOrder = json['mixinOrder'] != null
        ? new MixinOrder.fromJson(json['mixinOrder'])
        : null;
    mixinOrderId = json['mixinOrderId'];
    voteOrBal = json['voteOrBal'];
    voteDetail = json['voteDetail'] != null
        ? new VoteDetail.fromJson(json['voteDetail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customVoteName'] = this.customVoteName;
    data['description'] = this.description;
    data['amount'] = this.amount;
    data['paymentVatAmount'] = this.paymentVatAmount;
    data['paymentNbtAmount'] = this.paymentNbtAmount;
    data['stampAmount'] = this.stampAmount;
    data['totalAmount'] = this.totalAmount;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.voteAssignmentDetails != null) {
      data['voteAssignmentDetails'] = this.voteAssignmentDetails!.toJson();
    }
    data['mixinVoteAssignmentDetailId'] = this.mixinVoteAssignmentDetailId;
    data['voteDetailId'] = this.voteDetailId;
    data['classificationId'] = this.classificationId;
    if (this.paymentVat != null) {
      data['paymentVat'] = this.paymentVat!.toJson();
    }
    data['paymentVatId'] = this.paymentVatId;
    if (this.paymentNbt != null) {
      data['paymentNbt'] = this.paymentNbt!.toJson();
    }
    data['paymentNbtId'] = this.paymentNbtId;
    if (this.mixinOrder != null) {
      data['mixinOrder'] = this.mixinOrder!.toJson();
    }
    data['mixinOrderId'] = this.mixinOrderId;
    data['voteOrBal'] = this.voteOrBal;
    if (this.voteDetail != null) {
      data['voteDetail'] = this.voteDetail!.toJson();
    }
    return data;
  }
}

class VoteAssignmentDetails {
  int? id;
  String? customVoteName;
  int? isActive;
  String? dateCreated;
  String? dateModified;
  int? voteAssignmentId;
  String? code;
  int? depth;
  int? parentId;
  bool? isSubLevel;
  int? createdBy;
  int? updatedBy;
  String? rowVersion;
  VoteAssignment? voteAssignment;

  VoteAssignmentDetails(
      {this.id,
      this.customVoteName,
      this.isActive,
      this.dateCreated,
      this.dateModified,
      this.voteAssignmentId,
      this.code,
      this.depth,
      this.parentId,
      this.isSubLevel,
      this.createdBy,
      this.updatedBy,
      this.rowVersion,
      this.voteAssignment});

  VoteAssignmentDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customVoteName = json['customVoteName'];
    isActive = json['isActive'];
    dateCreated = json['dateCreated'];
    dateModified = json['dateModified'];
    voteAssignmentId = json['voteAssignmentId'];
    code = json['code'];
    depth = json['depth'];
    parentId = json['parentId'];
    isSubLevel = json['isSubLevel'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    rowVersion = json['rowVersion'];
    voteAssignment = json['voteAssignment'] != null
        ? new VoteAssignment.fromJson(json['voteAssignment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customVoteName'] = this.customVoteName;
    data['isActive'] = this.isActive;
    data['dateCreated'] = this.dateCreated;
    data['dateModified'] = this.dateModified;
    data['voteAssignmentId'] = this.voteAssignmentId;
    data['code'] = this.code;
    data['depth'] = this.depth;
    data['parentId'] = this.parentId;
    data['isSubLevel'] = this.isSubLevel;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['rowVersion'] = this.rowVersion;
    if (this.voteAssignment != null) {
      data['voteAssignment'] = this.voteAssignment!.toJson();
    }
    return data;
  }
}

class VoteAssignment {
  int? id;
  int? isActive;
  VoteDetail? voteDetail;
  int? voteId;
  Office? office;
  int? officeId;
  AccountDetail? accountDetail;
  int? bankAccountId;
  String? dateCreated;
  String? dateModified;
  int? sabhaId;
  List<String>? voteAssignmentDetails;

  VoteAssignment(
      {this.id,
      this.isActive,
      this.voteDetail,
      this.voteId,
      this.office,
      this.officeId,
      this.accountDetail,
      this.bankAccountId,
      this.dateCreated,
      this.dateModified,
      this.sabhaId,
      this.voteAssignmentDetails});

  VoteAssignment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isActive = json['isActive'];
    voteDetail = json['voteDetail'] != null
        ? new VoteDetail.fromJson(json['voteDetail'])
        : null;
    voteId = json['voteId'];
    office =
        json['office'] != null ? new Office.fromJson(json['office']) : null;
    officeId = json['officeId'];
    accountDetail = json['accountDetail'] != null
        ? new AccountDetail.fromJson(json['accountDetail'])
        : null;
    bankAccountId = json['bankAccountId'];
    dateCreated = json['dateCreated'];
    dateModified = json['dateModified'];
    sabhaId = json['sabhaId'];
    voteAssignmentDetails = json['voteAssignmentDetails'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isActive'] = this.isActive;
    if (this.voteDetail != null) {
      data['voteDetail'] = this.voteDetail!.toJson();
    }
    data['voteId'] = this.voteId;
    if (this.office != null) {
      data['office'] = this.office!.toJson();
    }
    data['officeId'] = this.officeId;
    if (this.accountDetail != null) {
      data['accountDetail'] = this.accountDetail!.toJson();
    }
    data['bankAccountId'] = this.bankAccountId;
    data['dateCreated'] = this.dateCreated;
    data['dateModified'] = this.dateModified;
    data['sabhaId'] = this.sabhaId;
    data['voteAssignmentDetails'] = this.voteAssignmentDetails;
    return data;
  }
}

class VoteBalances {
  int? id;
  int? voteDetailId;
  int? classificationId;
  int? sabhaId;
  int? year;
  int? month;
  String? code;
  String? subCode;
  String? description;
  int? status;
  int? transactionType;
  bool? isCarryForward;
  int? estimatedIncome;
  int? allocationAmount;
  int? allocationExchangeAmount;
  int? takeHoldRate;
  int? takeHoldAmount;
  int? debit;
  int? credit;
  int? totalCommitted;
  int? totalHold;
  int? totalPending;
  int? exchangedAmount;
  int? creditDebitRunningBalance;
  int? runningBalance;
  int? carryForwardDebit;
  int? carryForwardCredit;
  int? creditDebitCarryForwardRunningBalance;
  int? surchargeDebit;
  int? surchargeCredit;
  int? creditDebitSurchargeRunningBalance;
  int? transferFlag;
  List<VoteBalanceLogs>? voteBalanceLogs;
  List<ActionLogs>? actionLogs;
  int? sessionIdByOffice;
  String? createdAt;
  String? updatedAt;
  int? officeId;
  int? createdBy;
  int? updatedBy;
  String? systemActionAt;
  int? customVoteDebit;
  int? customVoteCredit;
  String? rowVersion;

  VoteBalances(
      {this.id,
      this.voteDetailId,
      this.classificationId,
      this.sabhaId,
      this.year,
      this.month,
      this.code,
      this.subCode,
      this.description,
      this.status,
      this.transactionType,
      this.isCarryForward,
      this.estimatedIncome,
      this.allocationAmount,
      this.allocationExchangeAmount,
      this.takeHoldRate,
      this.takeHoldAmount,
      this.debit,
      this.credit,
      this.totalCommitted,
      this.totalHold,
      this.totalPending,
      this.exchangedAmount,
      this.creditDebitRunningBalance,
      this.runningBalance,
      this.carryForwardDebit,
      this.carryForwardCredit,
      this.creditDebitCarryForwardRunningBalance,
      this.surchargeDebit,
      this.surchargeCredit,
      this.creditDebitSurchargeRunningBalance,
      this.transferFlag,
      this.voteBalanceLogs,
      this.actionLogs,
      this.sessionIdByOffice,
      this.createdAt,
      this.updatedAt,
      this.officeId,
      this.createdBy,
      this.updatedBy,
      this.systemActionAt,
      this.customVoteDebit,
      this.customVoteCredit,
      this.rowVersion});

  VoteBalances.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    voteDetailId = json['voteDetailId'];
    classificationId = json['classificationId'];
    sabhaId = json['sabhaId'];
    year = json['year'];
    month = json['month'];
    code = json['code'];
    subCode = json['subCode'];
    description = json['description'];
    status = json['status'];
    transactionType = json['transactionType'];
    isCarryForward = json['isCarryForward'];
    estimatedIncome = json['estimatedIncome'];
    allocationAmount = json['allocationAmount'];
    allocationExchangeAmount = json['allocationExchangeAmount'];
    takeHoldRate = json['takeHoldRate'];
    takeHoldAmount = json['takeHoldAmount'];
    debit = json['debit'];
    credit = json['credit'];
    totalCommitted = json['totalCommitted'];
    totalHold = json['totalHold'];
    totalPending = json['totalPending'];
    exchangedAmount = json['exchangedAmount'];
    creditDebitRunningBalance = json['creditDebitRunningBalance'];
    runningBalance = json['runningBalance'];
    carryForwardDebit = json['carryForwardDebit'];
    carryForwardCredit = json['carryForwardCredit'];
    creditDebitCarryForwardRunningBalance =
        json['creditDebitCarryForwardRunningBalance'];
    surchargeDebit = json['surchargeDebit'];
    surchargeCredit = json['surchargeCredit'];
    creditDebitSurchargeRunningBalance =
        json['creditDebitSurchargeRunningBalance'];
    transferFlag = json['transferFlag'];
    if (json['voteBalanceLogs'] != null) {
      voteBalanceLogs = <VoteBalanceLogs>[];
      json['voteBalanceLogs'].forEach((v) {
        voteBalanceLogs!.add(new VoteBalanceLogs.fromJson(v));
      });
    }
    if (json['actionLogs'] != null) {
      actionLogs = <ActionLogs>[];
      json['actionLogs'].forEach((v) {
        actionLogs!.add(new ActionLogs.fromJson(v));
      });
    }
    sessionIdByOffice = json['sessionIdByOffice'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    officeId = json['officeId'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    systemActionAt = json['systemActionAt'];
    customVoteDebit = json['customVoteDebit'];
    customVoteCredit = json['customVoteCredit'];
    rowVersion = json['rowVersion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['voteDetailId'] = this.voteDetailId;
    data['classificationId'] = this.classificationId;
    data['sabhaId'] = this.sabhaId;
    data['year'] = this.year;
    data['month'] = this.month;
    data['code'] = this.code;
    data['subCode'] = this.subCode;
    data['description'] = this.description;
    data['status'] = this.status;
    data['transactionType'] = this.transactionType;
    data['isCarryForward'] = this.isCarryForward;
    data['estimatedIncome'] = this.estimatedIncome;
    data['allocationAmount'] = this.allocationAmount;
    data['allocationExchangeAmount'] = this.allocationExchangeAmount;
    data['takeHoldRate'] = this.takeHoldRate;
    data['takeHoldAmount'] = this.takeHoldAmount;
    data['debit'] = this.debit;
    data['credit'] = this.credit;
    data['totalCommitted'] = this.totalCommitted;
    data['totalHold'] = this.totalHold;
    data['totalPending'] = this.totalPending;
    data['exchangedAmount'] = this.exchangedAmount;
    data['creditDebitRunningBalance'] = this.creditDebitRunningBalance;
    data['runningBalance'] = this.runningBalance;
    data['carryForwardDebit'] = this.carryForwardDebit;
    data['carryForwardCredit'] = this.carryForwardCredit;
    data['creditDebitCarryForwardRunningBalance'] =
        this.creditDebitCarryForwardRunningBalance;
    data['surchargeDebit'] = this.surchargeDebit;
    data['surchargeCredit'] = this.surchargeCredit;
    data['creditDebitSurchargeRunningBalance'] =
        this.creditDebitSurchargeRunningBalance;
    data['transferFlag'] = this.transferFlag;
    if (this.voteBalanceLogs != null) {
      data['voteBalanceLogs'] =
          this.voteBalanceLogs!.map((v) => v.toJson()).toList();
    }
    if (this.actionLogs != null) {
      data['actionLogs'] = this.actionLogs!.map((v) => v.toJson()).toList();
    }
    data['sessionIdByOffice'] = this.sessionIdByOffice;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['officeId'] = this.officeId;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['systemActionAt'] = this.systemActionAt;
    data['customVoteDebit'] = this.customVoteDebit;
    data['customVoteCredit'] = this.customVoteCredit;
    data['rowVersion'] = this.rowVersion;
    return data;
  }
}

class VoteBalanceLogs {
  int? id;
  int? voteBalanceId;
  int? voteDetailId;
  int? sabhaId;
  int? year;
  int? month;
  String? code;
  String? subCode;
  String? description;
  int? status;
  int? transactionType;
  bool? isCarryForward;
  int? estimatedIncome;
  int? allocationAmount;
  int? takeHoldRate;
  int? takeHoldAmount;
  int? allocationExchangeAmount;
  int? debit;
  int? credit;
  int? totalCommitted;
  int? totalHold;
  int? totalPending;
  int? exchangedAmount;
  int? creditDebitRunningBalance;
  int? runningBalance;
  int? carryForwardDebit;
  int? carryForwardCredit;
  int? creditDebitCarryForwardRunningBalance;
  int? surchargeDebit;
  int? surchargeCredit;
  int? creditDebitSurchargeRunningBalance;
  int? modulePrimaryKey;
  int? appCategory;
  String? voteBalance;
  int? officeId;
  int? sessionIdByOffice;
  String? updatedAt;
  int? updatedBy;
  String? systemActionAt;
  int? customVoteDebit;
  int? customVoteCredit;
  String? rowVersion;

  VoteBalanceLogs(
      {this.id,
      this.voteBalanceId,
      this.voteDetailId,
      this.sabhaId,
      this.year,
      this.month,
      this.code,
      this.subCode,
      this.description,
      this.status,
      this.transactionType,
      this.isCarryForward,
      this.estimatedIncome,
      this.allocationAmount,
      this.takeHoldRate,
      this.takeHoldAmount,
      this.allocationExchangeAmount,
      this.debit,
      this.credit,
      this.totalCommitted,
      this.totalHold,
      this.totalPending,
      this.exchangedAmount,
      this.creditDebitRunningBalance,
      this.runningBalance,
      this.carryForwardDebit,
      this.carryForwardCredit,
      this.creditDebitCarryForwardRunningBalance,
      this.surchargeDebit,
      this.surchargeCredit,
      this.creditDebitSurchargeRunningBalance,
      this.modulePrimaryKey,
      this.appCategory,
      this.voteBalance,
      this.officeId,
      this.sessionIdByOffice,
      this.updatedAt,
      this.updatedBy,
      this.systemActionAt,
      this.customVoteDebit,
      this.customVoteCredit,
      this.rowVersion});

  VoteBalanceLogs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    voteBalanceId = json['voteBalanceId'];
    voteDetailId = json['voteDetailId'];
    sabhaId = json['sabhaId'];
    year = json['year'];
    month = json['month'];
    code = json['code'];
    subCode = json['subCode'];
    description = json['description'];
    status = json['status'];
    transactionType = json['transactionType'];
    isCarryForward = json['isCarryForward'];
    estimatedIncome = json['estimatedIncome'];
    allocationAmount = json['allocationAmount'];
    takeHoldRate = json['takeHoldRate'];
    takeHoldAmount = json['takeHoldAmount'];
    allocationExchangeAmount = json['allocationExchangeAmount'];
    debit = json['debit'];
    credit = json['credit'];
    totalCommitted = json['totalCommitted'];
    totalHold = json['totalHold'];
    totalPending = json['totalPending'];
    exchangedAmount = json['exchangedAmount'];
    creditDebitRunningBalance = json['creditDebitRunningBalance'];
    runningBalance = json['runningBalance'];
    carryForwardDebit = json['carryForwardDebit'];
    carryForwardCredit = json['carryForwardCredit'];
    creditDebitCarryForwardRunningBalance =
        json['creditDebitCarryForwardRunningBalance'];
    surchargeDebit = json['surchargeDebit'];
    surchargeCredit = json['surchargeCredit'];
    creditDebitSurchargeRunningBalance =
        json['creditDebitSurchargeRunningBalance'];
    modulePrimaryKey = json['modulePrimaryKey'];
    appCategory = json['appCategory'];
    voteBalance = json['voteBalance'];
    officeId = json['officeId'];
    sessionIdByOffice = json['sessionIdByOffice'];
    updatedAt = json['updatedAt'];
    updatedBy = json['updatedBy'];
    systemActionAt = json['systemActionAt'];
    customVoteDebit = json['customVoteDebit'];
    customVoteCredit = json['customVoteCredit'];
    rowVersion = json['rowVersion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['voteBalanceId'] = this.voteBalanceId;
    data['voteDetailId'] = this.voteDetailId;
    data['sabhaId'] = this.sabhaId;
    data['year'] = this.year;
    data['month'] = this.month;
    data['code'] = this.code;
    data['subCode'] = this.subCode;
    data['description'] = this.description;
    data['status'] = this.status;
    data['transactionType'] = this.transactionType;
    data['isCarryForward'] = this.isCarryForward;
    data['estimatedIncome'] = this.estimatedIncome;
    data['allocationAmount'] = this.allocationAmount;
    data['takeHoldRate'] = this.takeHoldRate;
    data['takeHoldAmount'] = this.takeHoldAmount;
    data['allocationExchangeAmount'] = this.allocationExchangeAmount;
    data['debit'] = this.debit;
    data['credit'] = this.credit;
    data['totalCommitted'] = this.totalCommitted;
    data['totalHold'] = this.totalHold;
    data['totalPending'] = this.totalPending;
    data['exchangedAmount'] = this.exchangedAmount;
    data['creditDebitRunningBalance'] = this.creditDebitRunningBalance;
    data['runningBalance'] = this.runningBalance;
    data['carryForwardDebit'] = this.carryForwardDebit;
    data['carryForwardCredit'] = this.carryForwardCredit;
    data['creditDebitCarryForwardRunningBalance'] =
        this.creditDebitCarryForwardRunningBalance;
    data['surchargeDebit'] = this.surchargeDebit;
    data['surchargeCredit'] = this.surchargeCredit;
    data['creditDebitSurchargeRunningBalance'] =
        this.creditDebitSurchargeRunningBalance;
    data['modulePrimaryKey'] = this.modulePrimaryKey;
    data['appCategory'] = this.appCategory;
    data['voteBalance'] = this.voteBalance;
    data['officeId'] = this.officeId;
    data['sessionIdByOffice'] = this.sessionIdByOffice;
    data['updatedAt'] = this.updatedAt;
    data['updatedBy'] = this.updatedBy;
    data['systemActionAt'] = this.systemActionAt;
    data['customVoteDebit'] = this.customVoteDebit;
    data['customVoteCredit'] = this.customVoteCredit;
    data['rowVersion'] = this.rowVersion;
    return data;
  }
}

class ActionLogs {
  int? id;
  int? voteBalanceId;
  int? actionState;
  int? actionBy;
  String? comment;
  String? actionDateTime;
  String? voteBalance;
  String? systemActionAt;

  ActionLogs(
      {this.id,
      this.voteBalanceId,
      this.actionState,
      this.actionBy,
      this.comment,
      this.actionDateTime,
      this.voteBalance,
      this.systemActionAt});

  ActionLogs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    voteBalanceId = json['voteBalanceId'];
    actionState = json['actionState'];
    actionBy = json['actionBy'];
    comment = json['comment'];
    actionDateTime = json['actionDateTime'];
    voteBalance = json['voteBalance'];
    systemActionAt = json['systemActionAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['voteBalanceId'] = this.voteBalanceId;
    data['actionState'] = this.actionState;
    data['actionBy'] = this.actionBy;
    data['comment'] = this.comment;
    data['actionDateTime'] = this.actionDateTime;
    data['voteBalance'] = this.voteBalance;
    data['systemActionAt'] = this.systemActionAt;
    return data;
  }
}

class PaymentVat {
  int? id;
  String? code;
  String? name;
  int? amountPercentage;
  String? dateCreated;
  String? dateModified;
  bool? isActive;

  PaymentVat(
      {this.id,
      this.code,
      this.name,
      this.amountPercentage,
      this.dateCreated,
      this.dateModified,
      this.isActive});

  PaymentVat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    amountPercentage = json['amountPercentage'];
    dateCreated = json['dateCreated'];
    dateModified = json['dateModified'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['amountPercentage'] = this.amountPercentage;
    data['dateCreated'] = this.dateCreated;
    data['dateModified'] = this.dateModified;
    data['isActive'] = this.isActive;
    return data;
  }
}

class MixinOrder {
  int? id;
  String? code;
  String? customerName;
  String? customerNicNumber;
  String? customerMobileNumber;
  int? totalAmount;
  int? discountRate;
  int? discountAmount;
  String? chequeNumber;
  String? chequeDate;
  String? chequeBankName;
  int? state;
  Cashier? userDetail;
  int? sessionId;
  int? paymentMethodId;
  GnDivisions? gnDivisions;
  int? gnDivisionId;
  Cashier? cashier;
  int? cashierId;
  Partner? partner;
  int? partnerId;
  int? employeeId;
  Office? office;
  int? officeId;
  int? accountDetailId;
  int? businessId;
  int? appCategoryId;
  int? businessTaxId;
  int? tradeLicenseStatus;
  int? taxTypeId;
  int? paymentDetailId;
  int? assessmentId;
  int? shopId;
  int? waterConnectionId;
  int? assmtBalByExcessDeduction;
  int? createdBy;
  String? createdAt;
  String? updatedAt;

  MixinOrder(
      {this.id,
      this.code,
      this.customerName,
      this.customerNicNumber,
      this.customerMobileNumber,
      this.totalAmount,
      this.discountRate,
      this.discountAmount,
      this.chequeNumber,
      this.chequeDate,
      this.chequeBankName,
      this.state,
      this.userDetail,
      this.sessionId,
      this.paymentMethodId,
      this.gnDivisions,
      this.gnDivisionId,
      this.cashier,
      this.cashierId,
      this.partner,
      this.partnerId,
      this.employeeId,
      this.office,
      this.officeId,
      this.accountDetailId,
      this.businessId,
      this.appCategoryId,
      this.businessTaxId,
      this.tradeLicenseStatus,
      this.taxTypeId,
      this.paymentDetailId,
      this.assessmentId,
      this.shopId,
      this.waterConnectionId,
      this.assmtBalByExcessDeduction,
      this.createdBy,
      this.createdAt,
      this.updatedAt});

  MixinOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    customerName = json['customerName'];
    customerNicNumber = json['customerNicNumber'];
    customerMobileNumber = json['customerMobileNumber'];
    totalAmount = json['totalAmount'];
    discountRate = json['discountRate'];
    discountAmount = json['discountAmount'];
    chequeNumber = json['chequeNumber'];
    chequeDate = json['chequeDate'];
    chequeBankName = json['chequeBankName'];
    state = json['state'];
    userDetail = json['userDetail'] != null
        ? new Cashier.fromJson(json['userDetail'])
        : null;
    sessionId = json['sessionId'];
    paymentMethodId = json['paymentMethodId'];
    gnDivisions = json['gnDivisions'] != null
        ? new GnDivisions.fromJson(json['gnDivisions'])
        : null;
    gnDivisionId = json['gnDivisionId'];
    cashier =
        json['cashier'] != null ? new Cashier.fromJson(json['cashier']) : null;
    cashierId = json['cashierId'];
    partner =
        json['partner'] != null ? new Partner.fromJson(json['partner']) : null;
    partnerId = json['partnerId'];
    employeeId = json['employeeId'];
    office =
        json['office'] != null ? new Office.fromJson(json['office']) : null;
    officeId = json['officeId'];
    accountDetailId = json['accountDetailId'];
    businessId = json['businessId'];
    appCategoryId = json['appCategoryId'];
    businessTaxId = json['businessTaxId'];
    tradeLicenseStatus = json['tradeLicenseStatus'];
    taxTypeId = json['taxTypeId'];
    paymentDetailId = json['paymentDetailId'];
    assessmentId = json['assessmentId'];
    shopId = json['shopId'];
    waterConnectionId = json['waterConnectionId'];
    assmtBalByExcessDeduction = json['assmtBalByExcessDeduction'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['customerName'] = this.customerName;
    data['customerNicNumber'] = this.customerNicNumber;
    data['customerMobileNumber'] = this.customerMobileNumber;
    data['totalAmount'] = this.totalAmount;
    data['discountRate'] = this.discountRate;
    data['discountAmount'] = this.discountAmount;
    data['chequeNumber'] = this.chequeNumber;
    data['chequeDate'] = this.chequeDate;
    data['chequeBankName'] = this.chequeBankName;
    data['state'] = this.state;
    if (this.userDetail != null) {
      data['userDetail'] = this.userDetail!.toJson();
    }
    data['sessionId'] = this.sessionId;
    data['paymentMethodId'] = this.paymentMethodId;
    if (this.gnDivisions != null) {
      data['gnDivisions'] = this.gnDivisions!.toJson();
    }
    data['gnDivisionId'] = this.gnDivisionId;
    if (this.cashier != null) {
      data['cashier'] = this.cashier!.toJson();
    }
    data['cashierId'] = this.cashierId;
    if (this.partner != null) {
      data['partner'] = this.partner!.toJson();
    }
    data['partnerId'] = this.partnerId;
    data['employeeId'] = this.employeeId;
    if (this.office != null) {
      data['office'] = this.office!.toJson();
    }
    data['officeId'] = this.officeId;
    data['accountDetailId'] = this.accountDetailId;
    data['businessId'] = this.businessId;
    data['appCategoryId'] = this.appCategoryId;
    data['businessTaxId'] = this.businessTaxId;
    data['tradeLicenseStatus'] = this.tradeLicenseStatus;
    data['taxTypeId'] = this.taxTypeId;
    data['paymentDetailId'] = this.paymentDetailId;
    data['assessmentId'] = this.assessmentId;
    data['shopId'] = this.shopId;
    data['waterConnectionId'] = this.waterConnectionId;
    data['assmtBalByExcessDeduction'] = this.assmtBalByExcessDeduction;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Vote {
  int? id;
  int? isActive;
  VoteDetail? voteDetail;
  int? voteId;
  Office? office;
  int? officeId;
  AccountDetail? accountDetail;
  int? bankAccountId;
  String? dateCreated;
  String? dateModified;
  int? sabhaId;
  String? voteCode;
  String? voteNameSinahala;
  String? voteNameTamil;
  String? voteNameEnglish;
  String? accountNo;
  String? accountName;
  String? accountNameTamil;
  String? accountNameEnglish;
  List<VoteAssignmentDetails>? voteAssignmentDetails;

  Vote(
      {this.id,
      this.isActive,
      this.voteDetail,
      this.voteId,
      this.office,
      this.officeId,
      this.accountDetail,
      this.bankAccountId,
      this.dateCreated,
      this.dateModified,
      this.sabhaId,
      this.voteCode,
      this.voteNameSinahala,
      this.voteNameTamil,
      this.voteNameEnglish,
      this.accountNo,
      this.accountName,
      this.accountNameTamil,
      this.accountNameEnglish,
      this.voteAssignmentDetails});

  Vote.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isActive = json['isActive'];
    voteDetail = json['voteDetail'] != null
        ? new VoteDetail.fromJson(json['voteDetail'])
        : null;
    voteId = json['voteId'];
    office =
        json['office'] != null ? new Office.fromJson(json['office']) : null;
    officeId = json['officeId'];
    accountDetail = json['accountDetail'] != null
        ? new AccountDetail.fromJson(json['accountDetail'])
        : null;
    bankAccountId = json['bankAccountId'];
    dateCreated = json['dateCreated'];
    dateModified = json['dateModified'];
    sabhaId = json['sabhaId'];
    voteCode = json['voteCode'];
    voteNameSinahala = json['voteNameSinahala'];
    voteNameTamil = json['voteNameTamil'];
    voteNameEnglish = json['voteNameEnglish'];
    accountNo = json['accountNo'];
    accountName = json['accountName'];
    accountNameTamil = json['accountNameTamil'];
    accountNameEnglish = json['accountNameEnglish'];
    if (json['voteAssignmentDetails'] != null) {
      voteAssignmentDetails = (json['voteAssignmentDetails'] as List)
          .map((item) => VoteAssignmentDetails.fromJson(item))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isActive'] = this.isActive;
    if (this.voteDetail != null) {
      data['voteDetail'] = this.voteDetail!.toJson();
    }
    data['voteId'] = this.voteId;
    if (this.office != null) {
      data['office'] = this.office!.toJson();
    }
    data['officeId'] = this.officeId;
    if (this.accountDetail != null) {
      data['accountDetail'] = this.accountDetail!.toJson();
    }
    data['bankAccountId'] = this.bankAccountId;
    data['dateCreated'] = this.dateCreated;
    data['dateModified'] = this.dateModified;
    data['sabhaId'] = this.sabhaId;
    data['voteCode'] = this.voteCode;
    data['voteNameSinahala'] = this.voteNameSinahala;
    data['voteNameTamil'] = this.voteNameTamil;
    data['voteNameEnglish'] = this.voteNameEnglish;
    data['accountNo'] = this.accountNo;
    data['accountName'] = this.accountName;
    data['accountNameTamil'] = this.accountNameTamil;
    data['accountNameEnglish'] = this.accountNameEnglish;
    if (this.voteAssignmentDetails != null) {
      data['voteAssignmentDetails'] =
          this.voteAssignmentDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class BalancesheetTitleResource {
  int? id;
  String? nameSinhala;
  String? nameEnglish;
  String? nameTamil;
  String? code;
  int? balpath;
  int? status;
  int? sabhaID;
  int? classificationID;
  int? mainLedgerAccountID;
  List<BalancesheetSubtitle>? balancesheetSubtitle;

  BalancesheetTitleResource(
      {this.id,
      this.nameSinhala,
      this.nameEnglish,
      this.nameTamil,
      this.code,
      this.balpath,
      this.status,
      this.sabhaID,
      this.classificationID,
      this.mainLedgerAccountID,
      this.balancesheetSubtitle});

  BalancesheetTitleResource.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameSinhala = json['nameSinhala'];
    nameEnglish = json['nameEnglish'];
    nameTamil = json['nameTamil'];
    code = json['code'];
    balpath = json['balpath'];
    status = json['status'];
    sabhaID = json['sabhaID'];
    classificationID = json['classificationID'];
    mainLedgerAccountID = json['mainLedgerAccountID'];
    if (json['balancesheetSubtitle'] != null) {
      balancesheetSubtitle = <BalancesheetSubtitle>[];
      json['balancesheetSubtitle'].forEach((v) {
        balancesheetSubtitle!.add(new BalancesheetSubtitle.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameSinhala'] = this.nameSinhala;
    data['nameEnglish'] = this.nameEnglish;
    data['nameTamil'] = this.nameTamil;
    data['code'] = this.code;
    data['balpath'] = this.balpath;
    data['status'] = this.status;
    data['sabhaID'] = this.sabhaID;
    data['classificationID'] = this.classificationID;
    data['mainLedgerAccountID'] = this.mainLedgerAccountID;
    if (this.balancesheetSubtitle != null) {
      data['balancesheetSubtitle'] =
          this.balancesheetSubtitle!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BalancesheetSubtitle {
  int? id;
  String? nameSinhala;
  String? nameEnglish;
  String? nameTamil;
  String? code;
  int? balsheetTitleID;
  dynamic? status;
  int? sabhaID;
  int? bankAccountID;
  dynamic? balancesheetTitle;
  AccountDetail? accountDetail;
  List<SubLedgerAccounts>? subLedgerAccounts;

  BalancesheetSubtitle(
      {this.id,
      this.nameSinhala,
      this.nameEnglish,
      this.nameTamil,
      this.code,
      this.balsheetTitleID,
      this.status,
      this.sabhaID,
      this.bankAccountID,
      this.balancesheetTitle,
      this.accountDetail,
      this.subLedgerAccounts});

  BalancesheetSubtitle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameSinhala = json['nameSinhala'];
    nameEnglish = json['nameEnglish'];
    nameTamil = json['nameTamil'];
    code = json['code'];
    balsheetTitleID = json['balsheetTitleID'];
    status = json['status'];
    sabhaID = json['sabhaID'];
    bankAccountID = json['bankAccountID'];
    balancesheetTitle = json['balancesheetTitle'];
    accountDetail = json['accountDetail'] != null
        ? new AccountDetail.fromJson(json['accountDetail'])
        : null;
    if (json['subLedgerAccounts'] != null) {
      subLedgerAccounts = <SubLedgerAccounts>[];
      json['subLedgerAccounts'].forEach((v) {
        subLedgerAccounts!.add(new SubLedgerAccounts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameSinhala'] = this.nameSinhala;
    data['nameEnglish'] = this.nameEnglish;
    data['nameTamil'] = this.nameTamil;
    data['code'] = this.code;
    data['balsheetTitleID'] = this.balsheetTitleID;
    data['status'] = this.status;
    data['sabhaID'] = this.sabhaID;
    data['bankAccountID'] = this.bankAccountID;
    data['balancesheetTitle'] = this.balancesheetTitle;
    if (this.accountDetail != null) {
      data['accountDetail'] = this.accountDetail!.toJson();
    }
    if (this.subLedgerAccounts != null) {
      data['subLedgerAccounts'] =
          this.subLedgerAccounts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class SubLedgerAccounts {
  int? id;
  String? nameSinhala;
  String? nameEnglish;
  String? nameTamil;
  String? code;
  int? balsheetLedgerAccountId;
  int? coaVersionId;
  int? statusID;

  SubLedgerAccounts(
      {this.id,
      this.nameSinhala,
      this.nameEnglish,
      this.nameTamil,
      this.code,
      this.balsheetLedgerAccountId,
      this.coaVersionId,
      this.statusID});

  SubLedgerAccounts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameSinhala = json['nameSinhala'];
    nameEnglish = json['nameEnglish'];
    nameTamil = json['nameTamil'];
    code = json['code'];
    balsheetLedgerAccountId = json['balsheetLedgerAccountId'];
    coaVersionId = json['coaVersionId'];
    statusID = json['statusID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameSinhala'] = this.nameSinhala;
    data['nameEnglish'] = this.nameEnglish;
    data['nameTamil'] = this.nameTamil;
    data['code'] = this.code;
    data['balsheetLedgerAccountId'] = this.balsheetLedgerAccountId;
    data['coaVersionId'] = this.coaVersionId;
    data['statusID'] = this.statusID;
    return data;
  }
}

class PaymentVatResource {
  int? id;
  String? code;
  String? name;
  double? amountPercentage;
  String? dateCreated;
  String? dateModified;
  bool? isActive;

  PaymentVatResource({
    this.id,
    this.code,
    this.name,
    this.amountPercentage,
    this.dateCreated,
    this.dateModified,
    this.isActive,
  });

  // Factory constructor for JSON deserialization
  factory PaymentVatResource.fromJson(Map<String, dynamic> json) {
    return PaymentVatResource(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      amountPercentage: json['amountPercentage'],
      dateCreated: json['dateCreated'],
      dateModified: json['dateModified'],
      isActive: json['isActive'],
    );
  }

  // Method to serialize object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'name': name,
      'amountPercentage': amountPercentage,
      'dateCreated': dateCreated,
      'dateModified': dateModified,
      'isActive': isActive,
    };
  }

  // Copy with method
  PaymentVatResource copyWith({
    int? id,
    String? code,
    String? name,
    double? amountPercentage,
    String? dateCreated,
    String? dateModified,
    bool? isActive,
  }) {
    return PaymentVatResource(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      amountPercentage: amountPercentage ?? this.amountPercentage,
      dateCreated: dateCreated ?? this.dateCreated,
      dateModified: dateModified ?? this.dateModified,
      isActive: isActive ?? this.isActive,
    );
  }
}

class NBTResource {
  int? id;
  String? code;
  String? name;
  dynamic? amountPercentage;

  NBTResource({this.id, this.code, this.name, this.amountPercentage});

  // Create an NBTResource object from a JSON map
  NBTResource.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    amountPercentage = json['amountPercentage'];
  }

  // Convert NBTResource object to JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'name': name,
      'amountPercentage': amountPercentage,
    };
  }
}
