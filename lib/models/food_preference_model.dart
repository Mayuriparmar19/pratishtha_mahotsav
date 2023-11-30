class FoodPreferenceModel {
  int? iResultFlag;
  String? error;
  String? message;
  int? count;
  List<Rows>? rows;

  FoodPreferenceModel(
      {this.iResultFlag, this.error, this.message, this.count, this.rows});

  FoodPreferenceModel.fromJson(Map<String, dynamic> json) {
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
  int? foodPreferenceId;
  String? title;

  Rows({this.foodPreferenceId, this.title});

  Rows.fromJson(Map<String, dynamic> json) {
    foodPreferenceId = json['food_preference_id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['food_preference_id'] = foodPreferenceId;
    data['title'] = title;
    return data;
  }
}
