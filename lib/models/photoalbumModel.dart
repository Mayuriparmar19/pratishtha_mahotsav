/// _resultFlag : 1
/// error : ""
/// message : ""
/// count : 2
/// rows : [{"photo_album_id":1,"title":"Pratistha Mohtsav 2023","image":"https://kanjiswami.org/pratishtha/uploads/photo_album/168795516754download.jpg"},{"photo_album_id":2,"title":"kanji Swami","image":"https://kanjiswami.org/pratishtha/uploads/photo_album/168803486049kanji_swami.jpg"}]

class PhotoalbumModel {
  PhotoalbumModel({
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

  PhotoalbumModel.fromJson(dynamic json) {
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
PhotoalbumModel copyWith({  num? resultFlag,
  String? error,
  String? message,
  num? count,
  List<Rows>? rows,
}) => PhotoalbumModel(  resultFlag: resultFlag ?? _resultFlag,
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

/// photo_album_id : 1
/// title : "Pratistha Mohtsav 2023"
/// image : "https://kanjiswami.org/pratishtha/uploads/photo_album/168795516754download.jpg"

class Rows {
  Rows({
      num? photoAlbumId, 
      String? title, 
      String? image,}){
    _photoAlbumId = photoAlbumId;
    _title = title;
    _image = image;
}

  Rows.fromJson(dynamic json) {
    _photoAlbumId = json['photo_album_id'];
    _title = json['title'];
    _image = json['image'];
  }
  num? _photoAlbumId;
  String? _title;
  String? _image;
Rows copyWith({  num? photoAlbumId,
  String? title,
  String? image,
}) => Rows(  photoAlbumId: photoAlbumId ?? _photoAlbumId,
  title: title ?? _title,
  image: image ?? _image,
);
  num? get photoAlbumId => _photoAlbumId;
  String? get title => _title;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['photo_album_id'] = _photoAlbumId;
    map['title'] = _title;
    map['image'] = _image;
    return map;
  }

}