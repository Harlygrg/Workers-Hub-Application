
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sizer/sizer.dart';
import 'package:workers_hub/controllers/User%20controllers/chat_controller.dart';
import 'package:workers_hub/controllers/User%20controllers/home_page_body_and_bottom_nav.dart';
import 'package:workers_hub/controllers/User%20controllers/job_post_controller.dart';
import 'package:workers_hub/controllers/User%20controllers/sign_up_and_profile_controller.dart';
import 'package:workers_hub/controllers/worker%20Conrollers/dashboard_controller.dart';
import 'package:workers_hub/views/splash_login_page&forot_p_w/forgot_password.dart';
import 'package:workers_hub/views/splash_login_page&forot_p_w/login_page.dart';
import 'package:workers_hub/views/splash_login_page&forot_p_w/splash_screen.dart';
import 'package:workers_hub/views/user_screens/bottom_nav.dart';
import 'package:workers_hub/views/user_screens/user_home_page.dart';
import 'package:workers_hub/views/worker_screens/bottom_nav_worker.dart';

import 'controllers/login_contoller.dart';
import 'controllers/User controllers/workers_list_and_category_controller.dart';

void main(){
 // Get.put(LoginController());
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(SignUpController());
  Get.put(WorkerCategoryController());
  Get.put(ChatController());
  Get.put(HomePageController());
  Get.put(DashBoardController());
  Get.put(LoginController());
  runApp(MyApp());

}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}): super(key:key);
  @override
  Widget build(BuildContext context){
    return Sizer(
      builder: (context,orientation,deviceType){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home:
          //BottomNav(),
          //UserHomePage(),
          //ForgotPW(),
          //
           LoginPage(),
          //SplashScreen(),
          theme:ThemeData(
              primarySwatch:  Colors.teal,
            //backgroundColor: Colors.teal
          ),
        );
      }
    );
  }
}


