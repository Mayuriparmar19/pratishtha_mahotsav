import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import '../models/photoalbumModel.dart';
import '../models/photosModel.dart';
import '../models/user_details_model.dart';
import '../models/user_registration_model.dart';
import '../models/videoAlbumModel.dart';
import '../models/videoGalleryModel.dart';
import '../customwidgets/back_pressed_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/signup_model.dart';
import 'base_url.dart';

class ApiHelper {
  static  void resetUserDetailsModel(){
    ApiHelper.detailsModel = UserDetailsModel();
  }
  static UserDetailsModel detailsModel = UserDetailsModel();
  static Future<Map<String, dynamic>> getApiData(
      String uri, BuildContext context) async {
    try {
      http.Response res = await http.get(Uri.parse(uri));
      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      } else {
        // ignore: use_build_context_synchronously
        BackPressedDialog(
            "Failed to retrieve API data. Status code: ${res.statusCode}",
            context);
        throw Exception(
            'Failed to retrieve API data. Status code: ${res.statusCode}');
      }
    } catch (e) {
      if (e is http.ClientException) {
        BackPressedDialog(
            "Unable to connect to the server. Please check your internet connection.",
            context);
        throw Exception(
            'Unable to connect to the server. Please check your internet connection.');
      } else {
        throw Exception('An error occurred while fetching API data: $e');
      }
    }
  }

  static Future<bool> postUserRegistrationData(
      {required UserRegistrationModel model}) async {
    try {
      var response = await http.post(Uri.parse(AppUrl.userRegistrationApi),
          body: jsonEncode(model.toJson()),headers: {"Content-Type": "application/json",});
      if (response.statusCode == 200) {
       // print(jsonEncode(response.body));
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
  static verifyOtp({required String mobile, required String otp}) async {
    try {
      var response = await http.post(Uri.parse(AppUrl.verifyOtpApi),
          body: jsonEncode({"mobile": mobile, "otp": otp}));
      Map<String, dynamic> data = jsonDecode(response.body);
     // print(response.body);
      if (response.statusCode == 200 && data["rows"]['resultFlag'] == "1") {
       // print(response.body);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<PhotoalbumModel> getPhotosAlbum() async {
    PhotoalbumModel model = PhotoalbumModel();
    var response = await http.get(Uri.parse(AppUrl.photoAlbumApi));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      model = PhotoalbumModel.fromJson(data);
      return model;
    }
    return model;
  }

  static Future<VideoAlbumModel> getVideosAlbumCall() async {
    VideoAlbumModel model = VideoAlbumModel();
    try {
      var response = await http.get(Uri.parse(AppUrl.videoAlbumApi));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        model = VideoAlbumModel.fromJson(data);
        return model;
      }
      return model;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<PhotosModel> getPhotosCall({num? id}) async {
    PhotosModel model = PhotosModel();
    try {
      String url = AppUrl.photoListApi + id.toString();

      final response = await http.get(Uri.parse(url));
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        model = PhotosModel.fromJson(data);

        return model;
      }
      return model;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<VideoGalleryModel> getVideosCall({num? id}) async {
    VideoGalleryModel model = VideoGalleryModel();
    try {
      String url = AppUrl.videoGalleryListApi + id.toString();
      final response = await http.get(Uri.parse(url));
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        model = VideoGalleryModel.fromJson(data);

        return model;
      }
      return model;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<UserDetailsModel> getUserDetailCall(
      {required String token}) async {
    String url = AppUrl.getProfileApi + token;
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        detailsModel = UserDetailsModel.fromJson(data);
        return detailsModel;
      }
      return detailsModel;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<bool> signUpCall(
      {required SignUpModel model, required String otp}) async {
    try {
      var response =
          await http.post(Uri.parse(AppUrl.signUpApi), body: <String, dynamic>{
        "first_name": model.first_name,
        "middle_name": model.middle_name,
        "last_name": model.last_name,
        "mobile": model.mobile,
        "otp": otp,
        "password": model.password
      });
      if (response.statusCode == 200) {
        loginCall(mobile: model.mobile, password: model.password);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<bool> sendOtpCall({required String mobile}) async {
    try {
      var response = await http
          .post(Uri.parse(AppUrl.sendOtpApi), body: {'mobile': mobile});
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<String> loginCall(
      {required String mobile, required String password}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      var response = await http.post(Uri.parse(AppUrl.loginApi),
          body: {'mobile': mobile, 'password': password});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        String token = data!["rows"][0]["token"];
        preferences.setString("token", token);

        return token;
      }
      return "";
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      throw Exception(e);
    }
  }

  static Future<bool> verifyOtpCall(
      {required String mobile,
      required String otp,
      required SignUpModel model}) async {
    try {
      var response = await http.post(Uri.parse(AppUrl.verifyOtpApi),
          body: {'mobile': mobile, 'otp': otp});
      if (response.statusCode == 200) {
        bool success = await signUpCall(model: model, otp: otp);

        if (success == true) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
