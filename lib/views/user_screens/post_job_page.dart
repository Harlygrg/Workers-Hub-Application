import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:workers_hub/controllers/User%20controllers/job_post_controller.dart';
import 'package:workers_hub/views/refactoredWidgets/refactored_widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sizer/sizer.dart';
import 'package:workers_hub/controllers/User%20controllers/sign_up_and_profile_controller.dart';
import 'package:workers_hub/constants/constants.dart';
import 'package:workers_hub/views/refactoredWidgets/appbar_title.dart';
import 'package:workers_hub/views/user_screens/user_home_page.dart';
import 'package:workers_hub/views/user_screens/user_sign_up.dart';


class PostJob extends StatelessWidget {
   PostJob({Key? key}) : super(key: key);
  //final SignUpController signUpController = Get.find();
  final JobPostController jobPostController = Get.put(JobPostController());
  final ButtonRefact buttonRefact =ButtonRefact();
   FormFieldRefact formRefact = FormFieldRefact();
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
              Form(
                  child: Center(
                    child: SizedBox(
                      width: 85.w,
                      child: Column(
                        children: [
                          divider4,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              refactText(text: "Job Type",fontSize: 12.sp,fontWeight: FontWeight.w500),
                              SizedBox(
                                width: 28.3.w,
                                height: 8.w,
                                child: GetBuilder<JobPostController>(
                                  builder: (controller) {
                                    return DropdownButton(
                                      underline: Text(""),
                                      style: TextStyle(color: black),
                                      value: jobPostController.selectedCat,
                                      items: jobPostController.jobCategories.map((itemNames){
                                        return DropdownMenuItem(value:itemNames,
                                            child: Text(itemNames,style: TextStyle(fontSize: 12.sp,color: black),)
                                        );
                                      }).toList(),
                                      onChanged: jobPostController.newVal,
                                    );
                                  }
                                ),
                              )
                            ],
                          ),

                          divider4,
                          formRefact.textFormField(
                            hintText: "Contact Number",
                            icon:const Icon(
                              Icons.phone_outlined,
                            ),
                          ),
                          divider4,
                          formRefact.textFormField(
                            hintText: "Address",
                            icon: FaIcon(FontAwesomeIcons.addressCard),
                          ),
                          divider4,
                       formRefact.textFormField(
                                  hintText: "Job Location",
                                  icon:const Icon(
                                    Icons.place_outlined,
                                  ),
                                ),

                          divider4,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              refactText(text: "Schedule Time",fontSize: 12.sp,fontWeight: FontWeight.w500),
                               refactText(text: "12/02/2022"),

                            ],
                          ),
                          divider4,
                          formRefact.textFormField(
                            hintText: "Your requirements",

                          ),
                          divider4,
                          formRefact.textFormField(
                            hintText: "Budget",

                          ),
                        ],
                      ),
                    ),
                  ) ),
              divider4,
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     GetBuilder<SignUpController>(
              //         builder: (controller) {
              //           return Checkbox(
              //               value: signUpController.agreeTerms,
              //               onChanged: (value){
              //                 signUpController.agreeTerms=value!;
              //                 signUpController.update();
              //               }
              //           );
              //         }
              //     ),
              //     Text("Accept terms and conditions",
              //       style: TextStyle(
              //         fontSize: 14.sp,color: black54,
              //       ),),
              //   ],
              // ),
              divider4,
              buttonRefact.submitButton(

                  text:  "Post Work", onPressed:  (){
                Get.to(()=>UserHomePage());
              })
            ],
          ),
        ),
      ),
    );
  }
}
