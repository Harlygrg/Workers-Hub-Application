import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sizer/sizer.dart';
import 'package:workers_hub/controllers/User%20controllers/sign_up_controller.dart';
import 'package:workers_hub/controllers/worker%20Conrollers/worker_signup_controller.dart';
import 'package:workers_hub/models/constants.dart';
import 'package:workers_hub/views/refactoredWidgets/appbar_title.dart';
import 'package:workers_hub/views/refactoredWidgets/refactored_widgets.dart';
import 'package:workers_hub/views/user_screens/end_drawer_home_page.dart';
class WorkerSignUp extends StatelessWidget {
   WorkerSignUp({Key? key}) : super(key: key);
  final ButtonRefact buttonRefact =ButtonRefact();
   FormFieldRefact formRefact = FormFieldRefact();
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<WorkerSignUpController>(
      init: WorkerSignUpController(),
      builder: (_signUpController) {
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
                              divider3,
                              formRefact.signUpForm(
                                  hintText: "Full Name",
                                  icon:FaIcon(FontAwesomeIcons.user)
                              ),
                              divider3,
                              formRefact.signUpForm(
                                hintText: "Email",
                                icon:FaIcon(FontAwesomeIcons.envelope)
                              ),
                              divider3,
                              formRefact.signUpForm(
                                hintText: "Contact Number",
                                icon:FaIcon(FontAwesomeIcons.phone)
                              ),
                              divider3,
                              formRefact.signUpForm(
                                hintText: "Address",
                                icon: FaIcon(FontAwesomeIcons.addressCard),
                              ),
                              divider3,
                              formRefact.signUpForm(
                                hintText: "Operational City",
                                icon: FaIcon(FontAwesomeIcons.landmark),
                              ),
                              divider3,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  button.elevatedButton(
                                      text: "Work Type", onPressed: ()=>showMultiSelect(context)),
                                  button.textButton(
                                      onPressed: (){},
                                      text: "Upload Idproof",
                                      color: primeColor,
                                    fontSize: 12.sp,fontWeight: FontWeight.bold

                                  )
                                ],
                              ),
                              divider3,
                              formRefact.signUpForm(
                                hintText: "Short Description",
                              ),
                              divider3,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  DropdownButton(
                                    value: _signUpController.currentSubscription,
                                    items: _signUpController.subscriptionItems.map(
                                            (itemName) {
                                              return DropdownMenuItem(
                                                value: itemName,
                                                  child:  Text(itemName,style: TextStyle(fontSize: 12.sp,color: black),)
                                              );
                                            }).toList(),
                                    onChanged: _signUpController.onChanged,
                                  ),
                                 Container(
                                   width: 20.w,
                                   height: 4.5.h,
                                   decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                     border: Border.all(width: 2,color: primeColor),
                                   ),
                                   alignment: Alignment.center,
                                   child: Wrap(
                                     children: [
                                       FaIcon(FontAwesomeIcons.rupeeSign,size: 15,),
                                       refactText(text: "${_signUpController.amount}")
                                     ],
                                   ),
                                 )

                                ],
                              ),
                              divider3,
                              formRefact.signUpForm(
                                hintText: "Password",
                                obscureText: _signUpController.showPW? false:true,
                                icon:IconButton(
                                  onPressed: (){
                                    _signUpController.passwordShow();
                                  },
                                  icon: !_signUpController.showPW?
                                  FaIcon(FontAwesomeIcons.eye):FaIcon(FontAwesomeIcons.eyeSlash),
                                ),
                              ),
                              divider3,
                              formRefact.signUpForm(
                                obscureText: true,
                                hintText: "Confirm Passoword",
                                icon:FaIcon(FontAwesomeIcons.lock),
                              ),
                              divider3,
                            ],
                          ),
                        ),
                      ) ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Checkbox(
                      value: _signUpController.agreeTerms,
                      onChanged: (value){
                        _signUpController.agreeTerms=value!;
                        _signUpController.update();
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

                      text:  "Register", onPressed:  (){
                    //Get.to(()=>);
                  }),
                  divider1
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}



