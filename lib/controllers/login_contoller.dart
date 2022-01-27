import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';
import 'package:workers_hub/constants.dart';
import 'package:workers_hub/views/splash_login_page&forot_p_w/login_page.dart';
import 'package:workers_hub/views/splash_login_page&forot_p_w/pw_reset.dart';
import 'package:workers_hub/views/user_screens/bottom_nav.dart';
import 'package:workers_hub/views/user_screens/user_sign_up.dart';
import 'package:workers_hub/views/worker_screens/bottom_nav_worker.dart';
import 'package:workers_hub/views/worker_screens/worker_sign_up_page.dart';

class LoginController extends GetxController{
  // text editing controllers of login page
  final mailController= TextEditingController();
  final passwordController =TextEditingController();


//login button colorchage,user or worker login
    bool isWorker = true;
    workerButtonOnTap(){
      isWorker=true;
      print("------------------$isWorker");
      update();
    }

    emplrButtonOnTap(){
      isWorker=false;
      print("------------------$isWorker");
      update();
    }
    //login button on clik controllers

    loginClick(){
      if(isWorker==false){

        Get.to(()=>BottomNav());
      }
      else{
        Get.to(()=>WorkerBottomNav());
      }

    }


    //forgot password page controllers
  //Confirm email to send OTP for verification a
confirmEmail(){
      Get.snackbar("", "",
        messageText: Text("An OTP has been sent to your email, please verify",
          style:TextStyle(fontSize: 13.sp,color: white),),
        colorText: white,
        backgroundColor: primeColor,
        snackPosition: SnackPosition.BOTTOM,

      );
      Future.delayed(const Duration(seconds: 2)).then((value) =>  Get.to(()=>PWreset()));

}
//password showing icon function
    bool passwordShow=false;

  showPW(){
    if(passwordShow==false ){
      passwordShow=true;

    }else{
      passwordShow=false;

    }
      update();
  }

//reset password controller

  resetPW(){
    Get.snackbar("", "",
      messageText: Text("Yur password has been changed login again.",
        style:TextStyle(fontSize: 13.sp,color: white),),
      colorText: white,
      backgroundColor: primeColor,
      snackPosition: SnackPosition.BOTTOM,

    );
    Future.delayed(const Duration(seconds: 2)).then((value) =>  Get.to(()=>LoginPage()));
  }

  //register button on click event
regestrClick(){
    if(isWorker==true){
      Get.to(()=>WorkerSignUp());
    }else{
      Get.to(()=>UserSignUp());
    }
    update();
}

  }