import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'custom_text_form_label.dart';
class CustomTimeFormField extends StatefulWidget {
  const CustomTimeFormField({Key? key,required this.title, required this.isRequired,this.hint,this.prefix_icon,this.suffix_icon,this.controller,this.validator}) : super(key: key);
  final String title;
  final bool isRequired;
  final String? hint;
  final Widget? prefix_icon;
  final Widget? suffix_icon;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  @override
  State<CustomTimeFormField> createState() => _CustomTimeFormFieldState();
}

class _CustomTimeFormFieldState extends State<CustomTimeFormField> {

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
              TimeOfDay? pickedTime =  await showTimePicker(
                builder: (context, child) =>Theme(data: Theme.of(context).copyWith(
                    colorScheme: const ColorScheme.light(
                        primary: Color(0xFF8D4600)
                    )

                ), child: child!),
                initialTime: TimeOfDay.now(),
                context: context,

              );

              if (pickedTime != null) {

                String formattedTime = pickedTime.format(context);
                setState(() {
                  widget.controller?.text = "${pickedTime.hour.toString().padLeft(2, "0")}:${pickedTime.minute.toString().padLeft(2, "0")}"; //set output date to TextField value.
                });
              } else {}
            },

            decoration: InputDecoration(hintText: widget.hint,hintStyle: const TextStyle(fontFamily: "Roboto",fontWeight: FontWeight.normal,color: Color(0xFFC1C1C1),fontSize: 16),suffixIcon:widget.suffix_icon,contentPadding: EdgeInsets.symmetric(horizontal: 12,vertical: 16) ),
            maxLines:1,
          ),
        ],
      ),
    );
  }
}
