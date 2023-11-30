class StatesModel {
  int? iResultFlag;
  String? error;
  String? message;
  int? count;
  List<Rows>? rows;

  StatesModel(
      {this.iResultFlag, this.error, this.message, this.count, this.rows});

  StatesModel.fromJson(Map<String, dynamic> json) {
    iResultFlag = json['_resultFlag'];
    error = json['error'];
    message = json['message'];
    count = json['count'];
    if (json['rows'] != null) {
      rows = <Rows>[];
      json['rows'].forEach((v) {
        rows!.add(Rows.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_resultFlag'] = iResultFlag;
    data['error'] = error;
    data['message'] = message;
    data['count'] = count;
    if (rows != null) {
      data['rows'] = rows!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rows {
  int? stateId;
  String? stateCode;
  String? stateName;

  Rows({this.stateId, this.stateCode, this.stateName});

  Rows.fromJson(Map<String, dynamic> json) {
    stateId = json['state_id'];
    stateCode = json['state_code'];
    stateName = json['state_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['state_id'] = stateId;
    data['state_code'] = stateCode;
    data['state_name'] = stateName;
    return data;
  }
}
