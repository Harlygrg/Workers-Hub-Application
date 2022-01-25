import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:workers_hub/models/constants.dart';
import 'package:workers_hub/views/refactoredWidgets/refactored_widgets.dart';
import 'package:workers_hub/views/user_screens/user_history.dart';
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
//Notifiacation button on appbar pressed

}