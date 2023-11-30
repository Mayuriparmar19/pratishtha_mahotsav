import 'package:flutter/material.dart';
import 'custom_text_form_label.dart';

class CustomTextFormDropDown extends StatelessWidget {
  const CustomTextFormDropDown(
      {Key? key,
      required this.title,
      required this.isRequired,
      required this.items,
      this.hint,
      this.validator,
      this.value,
      required this.onChanged})
      : super(key: key);
  final String title;
  final bool isRequired;
  final List<DropdownMenuItem<int>> items;
  final String? hint;
  final FormFieldValidator<int>? validator;
  final ValueChanged<int?> onChanged;
  final int? value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextFormFieldLabel(title: title, isRequired: isRequired),
          DropdownButtonFormField(
            isExpanded: true,
              value: value,
              validator: validator,
              icon: const Icon(Icons.keyboard_arrow_down_rounded,
                  color: Color(0xFF848484), size: 30),
              hint: Text(hint ?? "",style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFFC1C1C1),
                  fontFamily: "Roboto-R")),
              decoration: const InputDecoration(

                hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFFC1C1C1),
                    fontFamily: "Roboto")
              ),
              items: items,
              onChanged: onChanged)
        ],
      ),
    );
  }
}
