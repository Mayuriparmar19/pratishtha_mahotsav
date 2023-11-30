import 'package:flutter/material.dart';
import 'custom_text_form_label.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({Key? key, required this.title, required this.isRequired,this.hint,this.prefix_icon,this.suffix_icon,this.max_line,this.controller,this.validator,this.maxLength,this.inputType})
      : super(key: key);
  final String title;
  final bool isRequired;
  final String? hint;
  final Widget? prefix_icon;
  final Widget? suffix_icon;
  final int? max_line;
  final int? maxLength;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextFormFieldLabel(title: title, isRequired: isRequired),
          TextFormField(
            keyboardType: inputType,
            maxLength: maxLength,
            validator: validator,
            controller: controller,
            decoration: InputDecoration(hintText: hint,hintStyle: const TextStyle(fontFamily: "Roboto",fontWeight: FontWeight.normal,color: Color(0xFFC1C1C1),fontSize: 16),suffixIcon:suffix_icon ,counterText: ""),
            maxLines: max_line??1,
          ),
        ],
      ),
    );
  }
}
