class TransactionModel {
  bool? isSuccessful;
  String? responseCode;
  String? responseMessage;
  List<Data>? data;
  String? caller;

  TransactionModel(
      {this.isSuccessful,
      this.responseCode,
      this.responseMessage,
      this.data,
      this.caller});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    isSuccessful = json['IsSuccessful'];
    responseCode = json['ResponseCode'];
    responseMessage = json['ResponseMessage'];
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    caller = json['Caller'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsSuccessful'] = this.isSuccessful;
    data['ResponseCode'] = this.responseCode;
    data['ResponseMessage'] = this.responseMessage;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['Caller'] = this.caller;
    return data;
  }
}

class Data {
  String? depositID;
  String? payinAccount;
  String? payoutAccount;
  String? userID;
  String? accountName;
  int? rate;
  String? arrangementID;
  String? dateCreated;
  String? responseCode;
  String? responseMessage;
  String? depositType;
  String? dateUpdated;
  int? amount;
  int? tenure;

  Data(
      {this.depositID,
      this.payinAccount,
      this.payoutAccount,
      this.userID,
      this.accountName,
      this.rate,
      this.arrangementID,
      this.dateCreated,
      this.responseCode,
      this.responseMessage,
      this.depositType,
      this.dateUpdated,
      this.amount,
      this.tenure});

  Data.fromJson(Map<String, dynamic> json) {
    depositID = json['DepositID'];
    payinAccount = json['PayinAccount'];
    payoutAccount = json['PayoutAccount'];
    userID = json['UserID'];
    accountName = json['AccountName'];
    rate = json['Rate'];
    arrangementID = json['ArrangementID'];
    dateCreated = json['DateCreated'];
    responseCode = json['ResponseCode'];
    responseMessage = json['ResponseMessage'];
    depositType = json['DepositType'];
    dateUpdated = json['DateUpdated'];
    amount = json['Amount'];
    tenure = json['Tenure'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DepositID'] = this.depositID;
    data['PayinAccount'] = this.payinAccount;
    data['PayoutAccount'] = this.payoutAccount;
    data['UserID'] = this.userID;
    data['AccountName'] = this.accountName;
    data['Rate'] = this.rate;
    data['ArrangementID'] = this.arrangementID;
    data['DateCreated'] = this.dateCreated;
    data['ResponseCode'] = this.responseCode;
    data['ResponseMessage'] = this.responseMessage;
    data['DepositType'] = this.depositType;
    data['DateUpdated'] = this.dateUpdated;
    data['Amount'] = this.amount;
    data['Tenure'] = this.tenure;
    return data;
  }
}
