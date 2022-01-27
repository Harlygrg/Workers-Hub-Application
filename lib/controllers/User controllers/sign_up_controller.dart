import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:workers_hub/constants.dart';
import 'package:workers_hub/models/user_registration_model.dart';
import 'package:http/http.dart' as http;
import 'package:workers_hub/controllers/text_editing_controllers.dart';
import 'package:workers_hub/views/user_screens/bottom_nav.dart';

class SignUpController extends GetxController {
  //static SignUpController instance = SignUpController();

  //Global key for signup form
  final userSignUpFormKey = GlobalKey<FormState>();

  //password hiding and showing button function
  bool showPW = false;

  passwordShow() {
    if (showPW == false) {
      showPW = true;
    } else {
      showPW = false;
    }
    update();
  }

  //check box for agree terms and conditions
  bool agreeTerms = false;
  UserRegistrationModel ? _userRegistrationModel;

  Future<UserRegistrationModel?> userRegistration({
   // required String id,
    required String password,
    required String email,
    required String firstName,
    required String lastName,
    required String contactNumber,
    required String address,
    // required DateTime dateJoined,
    // required DateTime lastLogin,
    // required bool isADmin,
    // required bool  isActive,
    // required bool isStaff,
    // required bool isSuperuser,

  }) async {
    try{
      final apiResponse = await http.post(
          Uri.parse(userRegApiUrl),
          body: {
            "password": password,
            "email": email,
            "first_name": firstName,
            "last_name": lastName,
            "phone": contactNumber,
            "address": address,
          }
      );
      print("-----------------$apiResponse-------------------");
      print("-----------------post successful-------------------");
      Get.to(()=>BottomNav());
    }catch(e){
      print("-----------------post Failed-------------------");
      print("----------------------$e");
      print("-----------------post Failed-------------------");
    }
  }

  // user sign up button pressing events
  signUpOnPressed() async {
    if(userSignUpFormKey.currentState!.validate() && agreeTerms==true){
      //final UserRegistrationModel? regestration=
      print("first Name:${firstNameController.text}, "
          "lastName:${lastNameController.text} ,"
          "email:${emailController.text}, "
          "phone:${contactNumberController.text},"
          "address:${addressController.text},"
          "password:${confirmPasswordController.text}");
      await userRegistration(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          contactNumber: contactNumberController.text,
          address: addressController.text,
          password: confirmPasswordController.text,
      );
      // //_userRegistrationModel = regestration;
      // update();

    }

  }
}
