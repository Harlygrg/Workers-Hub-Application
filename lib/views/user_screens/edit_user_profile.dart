import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:sizer/sizer.dart';
import 'package:workers_hub/constants/constants.dart';
import 'package:workers_hub/views/change_password.dart';
import 'package:workers_hub/views/refactoredWidgets/appbar_title.dart';
import 'package:workers_hub/views/refactoredWidgets/refactored_widgets.dart';

import 'end_drawer_home_page.dart';

class EditUserProfile extends StatelessWidget {
   EditUserProfile({Key? key}) : super(key: key);
   final ButtonRefact buttonRefact =ButtonRefact();
   var formRefact = FormFieldRefact();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title:appbarTitle(),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              divider1,
              // SizedBox(
              //     width: 30.w,
              //     height: 15.h,
              //     child: Stack(
              //       children: [
              //         SizedBox(
              //           width: 30.w,
              //           height: 15.h,
              //           child: CircleAvatar(
              //             backgroundColor: Colors.blue,
              //             child: refactText(text: "Worker Image"),
              //           ),
              //         ),
              //         Positioned(right: 2.w,
              //             bottom: 1.h,
              //             child: FaIcon(FontAwesomeIcons.edit))
              //       ],
              //     )
              // ),
              Form(
                  child: Center(
                    child: SizedBox(
                      width: 85.w,
                      child: Column(
                        children: [
                          divider3,
                          formRefact.textFormField(
                              hintText: "Full Name",
                              icon:FaIcon(FontAwesomeIcons.user)
                          ),
                          divider3,
                          formRefact.textFormField(
                              hintText: "Email",
                              icon:FaIcon(FontAwesomeIcons.envelope)
                          ),
                          divider3,
                          formRefact.textFormField(
                              hintText: "Contact Number",
                              icon:FaIcon(FontAwesomeIcons.phone)
                          ),
                          divider3,
                          formRefact.textFormField(
                            hintText: "Address",
                            icon: FaIcon(FontAwesomeIcons.addressCard),
                          ),
                          divider3,
                          formRefact.textFormField(
                            hintText: "Operational City",
                            icon: FaIcon(FontAwesomeIcons.landmark),
                          ),

                          divider3,
                        ],
                      ),
                    ),
                  ) ),

              divider4,
              buttonRefact.submitButton(

                  text:  "Save Changes", onPressed:  (){
                //Get.to(()=>);
              }),
              divider1,
              buttonRefact.elevatedButton(text: "cancel", onPressed: (){},buttonColor: white,textColor: primeColor),
              divider1,
              buttonRefact.textButton(onPressed:(){
                Get.to(()=>ChangePassword());
              } ,
                  text: "Change Password",color: Colors.blue,fontWeight: FontWeight.w500)
            ],
          ),
        ),
      ),
    );
  }
}
