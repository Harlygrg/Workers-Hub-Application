
import 'package:get/get.dart';

class WorkerDetailsPageController extends GetxController{

  //function to show comments
  bool showComments =false;
  comments(){
    if(showComments==false){
      showComments =true;
    }else{
      showComments =false;
    }
    update();
  }
}