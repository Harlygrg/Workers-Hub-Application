import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sizer/sizer.dart';
import 'package:workers_hub/constants/constants.dart';
import 'package:workers_hub/controllers/User%20controllers/sign_up_and_profile_controller.dart';
import 'package:workers_hub/views/refactoredWidgets/refactored_widgets.dart';
import 'package:workers_hub/views/splash_login_page&forot_p_w/login_page.dart';
import 'package:workers_hub/views/user_screens/edit_user_profile.dart';
import 'package:workers_hub/views/user_screens/end_drawer_home_page.dart';
class UserProfile extends StatelessWidget {
   UserProfile({Key? key}) : super(key: key);
WidgetRefact widget = WidgetRefact();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      init: SignUpController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.teal[100],
          body:SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: rWidth(context),height: rWidth(context)/2,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                          top: -rWidth(context),
                          left: -rWidth(context)/4,
                          child: Container(
                        width: rWidth(context)*1.5,
                        height: rWidth(context)*1.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular((rWidth(context)*1.5)/2),
                            color: primeColor,
                        ),
                      )
                      ),
                      Positioned(
                        left: rWidth(context)/2-(30.w/2),
                          top: rWidth(context)/2-(30.w/2),
                          child: SizedBox(
                            width: 30.w,
                            height: 30.w,
                            child: CircleAvatar(
                              backgroundColor: Colors.green,
                                child: SizedBox(
                                  width: 28.w,
                                  height: 28.w,
                                  child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                    child: Image.asset(maid,fit: BoxFit.cover,),
                                  ),
                                ),
                            ),
                          )
                      ),
                    ],
                  ),
                ),
                widget.divider(height: 8.h),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: SizedBox(
                    width: rWidth(context),
                    //height: 48.h,
                    //height: rHeight(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width:40.w,
                              height: 38.h,
                              child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  divider1,
                                  refactText(text: "First Name",fontWeight: FontWeight.w400,fontSize: 12.sp,),
                                  divider1,
                                  refactText(text: "Last Name",fontWeight: FontWeight.w400,fontSize: 12.sp,),
                                  divider1,
                                  refactText(text: "Phone",fontWeight: FontWeight.w400,fontSize: 12.sp,),
                                  divider1,
                                  refactText(text: "Email",fontWeight: FontWeight.w400,fontSize: 12.sp,),
                                  divider1,
                                  refactText(text: "Address",fontWeight: FontWeight.w400,fontSize: 12.sp,),
                                  divider1,
                                  Spacer()
                                ],
                              ),
                            ),
                            SizedBox(
                              width:40.w,
                              height: 38.h,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  divider1,
                                  refactText(text: "Raju",fontWeight: FontWeight.w500,fontSize: 12.sp,),
                                  divider1,
                                  refactText(text: "Rajive",fontWeight: FontWeight.w500,fontSize: 12.sp,),
                                  divider1,
                                  refactText(text: "99 88 77 66 55 44",fontWeight: FontWeight.w500,fontSize: 12.sp,),
                                  divider1,
                                  refactText(text: "rajRaju@gmail.com",fontWeight: FontWeight.w500,fontSize: 12.sp,),
                                  divider1,
                                  refactText(text: "Raj Nagar\n"
                                      "Near Palayam\n"
                                      "Kozhikode\n"
                                      "Kerala",fontWeight: FontWeight.w500,fontSize: 12.sp,),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),

                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: button.submitButton(text: "Edit Profile", onPressed: (){
                    Get.to(()=>EditUserProfile());
                  }),
                ),
                Align(
                  alignment: Alignment.center,
                  child: button.iconButton(icon: FaIcon(FontAwesomeIcons.signOutAlt),
                      onPressed: (){
                    controller.logoutButtonOnClickedEvents();
                  }),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
