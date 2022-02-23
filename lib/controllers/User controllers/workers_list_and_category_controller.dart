import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:workers_hub/constants/constants.dart';
import 'package:workers_hub/views/refactoredWidgets/refactored_widgets.dart';
import 'package:workers_hub/views/user_screens/user_history.dart';
import 'package:workers_hub/views/worker_screens/bottom_nav_worker.dart';
import 'package:workers_hub/views/worker_screens/worker_sign_up_page.dart';
class WorkerCategoryController extends GetxController{

  ButtonRefact button = ButtonRefact();
  FormFieldRefact formFieldRefact =FormFieldRefact();
  WidgetRefact widget = WidgetRefact();

  //category list view
  List images(){
    List img =[carpenter,elect,mason,maid,plumber];
    update();
    return img;
  }
 List catName(){
   List categoryName = ["carpenter","electrician","mason","maid","plumber"];
   update();
   return categoryName;
 }
 //category and place select dropdown
  //initial select value
  String selectedDistName = "Wayanad";
  String selectedStateName="Kerala";
  //items lists
  List district =["Wayanad","kasargod","malapuram","Kozhikode",];
  List state =["Kerala","Karnataka","Tamil Nadu","Kashmir"];
  //dropdown On changed function
  newVal(newValue){
    selectedStateName =newValue!;
    update();
  }
  newDist(newValue){
    selectedDistName =newValue!;
     update();
  }
  //history button onPressd
 history(){
    Get.to(()=>UserHistory());
 }

  //enddrawer controlls
  registerAsWorkerOnTap()async{
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setBool("RegesteredAsWorker", false);

    if(pref.containsKey("RegesteredAsWorker")){

      if(pref.getBool("RegesteredAsWorker")==true){
        Get.to(WorkerBottomNav());
      }
      //remove this else after building app
      else{
        Get.to(WorkerSignUp());
      }
    }else{
      Get.to(WorkerSignUp());
    }


  }//

  bool workerRegnDone=false;
 Future<bool>isUserRegisteredAsWorker()async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  update();
  if(pref.containsKey("RegesteredAsWorker")){
    workerRegnDone=pref.getBool("RegesteredAsWorker")!;
    //update();
    print("-------------1--------${workerRegnDone}");
    return workerRegnDone;
  }
    else{
      //update();
      print("-------------2--------${workerRegnDone}");
    return workerRegnDone;
  }
}



//Notifiacation button on appbar pressed

}