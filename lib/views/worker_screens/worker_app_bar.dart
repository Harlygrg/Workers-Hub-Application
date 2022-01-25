import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:sizer/sizer.dart';
import 'package:workers_hub/models/constants.dart';
import 'package:workers_hub/views/refactoredWidgets/refactored_widgets.dart';
import 'package:workers_hub/views/user_screens/end_drawer_home_page.dart';
import 'package:workers_hub/views/worker_screens/Worker%20Chat/worker_chat_notifications.dart';


workerAppBar(){
  return AppBar(
    // leading:button.iconButton(
    //     onPressed: (){},
    //     icon: FaIcon(FontAwesomeIcons.user)
    // ),
    title: refactText(
      text: "Your Dashboard",
      fontSize: 15.sp,
      fontWeight: FontWeight.bold,
      color: white,
    ),
    actions: [
      InkWell(
        onTap: (){
          Get.to( WorkerChatNotifications());
        },
        child: SizedBox(
          width: 50,height: 50,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                //left: -10.7.w,top: -8.w,
                child: button.iconButton(
                    onPressed: (){},
                    icon: FaIcon(FontAwesomeIcons.solidComment,color: white,size: 25,)
                ),
              ),
              Positioned(
                  top: 2.w,left: 2.w,
                  child: SizedBox(
                    width: 18,height: 18,
                    child: CircleAvatar(
                      child: refactText(text: "12",color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),
                      backgroundColor: grey,
                    ),
                  ))
            ],
          ),
        ),
      ),
    ],
  );
}