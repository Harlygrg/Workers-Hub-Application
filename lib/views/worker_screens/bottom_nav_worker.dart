import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:workers_hub/controllers/User%20controllers/home_page_body_and_bottom_nav.dart';
import 'package:workers_hub/controllers/worker%20Conrollers/dashboard_controller.dart';
//final HomePageController homeController = Get.find();
class WorkerBottomNav extends StatelessWidget {
  const WorkerBottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<DashBoardController>(
    init: DashBoardController(),
      builder: (controller) {
        return Scaffold(
          body: controller.screens[controller.currentIndex],
          bottomNavigationBar: GetBuilder<DashBoardController>(
              builder: (controll) {
                return BottomNavigationBar(
                    currentIndex: controller.currentIndex,
                    onTap: (index){
                      controller.currentIndex=index;
                      controller.update();
                    },
                    items:const [
                      BottomNavigationBarItem(
                        icon: FaIcon(FontAwesomeIcons.home,),
                        label: "Home",
                      ),
                      BottomNavigationBarItem(
                        icon: FaIcon(FontAwesomeIcons.history,),
                        label: "History",
                      ),
                      BottomNavigationBarItem(
                        icon: FaIcon(FontAwesomeIcons.userCircle,),
                        label: "Profile",
                      ),
                    ]
                );
              }
          ),
        );
      }
    );
  }
}


