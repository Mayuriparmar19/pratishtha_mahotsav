/// _resultFlag : 1
/// error : ""
/// message : ""
/// count : 3
/// rows : [{"photo_gallery_id":2,"photoalbum_id":2,"title":"swami ji photos","image":"https://kanjiswami.org/pratishtha/uploads/photo_gallery/168803506246kanji_swami_1.jpg","display_home":"1"},{"photo_gallery_id":3,"photoalbum_id":2,"title":"swamiji photos 2","image":"https://kanjiswami.org/pratishtha/uploads/photo_gallery/168803524686kanji_swami_2.jpg","display_home":"2"},{"photo_gallery_id":4,"photoalbum_id":2,"title":"swami ji photos 3","image":"https://kanjiswami.org/pratishtha/uploads/photo_gallery/168803527362kanji_swami_3.jpg","display_home":"3"}]

class PhotosModel {
  PhotosModel({
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

  PhotosModel.fromJson(dynamic json) {
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
PhotosModel copyWith({  num? resultFlag,
  String? error,
  String? message,
  num? count,
  List<Rows>? rows,
}) => PhotosModel(  resultFlag: resultFlag ?? _resultFlag,
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

/// photo_gallery_id : 2
/// photoalbum_id : 2
/// title : "swami ji photos"
/// image : "https://kanjiswami.org/pratishtha/uploads/photo_gallery/168803506246kanji_swami_1.jpg"
/// display_home : "1"

class Rows {
  Rows({
      num? photoGalleryId, 
      num? photoalbumId, 
      String? title, 
      String? image, 
      String? displayHome,}){
    _photoGalleryId = photoGalleryId;
    _photoalbumId = photoalbumId;
    _title = title;
    _image = image;
    _displayHome = displayHome;
}

  Rows.fromJson(dynamic json) {
    _photoGalleryId = json['photo_gallery_id'];
    _photoalbumId = json['photoalbum_id'];
    _title = json['title'];
    _image = json['image'];
    _displayHome = json['display_home'];
  }
  num? _photoGalleryId;
  num? _photoalbumId;
  String? _title;
  String? _image;
  String? _displayHome;
Rows copyWith({  num? photoGalleryId,
  num? photoalbumId,
  String? title,
  String? image,
  String? displayHome,
}) => Rows(  photoGalleryId: photoGalleryId ?? _photoGalleryId,
  photoalbumId: photoalbumId ?? _photoalbumId,
  title: title ?? _title,
  image: image ?? _image,
  displayHome: displayHome ?? _displayHome,
);
  num? get photoGalleryId => _photoGalleryId;
  num? get photoalbumId => _photoalbumId;
  String? get title => _title;
  String? get image => _image;
  String? get displayHome => _displayHome;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['photo_gallery_id'] = _photoGalleryId;
    map['photoalbum_id'] = _photoalbumId;
    map['title'] = _title;
    map['image'] = _image;
    map['display_home'] = _displayHome;
    return map;
  }

}