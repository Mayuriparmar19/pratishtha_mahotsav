/// _resultFlag : 1
/// error : ""
/// message : ""
/// count : 1
/// rows : [{"video_album_id":1,"title":"Pratistha Mohatsav 2023","image":""}]

class VideoAlbumModel {
  VideoAlbumModel({
      num? resultFlag, 
      String? error, 
      String? message, 
      num? count, 
      List<Rows>? rows,}){
    _resultFlag = resultFlag;
    _error = error;
    _message = message;
    _count = count;
    _rows = rows;
}

  VideoAlbumModel.fromJson(dynamic json) {
    _resultFlag = json['_resultFlag'];
    _error = json['error'];
    _message = json['message'];
    _count = json['count'];
    if (json['rows'] != null) {
      _rows = [];
      json['rows'].forEach((v) {
        _rows?.add(Rows.fromJson(v));
      });
    }
  }
  num? _resultFlag;
  String? _error;
  String? _message;
  num? _count;
  List<Rows>? _rows;
VideoAlbumModel copyWith({  num? resultFlag,
  String? error,
  String? message,
  num? count,
  List<Rows>? rows,
}) => VideoAlbumModel(  resultFlag: resultFlag ?? _resultFlag,
  error: error ?? _error,
  message: message ?? _message,
  count: count ?? _count,
  rows: rows ?? _rows,
);
  num? get resultFlag => _resultFlag;
  String? get error => _error;
  String? get message => _message;
  num? get count => _count;
  List<Rows>? get rows => _rows;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_resultFlag'] = _resultFlag;
    map['error'] = _error;
    map['message'] = _message;
    map['count'] = _count;
    if (_rows != null) {
      map['rows'] = _rows?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// video_album_id : 1
/// title : "Pratistha Mohatsav 2023"
/// image : ""

class Rows {
  Rows({
      num? videoAlbumId, 
      String? title, 
      String? image,}){
    _videoAlbumId = videoAlbumId;
    _title = title;
    _image = image;
}

  Rows.fromJson(dynamic json) {
    _videoAlbumId = json['video_album_id'];
    _title = json['title'];
    _image = json['image'];
  }
  num? _videoAlbumId;
  String? _title;
  String? _image;
Rows copyWith({  num? videoAlbumId,
  String? title,
  String? image,
}) => Rows(  videoAlbumId: videoAlbumId ?? _videoAlbumId,
  title: title ?? _title,
  image: image ?? _image,
);
  num? get videoAlbumId => _videoAlbumId;
  String? get title => _title;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['video_album_id'] = _videoAlbumId;
    map['title'] = _title;
    map['image'] = _image;
    return map;
  }

}