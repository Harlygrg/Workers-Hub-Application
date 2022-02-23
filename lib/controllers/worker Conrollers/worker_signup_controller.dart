

//
// import 'dart:async';
// import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workers_hub/constants/constants.dart';
import 'package:workers_hub/controllers/text_editing_controllers.dart';
import 'package:workers_hub/services/authentication_service.dart';
import 'package:workers_hub/views/multi_select_dropdown.dart';
import 'package:workers_hub/views/refactoredWidgets/refactored_widgets.dart';
import 'package:workers_hub/views/worker_screens/bottom_nav_worker.dart';
class WorkerSignUpController extends GetxController{

  //worker signup controllers
  //Form key for worker form
  final workerRegestrationFormKey = GlobalKey<FormState>();



 bool isWorkerRegestrationDone = false;
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
  File ?file;
  String ?filePath;
   XFile? image;
  pickIdProof()async{
    final ImagePicker _picker = ImagePicker();
    image = await _picker.pickImage(source: ImageSource.gallery);
    // image = await FilePicker.platform.pickFiles(allowMultiple: false,type: FileType.image);

    if (image != null) {
       //file = File(image!.files.single.path.toString());
      print("file path=============$image");
    } else {
      // User canceled the picker
      print("No image selected");
    }
  }
//register button on pressed
  var context;
  AuthenticationServieces authService =AuthenticationServieces();
  Dio? _dio;
regesterButtonOnPressed()async{
  // print("regester button tapped------------file check-----------------------");
  var validate = workerRegestrationFormKey.currentState!.validate();
  String mail = emailController.text;
  String city = operationalCityController.text;
  String discription = descriptionController.text;

  print("------_________---------$selectedSkills");
  print("$file------------file check-----------------------");
  print("first section working1111-----------------------------------");
  if(validate ){
    print("first section working-----------------------------------");
    if(agreeTerms==true){
      print("second section working-----------------------------------");
      print(" image: $image-----------------------------------");
        authService.workerRegistration(
            city: city,
            discription: discription,
            skills: selectedSkills,
            subscription: currentSubscription,
            image:image,
            //fileName: "image",


  //'data:image/$fileExtension;base64,$base64Image'
        );
        print("$mail,----  $city,-----$discription,-----$currentSubscription,---$file");


        //Get.to(()=>WorkerBottomNav());


    }else{
      Get.snackbar(
        "", "Please accept terms and conditions to continue sign up",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: primeColor,
        colorText: white,
      );
    }


  }
  print("not api------------");

  //Get.to(()=>WorkerBottomNav());

}

}





