import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workers_hub/models/constants.dart';

class SignUpController extends GetxController{
  //static SignUpController instance = SignUpController();
  //password hiding and showing button function
    bool showPW=false;
  passwordShow(){
    if(showPW==false){
      showPW=true;
    }else{
      showPW=false;
    }
    update();
  }

  //check box for agree terms and conditions
bool agreeTerms =false;





}