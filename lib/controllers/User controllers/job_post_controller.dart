

import 'package:get/get.dart';

class JobPostController extends GetxController{

  //job category selection dropdown list

  //
  String selectedCat = "Plumber";
  List jobCategories =["Plumber","Mason","Maid","Carpenter"];
  newVal(newValue){
    selectedCat =newValue!;
     update();
  }
}