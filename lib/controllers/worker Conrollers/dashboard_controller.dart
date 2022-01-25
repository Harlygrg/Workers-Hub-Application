import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workers_hub/views/worker_screens/worker_dashboard.dart';
import 'package:workers_hub/views/worker_screens/worker_history.dart';
import 'package:workers_hub/views/worker_screens/worker_profile.dart';

class DashBoardController extends GetxController{

  //availiability saying switch
  bool isAvailable =true;
  onChanged(value){
    isAvailable = value;
    update();
  }
  //worker bottom navigation page
  int currentIndex=0;
  final List<Widget> screens=[
    WorkerDashboard(),
    WorkerHistory(),
    WorkerProfile(),
  ];

  onTap(index){
    currentIndex=index;
    update();
  }
// work deatails editing page controller

bool isNegotiable= false;
  chekNegotiable(value){
    isNegotiable=value;
    update();
  }
}