/// _resultFlag : 1
/// error : ""
/// message : ""
/// count : 21
/// rows : {"id":2,"profession_id":1,"country_id":12,"state_id":0,"state_name":"Gujarat","city_name":"Ahmedabad","first_name":"Ajay","user_image":"https://kanjiswami.org/pratishtha/uploads/users/user_image1687760699.png","middle_name":"M","last_name":"Jagad","email":"ajayjagad@gmail.com","address":"Mehsana","birth_date":"01-02-1998","live_in":"Surat","mobile":"9924215790","gender":"Male","language":"english","association":"test","postal_code":"380015","token":"244a11e907fcfded0633a502fa18b301","other":""}

class UserDetailsModel {
  UserDetailsModel({
      num? resultFlag, 
      String? error, 
      String? message, 
      num? count, 
      Rows? rows,}){
    _resultFlag = resultFlag;
    _error = error;
    _message = message;
    _count = count;
    _rows = rows;
}

  UserDetailsModel.fromJson(dynamic json) {
    _resultFlag = json['_resultFlag'];
    _error = json['error'];
    _message = json['message'];
    _count = json['count'];
    _rows = json['rows'] != null ? Rows.fromJson(json['rows']) : null;
  }
  num? _resultFlag;
  String? _error;
  String? _message;
  num? _count;
  Rows? _rows;
UserDetailsModel copyWith({  num? resultFlag,
  String? error,
  String? message,
  num? count,
  Rows? rows,
}) => UserDetailsModel(  resultFlag: resultFlag ?? _resultFlag,
  error: error ?? _error,
  message: message ?? _message,
  count: count ?? _count,
  rows: rows ?? _rows,
);
  num? get resultFlag => _resultFlag;
  String? get error => _error;
  String? get message => _message;
  num? get count => _count;
  Rows? get rows => _rows;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_resultFlag'] = _resultFlag;
    map['error'] = _error;
    map['message'] = _message;
    map['count'] = _count;
    if (_rows != null) {
      map['rows'] = _rows?.toJson();
    }
    return map;
  }

}

/// id : 2
/// profession_id : 1
/// country_id : 12
/// state_id : 0
/// state_name : "Gujarat"
/// city_name : "Ahmedabad"
/// first_name : "Ajay"
/// user_image : "https://kanjiswami.org/pratishtha/uploads/users/user_image1687760699.png"
/// middle_name : "M"
/// last_name : "Jagad"
/// email : "ajayjagad@gmail.com"
/// address : "Mehsana"
/// birth_date : "01-02-1998"
/// live_in : "Surat"
/// mobile : "9924215790"
/// gender : "Male"
/// language : "english"
/// association : "test"
/// postal_code : "380015"
/// token : "244a11e907fcfded0633a502fa18b301"
/// other : ""

class Rows {
  Rows({
      num? id, 
      num? professionId, 
      num? countryId, 
      num? stateId, 
      String? stateName, 
      String? cityName, 
      String? firstName, 
      String? userImage, 
      String? middleName, 
      String? lastName, 
      String? email, 
      String? address, 
      String? birthDate, 
      String? liveIn, 
      String? mobile, 
      String? gender, 
      String? language, 
      String? association, 
      String? postalCode, 
      String? token, 
      String? other,}){
    _id = id;
    _professionId = professionId;
    _countryId = countryId;
    _stateId = stateId;
    _stateName = stateName;
    _cityName = cityName;
    _firstName = firstName;
    _userImage = userImage;
    _middleName = middleName;
    _lastName = lastName;
    _email = email;
    _address = address;
    _birthDate = birthDate;
    _liveIn = liveIn;
    _mobile = mobile;
    _gender = gender;
    _language = language;
    _association = association;
    _postalCode = postalCode;
    _token = token;
    _other = other;
}

  Rows.fromJson(dynamic json) {
    _id = json['id'];
    _professionId = json['profession_id'];
    _countryId = json['country_id'];
    _stateId = json['state_id'];
    _stateName = json['state_name'];
    _cityName = json['city_name'];
    _firstName = json['first_name'];
    _userImage = json['user_image'];
    _middleName = json['middle_name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _address = json['address'];
    _birthDate = json['birth_date'];
    _liveIn = json['live_in'];
    _mobile = json['mobile'];
    _gender = json['gender'];
    _language = json['language'];
    _association = json['association'];
    _postalCode = json['postal_code'];
    _token = json['token'];
    _other = json['other'];
  }
  num? _id;
  num? _professionId;
  num? _countryId;
  num? _stateId;
  String? _stateName;
  String? _cityName;
  String? _firstName;
  String? _userImage;
  String? _middleName;
  String? _lastName;
  String? _email;
  String? _address;
  String? _birthDate;
  String? _liveIn;
  String? _mobile;
  String? _gender;
  String? _language;
  String? _association;
  String? _postalCode;
  String? _token;
  String? _other;
Rows copyWith({  num? id,
  num? professionId,
  num? countryId,
  num? stateId,
  String? stateName,
  String? cityName,
  String? firstName,
  String? userImage,
  String? middleName,
  String? lastName,
  String? email,
  String? address,
  String? birthDate,
  String? liveIn,
  String? mobile,
  String? gender,
  String? language,
  String? association,
  String? postalCode,
  String? token,
  String? other,
}) => Rows(  id: id ?? _id,
  professionId: professionId ?? _professionId,
  countryId: countryId ?? _countryId,
  stateId: stateId ?? _stateId,
  stateName: stateName ?? _stateName,
  cityName: cityName ?? _cityName,
  firstName: firstName ?? _firstName,
  userImage: userImage ?? _userImage,
  middleName: middleName ?? _middleName,
  lastName: lastName ?? _lastName,
  email: email ?? _email,
  address: address ?? _address,
  birthDate: birthDate ?? _birthDate,
  liveIn: liveIn ?? _liveIn,
  mobile: mobile ?? _mobile,
  gender: gender ?? _gender,
  language: language ?? _language,
  association: association ?? _association,
  postalCode: postalCode ?? _postalCode,
  token: token ?? _token,
  other: other ?? _other,
);
  num? get id => _id;
  num? get professionId => _professionId;
  num? get countryId => _countryId;
  num? get stateId => _stateId;
  String? get stateName => _stateName;
  String? get cityName => _cityName;
  String? get firstName => _firstName;
  String? get userImage => _userImage;
  String? get middleName => _middleName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get address => _address;
  String? get birthDate => _birthDate;
  String? get liveIn => _liveIn;
  String? get mobile => _mobile;
  String? get gender => _gender;
  String? get language => _language;
  String? get association => _association;
  String? get postalCode => _postalCode;
  String? get token => _token;
  String? get other => _other;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['profession_id'] = _professionId;
    map['country_id'] = _countryId;
    map['state_id'] = _stateId;
    map['state_name'] = _stateName;
    map['city_name'] = _cityName;
    map['first_name'] = _firstName;
    map['user_image'] = _userImage;
    map['middle_name'] = _middleName;
    map['last_name'] = _lastName;
    map['email'] = _email;
    map['address'] = _address;
    map['birth_date'] = _birthDate;
    map['live_in'] = _liveIn;
    map['mobile'] = _mobile;
    map['gender'] = _gender;
    map['language'] = _language;
    map['association'] = _association;
    map['postal_code'] = _postalCode;
    map['token'] = _token;
    map['other'] = _other;
    return map;
  }

}