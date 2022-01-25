import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sizer/sizer.dart';
import 'package:workers_hub/controllers/User%20controllers/sign_up_controller.dart';
import 'package:workers_hub/models/constants.dart';
import 'package:workers_hub/views/refactoredWidgets/appbar_title.dart';
import 'package:workers_hub/views/refactoredWidgets/refactored_widgets.dart';

final SignUpController signUpController = Get.find();
class UserSignUp extends StatelessWidget {
   UserSignUp({Key? key}) : super(key: key);
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
                      formRefact.signUpForm(
                          hintText: "Full Name",
                          icon:const Icon(
                            Icons.person_outlined,
                          )
                      ),
                      divider4,
                      formRefact.signUpForm(
                          hintText: "Email",
                          icon:const Icon(
                            Icons.email_outlined,
                          ),
                      ),
                      divider4,
                      formRefact.signUpForm(
                          hintText: "Contact Number",
                          icon:const Icon(
                            Icons.phone_outlined,
                          ),
                      ),
                      divider4,
                      formRefact.signUpForm(
                          hintText: "Address",
                          icon: Image.asset(addressIcon,width: 2.w,height: .5.h,),
                      ),
                      divider4,
                     GetBuilder<SignUpController>(
                         builder: (controller){
                           return  formRefact.signUpForm(
                             hintText: "Password",
                             obscureText: signUpController.showPW? false:true,
                             icon:IconButton(
                               onPressed: (){
                                 signUpController.passwordShow();
                               },
                               icon: !signUpController.showPW? const Icon(
                                 Icons.visibility_outlined,
                               ):const Icon(
                                 Icons.visibility_off_outlined,
                               ),
                             ),
                           );
                         }
                     ),
                      divider4,
                      formRefact.signUpForm(
                        obscureText: true,
                          hintText: "Confirm Passoword",
                          icon:const Icon(
                            Icons.lock_outlined,
                          ),
                      ),
                      divider4,
                    ],
                  ),
                ),
              ) ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GetBuilder<SignUpController>(
                    builder: (controller) {
                      return Checkbox(
                          value: signUpController.agreeTerms,
                          onChanged: (value){
                            signUpController.agreeTerms=value!;
                            signUpController.update();
                          }
              );
                    }
                  ),
                  Text("Accept terms and conditions",
                    style: TextStyle(
                    fontSize: 14.sp,color: black54,
                  ),),
                ],
              ),
              divider4,
              buttonRefact.submitButton(

                  text:  "Sign up", onPressed:  (){
                //Get.to(()=>);
              })
            ],
          ),
        ),
      ),
    );
  }
}
