import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workers_hub/constants/constants.dart';
import 'package:workers_hub/models/user_registration_model.dart';
import 'package:http/http.dart' as http;
import 'package:workers_hub/controllers/text_editing_controllers.dart';
import 'package:workers_hub/services/authentication_service.dart';
import 'package:workers_hub/views/refactoredWidgets/refactored_widgets.dart';
import 'package:workers_hub/views/splash_login_page&forot_p_w/login_page.dart';
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
  agreeTermsOnchangedFunction(value){
    agreeTerms=value;
    update();
  }

//shared preferenct to save whether the user is resgesterd as an Emplyer or not
  // user sign up button pressing events
  UserRegistrationModel ? _userRegistrationModel;
  //bool isEmployerRegestrationDone=false;
  AuthenticationServieces authService =AuthenticationServieces();

  signUpOnPressed() async {

    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String email = emailController.text;
    String phone = contactNumberController.text;
    String address = addressController.text;
    String password = confirmPasswordController.text;

    if(userSignUpFormKey.currentState!.validate() && agreeTerms==true){

      print(
          "first Name:$firstName, "
          "lastName:$lastName ,"
          "email:$email, "
          "phone:$phone,"
          "address:$address,"
          "password:$password");
      try{
       final result = await authService.userRegistration(
          firstName: firstName,
          lastName: lastName,
          email: email,
          contactNumber: phone,
          address: address,
          password: password,
        );
       Get.snackbar("", "Successfully regestered",
         backgroundColor: primeColor,
         titleText: refactText(text: "Successfully Regestered"),
         snackPosition: SnackPosition.BOTTOM,
       );
       //isEmployerRegestrationDone=true;
      // SharedPreferences pref =await SharedPreferences.getInstance();
      // pref.setBool("isEmployerRegestrationDone", isEmployerRegestrationDone);
       Future.delayed(const Duration(seconds: 1)).then((value) =>  Get.to(()=>BottomNav()))
           .then((value) => clearUserSignUpcontrollers());
       //clear data in controllers
       return result;
      }on SocketException{
        Get.snackbar("Something went wrong", "Check your internet Connection",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: primeColor,

        );
      }
      on HttpException{
        Get.snackbar("Network error", "Please try after some time",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: primeColor,

        );

      }
      on TimeoutException{
        Get.snackbar("Connection time out", "Please try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: primeColor,

        );
      }

      // //_userRegistrationModel = regestration;
      // update();

    }
    else if(agreeTerms==false){
      Get.snackbar(
          "", "Please accept terms and conditions to continue sign up",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: primeColor,
        colorText: white,
      );
    }

  }

  //profile controllers
logoutButtonOnClickedEvents()async{
    SharedPreferences pref =await SharedPreferences.getInstance();
    var checkEmployerLoggedIn =await pref.getBool("IsEmployerLoggedInTrue");
    checkEmployerLoggedIn=false;
    pref.setBool("IsEmployerLoggedInTrue", checkEmployerLoggedIn);
    Get.offAll(()=>LoginPage());
}



}
