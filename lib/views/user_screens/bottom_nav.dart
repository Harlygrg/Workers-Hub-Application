import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:workers_hub/controllers/User%20controllers/home_page_body_and_bottom_nav.dart';
final HomePageController homeController = Get.find();
class BottomNav extends StatelessWidget {
  BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomePageController>(
        builder: (controller){
          return homeController.screens[homeController.currentIndex];
        },
      ),
      bottomNavigationBar: GetBuilder<HomePageController>(
          builder: (controll) {
            return BottomNavigationBar(
                currentIndex: homeController.currentIndex,
                onTap: (index){
              homeController.currentIndex=index;
              homeController.update();
            },
                items:const [
                  BottomNavigationBarItem(
                    icon: FaIcon(FontAwesomeIcons.home,),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: FaIcon(FontAwesomeIcons.wpforms,),
                    label: "Post Job",
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
}
