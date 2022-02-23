import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String _userMail="";
emailRetrive() async{

  SharedPreferences pref =await SharedPreferences.getInstance();
  _userMail=pref.getString("userEmail")!;
  print(_userMail);
  return _userMail;
}

  final firstNameController= TextEditingController();
  final lastNameController= TextEditingController();
  final emailController= TextEditingController(text:_userMail);
  final contactNumberController= TextEditingController();
  final addressController= TextEditingController();
  final passwordController= TextEditingController();
  final confirmPasswordController= TextEditingController();

// user login controllers

  final userLoginMailController = TextEditingController(text: "hhg@gmail.com");
  final userLoginPasswordController =TextEditingController(text: "1111111@");

//worker controllers
  final operationalCityController= TextEditingController();
  final descriptionController   = TextEditingController();
//

  clearUserSignUpcontrollers(){
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    contactNumberController.clear();
    addressController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }


//user  text editing controllers
// String userMail="";
// userEmail()async{
//
//   SharedPreferences pref =await SharedPreferences.getInstance();
//   userMail=pref.getString("userEmail")!;
//
// }

// final firstNameController= TextEditingController();
// final lastNameController= TextEditingController();
// final emailController= TextEditingController(text:userMail);
// final contactNumberController= TextEditingController();
// final addressController= TextEditingController();
// final passwordController= TextEditingController();
// final confirmPasswordController= TextEditingController();
//
// // user login controllers
//
// final userLoginMailController = TextEditingController(text: "hhg@gmail.com");
// final userLoginPasswordController =TextEditingController(text: "1111111@");
//
// //worker controllers
// final operationalCityController= TextEditingController();
// final descriptionController   = TextEditingController();
// //
//
// clearUserSignUpcontrollers(){
//   firstNameController.clear();
//   lastNameController.clear();
//   emailController.clear();
//   contactNumberController.clear();
//   addressController.clear();
//   passwordController.clear();
//   confirmPasswordController.clear();
// }