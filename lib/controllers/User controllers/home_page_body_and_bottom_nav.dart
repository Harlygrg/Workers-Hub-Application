

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:workers_hub/views/user_screens/post_job_page.dart';
import 'package:workers_hub/views/user_screens/profile_page.dart';
import 'package:workers_hub/views/user_screens/user_home_page.dart';

class HomePageController extends GetxController{

//bottom navigation bar controlls
int currentIndex=0;
final List<Widget> screens=[
  UserHomePage(),
  PostJob(),
  UserProfile(),
];

onTap(index){
  currentIndex=index;
  update();
}

}