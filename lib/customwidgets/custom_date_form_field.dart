import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'custom_text_form_label.dart';
class CustomDateFormField extends StatefulWidget {
  const CustomDateFormField({Key? key,required this.title, required this.isRequired,this.hint,this.prefix_icon,this.suffix_icon,this.controller,this.validator, this.lastDate}) : super(key: key);
  final String title;
  final bool isRequired;
  final String? hint;
  final Widget? prefix_icon;
  final Widget? suffix_icon;
  final TextEditingController? controller;
  final DateTime? lastDate;
  final FormFieldValidator<String>? validator;
  @override
  State<CustomDateFormField> createState() => _CustomDateFormFieldState();
}

class _CustomDateFormFieldState extends State<CustomDateFormField> {
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextFormFieldLabel(title: widget.title, isRequired: widget.isRequired),
          TextFormField(
            validator: widget.validator,
            controller: widget.controller,
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  builder: (context, child) =>Theme(data: Theme.of(context).copyWith(
                    colorScheme: const ColorScheme.light(
                      primary: Color(0xFF8D4600)
                    )
                  
                  ), child: child!),
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  //DateTime.now() - not to allow to choose before today.
                  lastDate: widget.lastDate ?? DateTime(2100));

              if (pickedDate != null) {

                String formattedDate =
                DateFormat('dd-MM-yyyy').format(pickedDate);
                setState(() {
                  widget.controller?.text = formattedDate; //set output date to TextField value.
                });
              } else {}
            },

            decoration: InputDecoration(hintText: widget.hint,hintStyle: const TextStyle(fontFamily: "Roboto",fontWeight: FontWeight.normal,color: Color(0xFFC1C1C1),fontSize: 16),suffixIcon:widget.suffix_icon ,contentPadding: EdgeInsets.symmetric(horizontal: 12,vertical: 16)),
            maxLines:1,
          ),
        ],
      ),
    );
  }
}

// class CustomDateFormField extends StatelessWidget {
//   CustomDateFormField({Key? key, required this.title, required this.isRequired,this.hint,this.prefix_icon,this.suffix_icon})
//       : super(key: key);
//   String title;
//   bool isRequired;
//   String? hint;
//   Widget? prefix_icon;
//   Widget? suffix_icon;
//   @override
//   Widget build(BuildContext context) {
//
//   }
// }
