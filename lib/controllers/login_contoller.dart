

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:workers_hub/constants/constants.dart';
import 'package:workers_hub/controllers/text_editing_controllers.dart';
import 'package:workers_hub/services/authentication_service.dart';
import 'package:workers_hub/views/splash_login_page&forot_p_w/login_page.dart';
import 'package:workers_hub/views/splash_login_page&forot_p_w/pw_reset.dart';
import 'package:workers_hub/views/user_screens/bottom_nav.dart';
import 'package:workers_hub/views/user_screens/user_sign_up.dart';
import 'package:workers_hub/views/worker_screens/bottom_nav_worker.dart';
import 'package:http/http.dart' as http;


class LoginController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
//getIsRegesteredDetails();
getLoginDetailFromSharedPref();
emailRetrive();
  }
//shared preference instance

  //splash screen controlls
  bool firstRegestration=false;


  // text editing controllers of login page
  final userLoginformKey = GlobalKey<FormState>();


//login button colorchage,user or worker login
    bool isWorker = true;


  workerButtonOnTap()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    isWorker=true;
    pref.setBool("isWorker", isWorker);
    print("------------------$isWorker");
    update();
  }

  emplrButtonOnTap()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    isWorker=false;
    pref.setBool("isWorker", isWorker);
    print("------------------$isWorker");
    update();
  }


  // Future<void> getIsRegesteredDetails()async{
  //
  //     bool getIsRegestered=false ;
  //     SharedPreferences pref =await SharedPreferences.getInstance();
  //
  //     if(pref.containsKey("isEmployerRegestrationDone")){
  //       if(pref.getBool("isEmployerRegestrationDone")!=null){
  //         getIsRegestered =pref.getBool("isEmployerRegestrationDone")!;
  //         if(getIsRegestered ==true){
  //           Get.to(()=>LoginPage());
  //         }
  //       }
  //     }
  //     else if(pref.containsKey("isWorkerRegestrationDone")){
  //       getIsRegestered =pref.getBool("isWorkerRegestrationDone")!;
  //       if(getIsRegestered ==true){
  //         Get.to(()=>LoginPage());
  //       }
  //     }
  //     update();
  // }

  Future getLoginDetailFromSharedPref()async{

    final SharedPreferences pref = await SharedPreferences.getInstance();

    if(pref.containsKey("IsEmployerLoggedInTrue")){
      final checkEmployerLoggedIn =await pref.getBool("IsEmployerLoggedInTrue");

      if(checkEmployerLoggedIn==true){
        Get.offAll(()=>BottomNav());
      }
    }


    else if(pref.containsKey("isWorkerLoggedInTrue")){
      print("-------------- isWorker");
      final checkWorkerLoggedIn   = await pref.getBool("isWorkerLoggedInTrue");
     if(checkWorkerLoggedIn==true){
      Get.offAll(()=>const WorkerBottomNav());
    }
    }
    else{
      //LoginPage();
      return null;
    }
  }

//change regester as employer or worker
 // user login click operations

  bool employerLogin=false;
  bool workerLogin  =false;


  AuthenticationServieces servieces =AuthenticationServieces();

    loginButtonOnClick()async{

    SharedPreferences pref =await SharedPreferences.getInstance();
    pref.setBool("isWorker", false);
      final isWorkerSelected =await pref.get("isWorker");

      String loginEmail = userLoginMailController.text;
      String loginPassword= userLoginPasswordController.text;
      pref.setString("userEmail", loginEmail);
      if(isWorkerSelected==false){
        if(userLoginformKey.currentState!.validate()){
          servieces.userLogin(email: loginEmail, password: loginPassword);
        }

      }
      else{

        if(userLoginformKey.currentState!.validate()){
          Get.to(()=>const WorkerBottomNav());

        }

      }

    }
    //forgot password page controllers
  //Confirm email to send OTP for verification a
confirmEmail(){
      Get.snackbar("", "",
        messageText: Text(
          "An OTP has been sent to your email, please verify",
          style:TextStyle(fontSize: 13.sp,color: white),),
        colorText: white,
        backgroundColor: primeColor,
        snackPosition: SnackPosition.BOTTOM,
      );
      Future.delayed(
          const Duration(seconds: 2))
          .then((value) =>  Get.to(()=>PWreset()));
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
      messageText: Text("Your password has been changed login again.",
        style:TextStyle(fontSize: 13.sp,color: white),),
      colorText: white,
      backgroundColor: primeColor,
      snackPosition: SnackPosition.BOTTOM,

    );
    Future.delayed(
        const Duration(seconds: 2)).then((value) =>  Get.to(()=>LoginPage()));
  }

  //register button on click event
regestrClick(){

  Get.to(()=>UserSignUp());
    // if(isWorker==true){
    //   Get.offAll(()=>WorkerSignUp());
    // }else{
    //   Get.offAll(()=>UserSignUp());
    // }
    update();
}

//user can move to first page where he can register as worker or employer
// firstPage()async{
//     SharedPreferences pref =await SharedPreferences.getInstance();
//
// }
//first page to login page movement when already a user
// alreadyUser(){
//     if(isWorker)
// }
  }