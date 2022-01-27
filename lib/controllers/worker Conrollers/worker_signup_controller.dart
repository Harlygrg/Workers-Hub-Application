


import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkerSignUpController extends GetxController{

  //worker signup controllers


  //password show and hide functions
  bool showPW=false;
  passwordShow(){
    if(showPW==false){
      showPW=true;
    }else{
      showPW=false;
    }
    update();
  }


  //terms and conditions check box
  bool agreeTerms=false;


  //dropdown list
final subscriptionItems=["Monthly Subscription","Yearly Subscription"];
String currentSubscription ="Monthly Subscription";


// category selection button On changed
int amount=250;
onChanged(value){
  currentSubscription=value;
  if(currentSubscription=="Monthly Subscription"){
    amount=250;
  }else{
    amount=1000;
  }
  update();
}

// user file picker
  pickIdProof()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path.toString());
      print("file path=============$file");
    } else {
      // User canceled the picker
    }
  }


}




