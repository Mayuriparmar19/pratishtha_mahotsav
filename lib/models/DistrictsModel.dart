class DistrictsModel {
  int? iResultFlag;
  String? error;
  String? message;
  int? count;
  List<Rows>? rows;

  DistrictsModel(
      {this.iResultFlag, this.error, this.message, this.count, this.rows});

  DistrictsModel.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data =  <String, dynamic>{};
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
  int? districtId;
  String? stateCode;
  String? districtCode;
  String? districtName;

  Rows({this.districtId, this.stateCode, this.districtCode, this.districtName});

  Rows.fromJson(Map<String, dynamic> json) {
    districtId = json['district_id'];
    stateCode = json['state_code'];
    districtCode = json['district_code'];
    districtName = json['district_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['district_id'] = districtId;
    data['state_code'] = stateCode;
    data['district_code'] = districtCode;
    data['district_name'] = districtName;
    return data;
  }
}
