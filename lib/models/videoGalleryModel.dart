/// _resultFlag : 1
/// error : ""
/// message : ""
/// count : 1
/// rows : [{"video_gallery_id":1,"videoalbum_id":1,"title":"Pratistha Mohatsav 2023","image":"168795512279download.jpg","url":"https://www.youtube.com/watch?v=92C4D3hjS9s","display_home":"1"}]

class VideoGalleryModel {
  VideoGalleryModel({
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

  VideoGalleryModel.fromJson(dynamic json) {
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
VideoGalleryModel copyWith({  num? resultFlag,
  String? error,
  String? message,
  num? count,
  List<Rows>? rows,
}) => VideoGalleryModel(  resultFlag: resultFlag ?? _resultFlag,
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

/// video_gallery_id : 1
/// videoalbum_id : 1
/// title : "Pratistha Mohatsav 2023"
/// image : "168795512279download.jpg"
/// url : "https://www.youtube.com/watch?v=92C4D3hjS9s"
/// display_home : "1"

class Rows {
  Rows({
      num? videoGalleryId, 
      num? videoalbumId, 
      String? title, 
      String? image, 
      String? url, 
      String? displayHome,}){
    _videoGalleryId = videoGalleryId;
    _videoalbumId = videoalbumId;
    _title = title;
    _image = image;
    _url = url;
    _displayHome = displayHome;
}

  Rows.fromJson(dynamic json) {
    _videoGalleryId = json['video_gallery_id'];
    _videoalbumId = json['videoalbum_id'];
    _title = json['title'];
    _image = json['image'];
    _url = json['url'];
    _displayHome = json['display_home'];
  }
  num? _videoGalleryId;
  num? _videoalbumId;
  String? _title;
  String? _image;
  String? _url;
  String? _displayHome;
Rows copyWith({  num? videoGalleryId,
  num? videoalbumId,
  String? title,
  String? image,
  String? url,
  String? displayHome,
}) => Rows(  videoGalleryId: videoGalleryId ?? _videoGalleryId,
  videoalbumId: videoalbumId ?? _videoalbumId,
  title: title ?? _title,
  image: image ?? _image,
  url: url ?? _url,
  displayHome: displayHome ?? _displayHome,
);
  num? get videoGalleryId => _videoGalleryId;
  num? get videoalbumId => _videoalbumId;
  String? get title => _title;
  String? get image => _image;
  String? get url => _url;
  String? get displayHome => _displayHome;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['video_gallery_id'] = _videoGalleryId;
    map['videoalbum_id'] = _videoalbumId;
    map['title'] = _title;
    map['image'] = _image;
    map['url'] = _url;
    map['display_home'] = _displayHome;
    return map;
  }

}