class CountriesModel {
  int? iResultFlag;
  String? error;
  String? message;
  int? count;
  List<Rows>? rows;

  CountriesModel(
      {this.iResultFlag, this.error, this.message, this.count, this.rows});

  CountriesModel.fromJson(Map<String, dynamic> json) {
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
  int? countryId;
  String? countryCode;
  String? countryName;

  Rows({this.countryId, this.countryCode, this.countryName});

  Rows.fromJson(Map<String, dynamic> json) {
    countryId = json['country_id'];
    countryCode = json['country_code'];
    countryName = json['country_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country_id'] = countryId;
    data['country_code'] = countryCode;
    data['country_name'] = countryName;
    return data;
  }
}
