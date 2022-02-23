

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sizer/sizer.dart';
import 'package:workers_hub/controllers/login_contoller.dart';
import 'package:workers_hub/constants/constants.dart';
import 'package:workers_hub/controllers/text_editing_controllers.dart';
import 'package:workers_hub/views/refactoredWidgets/refactored_widgets.dart';
import 'package:workers_hub/views/splash_login_page&forot_p_w/forgot_password.dart';
import 'package:workers_hub/views/splash_login_page&forot_p_w/splash_screen.dart';
import 'package:workers_hub/views/user_screens/user_sign_up.dart';

import '../../controllers/form_validation_validate_methods.dart';

class LoginPage extends StatelessWidget{
  //final LoginController logController = Get.find();
 final WidgetRefact  widgets = WidgetRefact();
 final FormFieldRefact  formRefact = FormFieldRefact();
 final ButtonRefact button = ButtonRefact();
 final ValidationMethods _validate=ValidationMethods();
 //final formKey = GlobalKey();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){

    return SafeArea(
      child: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (logController) {
          return Scaffold(
            //resizeToAvoidBottomInset: false,
            backgroundColor: lightTeal,
            body: SingleChildScrollView(
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      width: rWidth(context)*.9,
                      height: rHeight(context)*.30,
                      child: Image.asset(skilledLabours,fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  widgets.divider(height: 3.h),
                  Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Container(
                      padding:const EdgeInsets.all(20),
                      height: 45.5.h,
                      width: 90.w,
                      child: Column(
                        children: [
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      // button.loginButton(
                      // buttonText: "    Worker    ",
                      //   textColor: logController.isWorker? white:primeColor,
                      //   backgroundColor:  logController.isWorker? primeColor :white,
                      //
                      //   onTap:  logController.workerButtonOnTap,
                      // ),
                      //
                      //         button.loginButton(
                      //             buttonText: "  Employer  ",
                      //             textColor: !logController.isWorker? white:primeColor,
                      //             backgroundColor: !logController.isWorker? primeColor :white,
                      //             onTap: logController.emplrButtonOnTap
                      //         ),
                      //
                      //       ],
                      //     ),

                          widgets.divider(height: 1.5.h),

                          Form(
                              key:logController.userLoginformKey,
                              child: Column(
                                children: [
                                  formRefact.textFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    controller: userLoginMailController,
                                    validator: _validate.emailValidator,
                                    hintText: "Email",
                                    icon:const Icon(
                                      Icons.email_outlined,
                                    ),
                                  ),
                                  widgets.divider(height: 1.2.h),
                                  formRefact.textFormField(
                                    hintText: "Password ",
                                  validator: _validate.passwordValidator,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  controller: userLoginPasswordController,
                                  obscuretext: true,
                                  icon:const Icon(
                                    Icons.lock_outlined,color: Colors.grey,
                                  ),),
                                ],
                              )
                          ),
                          widgets.divider(height: 2.h),
                          Expanded(
                            child: TextButton(
                                child: Text(
                                  "Forgot password?",style:
                                TextStyle(fontSize: 13.sp,color: primeColor),),
                              onPressed: (){
                                  Get.to(()=>ForgotPW());
                              },),
                          ),
                          widgets.divider(height: 2.h),
                          Expanded(child: button.submitButton(text: "Login",
                            onPressed: (){
                              logController.loginButtonOnClick();
                            },
                          ),),
                          widgets.divider(height: 3.h),
                          Expanded(
                            child: RichText(text: TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.bold,color: black),
                              children: <TextSpan>[
                                TextSpan(
                                  text: " Register here",
                                  style: TextStyle(
                                      fontSize: 12.sp,fontWeight: FontWeight.bold,
                                      color: primeColor,),
                                  recognizer: TapGestureRecognizer()..onTap=(){
                                    print("-------------go to user sign up");
                                   Get.to(()=>UserSignUp());
                                  },
                                )
                              ]
                            )),
                          )
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          );
        }
      ),
    );
  }
}

