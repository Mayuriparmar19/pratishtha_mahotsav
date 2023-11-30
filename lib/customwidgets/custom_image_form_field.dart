import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'custom_text_form_label.dart';
import 'dart:io';
class CustomImageFormField extends StatelessWidget {
  final ValueChanged<String?> onChanged;
  final String? initValue;
  final String title;
   CustomImageFormField({Key? key,required this.onChanged, required this.initValue, required this.title}) : super(key: key);

 String? imageValue;


  @override
  Widget build(BuildContext context) {
    imageValue = initValue;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         CustomTextFormFieldLabel(title: title, isRequired: true),
        SizedBox(
          height: width * 0.45,
          width: double.infinity,
          child: Row(
            children: [
              imageValue == null ? Image.asset("assets/images/image_place_holder.png",
                  width: width * 0.45,
                  height: width * 0.45,
                  fit: BoxFit.fill) :

              Container(
                color: const Color(0xFF8D4600),
                padding: const EdgeInsets.all(4.0),
                child: Image.memory(base64.decode(initValue!), width: width * 0.45,
                    height: width * 0.45,
                    fit: BoxFit.fill),
              ),
              const SizedBox(width: 16,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                        "Note:\nPhoto size up to 5 MB max.\nSupported Formats:\njpg, jpeg, png",
                        style: TextStyle(color: Color(0xFF848484),
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            fontFamily: "Roboto")),
                    SizedBox(height: width * 0.03,),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16),
                          side: const BorderSide(
                              color: Color(0xFF8D4600), width: 1),
                          backgroundColor: const Color(0xFFFFFFFF),
                          foregroundColor: const Color(0xFF8D4600),
                        ),
                        onPressed: () {
                          showDialog(context: context, builder: (context) {
                            return AlertDialog(
                              title: const Text("Choose Image Source"),
                              actions: [
                                TextButton(onPressed: () => chooseImage(context),
                                  child: const Text("Gallery",style: TextStyle(color: Color(0xFF8D4600),fontSize: 16,fontFamily: "Roboto-M")),),
                                TextButton(onPressed: () => takeImage(context),
                                    child: const Text("Camera",style: TextStyle(color: Color(0xFF8D4600),fontSize: 16,fontFamily: "Roboto-M"),)),
                              ],
                            );
                          },);
                        }, child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Upload Photo", style: TextStyle(fontSize: 16)),
                      ],
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32,),
      ],
    );
  }

  void takeImage(BuildContext context) async {
    Navigator.pop(context);
    var status = await Permission.camera.status;
    if (status.isGranted) {
      XFile? pickedFile = await ImagePicker().pickImage(
          source: ImageSource.camera,
          requestFullMetadata: true,
          imageQuality: 70
      );
      if (pickedFile != null) {
          File? imageFile = File(pickedFile.path);
          Uint8List? bytes0 = await imageFile.readAsBytes();
          String base64String = base64.encode(bytes0);
          onChanged(base64String);
          imageValue = base64String;
      }
    } else {
      await Permission.camera.request();
      status = await Permission.camera.status;
      if (status.isGranted) {
        XFile? pickedFile = await ImagePicker().pickImage(
            source: ImageSource.camera,
            requestFullMetadata: true,
        );
        if (pickedFile != null) {
            File? imageFile= File(pickedFile.path);
            Uint8List? bytes = await imageFile.readAsBytes();
            String base64String = base64.encode(bytes);
            onChanged(base64String);
            imageValue = base64String;
        }
      }
    }
  }

  void chooseImage(BuildContext context) async {
    Navigator.pop(context);
    var status = await Permission.storage.status;
    if (status.isGranted) {
      XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        requestFullMetadata: true
      );
      if (pickedFile != null) {
          File? imageFile = File(pickedFile.path);
          Uint8List? bytes = await imageFile.readAsBytes();
          String base64String = base64.encode(bytes);
          onChanged(base64String);
          imageValue = base64String;

      }
    } else {
      await Permission.storage.request();
      status = await Permission.storage.status;
      if (status.isGranted) {
        XFile? pickedFile = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          requestFullMetadata: true,
        );
        if (pickedFile != null) {
            File? imageFile= File(pickedFile.path);
            Uint8List? bytes = await imageFile.readAsBytes();
            String base64String = base64.encode(bytes);
            onChanged(base64String);
            imageValue = base64String;
        }
      }
    }
  }
}
