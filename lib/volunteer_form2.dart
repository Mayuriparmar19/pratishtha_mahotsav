// import 'package:flutter/material.dart';
// import 'package:pratishtha_mahotsav/models/volunteer_registration_model.dart';
// import 'customwidgets/custom_text_form_dropdown.dart';
// import 'customwidgets/custom_text_form_field.dart';
// import 'form_validator.dart';
// import 'models/StatesModel.dart';
// import 'models/countries_model.dart';
// class VolunteerForm2 extends StatefulWidget {
//   const VolunteerForm2({Key? key,this.onPressed,required this.model, required this.countries, required this.states}) : super(key: key);
//   final VolunteerRegistrationModel model;
//   final VoidCallback? onPressed;
//   final Map<String,dynamic> countries;
//   final Map<String,dynamic> states;
//   @override
//   State<VolunteerForm2> createState() => _VolunteerForm2State();
// }
//
// class _VolunteerForm2State extends State<VolunteerForm2> {
//   ScrollController scrollCtrl = ScrollController();
//   CountriesModel? countries;
//   StatesModel? states;
//   bool isIndiaSelected = false;
//
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   int? countryId;
//   int? stateId;
//   TextEditingController addressCtrl = TextEditingController();
//   TextEditingController phoneCtrl = TextEditingController();
//   TextEditingController pinCodeCtrl =  TextEditingController();
//   TextEditingController cityCtrl = TextEditingController();
//   @override
//   void initState() {
//     // TODO: implement initState
//     countries = CountriesModel.fromJson(widget.countries);
//     states = StatesModel.fromJson(widget.states);
//     addressCtrl.text = widget.model.address??"";
//     countryId = widget.model.country;
//     if(countryId == countries?.rows?.firstWhere((element) => element.countryName.trim().toLowerCase() == "india")){
//       setState(() {
//       isIndiaSelected = true;
//       });
//       state =  widget.model.state;
//       city = widget.model.city;
//       pinCodeCtrl.text = widget.model.pinCode??"";
//     }else{
//       cityCtrl.text = widget.model.city??"";
//       isIndiaSelected = false;
//       state = null;
//       city = null;
//     }
//
//     phoneCtrl.text = widget.model.whatsappNumber??"";
//
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return  Container(
//       padding: const EdgeInsets.only(top: 16),
//       decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius:
//           BorderRadiusDirectional.vertical(top: Radius.circular(20))),
//       child: SingleChildScrollView(
//         controller: scrollCtrl,
//         physics: const ClampingScrollPhysics(),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(bottom: 16.0,left: 16,right: 16),
//
//               child: Form(
//                 key: formKey,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(25),
//                     color: const Color(0xffFFFFFF),
//
//                   ),
//                   width: size.width,
//                   child: Column(
//                     children: [
//                       CustomTextFormField(title: "Address",isRequired: true,max_line: 4,validator: (input) => Validator.notNullValidator(input),controller: addressCtrl),
//                       CustomTextFormDropDown(title: "Country",isRequired: true,items: countries!.rows!.map((e) => DropdownMenuItem<int>(child: Text(e.countryName??"",style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.normal,
//                           color: Color(0xFF323232),
//                           fontFamily: "Roboto"),))).toList(),validator: (input) => Validator.notNullValidator(input as String?),value: country,onChanged: (value){country = value;
//                         if(country?.toLowerCase() == "india"){
//                           setState(() {
//                           isIndiaSelected = true;
//                           cityCtrl.clear();
//                           });
//                         }else{
//                            setState(() {
//                            isIndiaSelected = false;
//                            state = null;
//                            });
//                         }
//
//                         },hint: "Select Country"),
//                       isIndiaSelected?Column(
//                         children: [
//                           CustomTextFormField(title: "Pin Code",isRequired: true,validator: (input) => Validator.notNullValidator(input),hint: "Enter Pin Code",inputType: TextInputType.number,maxLength: 6,controller: pinCodeCtrl),
//                           CustomTextFormDropDown(title: "State",isRequired: true,items: states!.rows!.map((e) => e.stateName!).toList(),validator: (input) => Validator.notNullValidator(input),value: state,onChanged: (value)=>state = value,hint: "Select State"),
//                           CustomTextFormDropDown(title: "City",isRequired: true,items: const ['Surat','Ahmedabad','Vadodara'],validator: (input) => Validator.notNullValidator(input),value: city,onChanged: (value)=>city = value,hint: "Select City"),
//                         ],
//                       ):CustomTextFormField(title: "Enter City Name", isRequired: true,validator: (input) => Validator.notNullValidator(input),controller: cityCtrl),
//                       CustomTextFormField(title: "What'sapp Number",isRequired: true,validator: (input) => Validator.notNullValidator(input),hint: "Enter What'sapp Number",inputType: TextInputType.number,maxLength: 10,controller: phoneCtrl),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       SizedBox(
//                         width: size.width,
//                         height: 54,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             if(formKey.currentState!.validate()){
//                               widget.model.address  = addressCtrl.text;
//                               widget.model.country = country;
//                               widget.model.pinCode = pinCodeCtrl.text;
//                               widget.model.state = isIndiaSelected?state:null;
//                               widget.model.city = isIndiaSelected?city:cityCtrl.text;
//                               widget.model.whatsappNumber  = phoneCtrl.text;
//                               widget.onPressed!();
//                             }else{
//                               ScaffoldMessenger.of(context).showSnackBar((const SnackBar(content: Text("Fill All Mandatory Fields with Valid Input!"),)));
//                               scrollCtrl.animateTo(scrollCtrl.initialScrollOffset, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
//                             }
//
//                           },
//
//                           child: const Text('Save & Next',
//                               style: TextStyle(
//                                   fontSize: 16, fontFamily: "Roboto-M")),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//
//
//             )
//           ],
//         ),
//       ),
//     );
//
//
//
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
