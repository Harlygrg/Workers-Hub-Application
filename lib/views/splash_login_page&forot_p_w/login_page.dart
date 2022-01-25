

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sizer/sizer.dart';
import 'package:workers_hub/controllers/login_contoller.dart';
import 'package:workers_hub/models/constants.dart';
import 'package:workers_hub/views/refactoredWidgets/refactored_widgets.dart';
import 'package:email_validator/email_validator.dart';
import 'package:workers_hub/views/splash_login_page&forot_p_w/forgot_password.dart';
import 'package:workers_hub/views/user_screens/user_sign_up.dart';


class LoginPage extends StatelessWidget{
  //final LoginController logController = Get.find();
 final WidgetRefact  widgets = WidgetRefact();
  final FormFieldRefact  formRefact = FormFieldRefact();
 final ButtonRefact button = ButtonRefact();

   LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (logController) {
          return Scaffold(
            //resizeToAvoidBottomInset: false,
            backgroundColor: primeColor,
            body: SingleChildScrollView(
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      width: rWidth(context)*.9,
                      height: rHeight(context)*.35,
                      child: Image.asset(skilledLabours,fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  divider3,
                  Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    child: Container(
                      padding:const EdgeInsets.all(20),
                      height: rHeight(context)*.52,
                      width: rWidth(context)*.9,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                      button.loginButton(
                      buttonText: "    Worker    ",
                        textColor: logController.isWorker? white:primeColor,
                        backgroundColor:  logController.isWorker? primeColor :white,

                        onTap:  logController.workerButtonOnTap,
                      ),

                              button.loginButton(
                                  buttonText: "  Employer  ",
                                  textColor: !logController.isWorker? white:primeColor,
                                  backgroundColor: !logController.isWorker? primeColor :white,
                                  onTap: logController.emplrButtonOnTap
                              ),


                            ],
                          ),

                          divider3,

                          divider3,
                          Form(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                              child: Column(
                                children: [
                                  TextFormField(
                                    decoration: const InputDecoration(
                                        hintText:"Email id" ,
                                        suffix: Icon(
                                          Icons.mail_outline_outlined,color: grey,
                                        ) ,
                                        border: UnderlineInputBorder(
                                            borderSide: BorderSide(color: primeColor)
                                        )
                                    ),
                                    validator: (value){
                                      EmailValidator.validate(value!) ? null:  "please Enter a vaild email";
                                    },
                                  ),
                                  divider1,
                                  widgets.divider(height: 13),
                                  formRefact.textFormField(hintText: "Password ",
                                  icon:const Icon(
                                    Icons.lock_outlined,color: Colors.grey,
                                  ),),
                                ],
                              )
                          ),
                          TextButton(
                              child: Text("Forgot password?",style: TextStyle(fontSize: 15,color: primeColor),),
                            onPressed: (){
                                Get.to(()=>ForgotPW());
                            },),
                          widgets.divider(height: rHeight(context)*.03),
                          button.submitButton(text: "Login",
                              onPressed: (){
                                logController.loginClick();
                              },
                          ),
                          divider1,
                          RichText(text: TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.bold,color: black),
                            children: <TextSpan>[
                              TextSpan(
                                text: " Register.",
                                style: TextStyle(
                                    fontSize: 12.sp,fontWeight: FontWeight.bold,
                                    color: primeColor,),
                                recognizer: TapGestureRecognizer()..onTap=(){
                                  print("-------------go to user sign up");
                                 logController.regestrClick();
                                },
                              )
                            ]
                          ))
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