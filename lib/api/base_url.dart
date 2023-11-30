class AppUrl{
  static const String baseurl = "https://kanjiswami.org/pratishtha/rest/apiv1/";

  static const String signUpApi = "${baseurl}signup";
  static const String districtsApi = "${baseurl}districts";
  static const String statesApi = "${baseurl}states";
  static const String professionsApi = "${baseurl}professions";
  static const String foodApi = "${baseurl}food-preferences";
  static const String countriesApi = "${baseurl}countries";
  static const String photoAlbumApi = "${baseurl}photo_album";
  static const String photoListApi = "${baseurl}photo_gallery/?photoalbum_id=";
  static const String videoAlbumApi = "${baseurl}video_album";
  static const String videoGalleryListApi = "${baseurl}video_gallery/?videoalbum_id=";
  static const String sendOtpApi = "${baseurl}sendotp";
  static const String verifyOtpApi = "${baseurl}verifyotp";
  static const String editProfileApi = "${baseurl}editprofile";
  static const String loginApi = "${baseurl}login";
  static const String getProfileApi = "${baseurl}getprofile/?token=";
  static const String volunteersRegistrationApi = "${baseurl}volunteers";
  static const String userRegistrationApi = "${baseurl}user_registration";
}