import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sizer/sizer.dart';
import 'package:workers_hub/controllers/text_editing_controllers.dart';
import 'package:workers_hub/controllers/worker%20Conrollers/worker_signup_controller.dart';
import 'package:workers_hub/constants/constants.dart';
import 'package:workers_hub/controllers/form_validation_validate_methods.dart';
import 'package:workers_hub/views/refactoredWidgets/appbar_title.dart';
import 'package:workers_hub/views/refactoredWidgets/refactored_widgets.dart';
import 'package:workers_hub/views/user_screens/end_drawer_home_page.dart';
import 'package:workers_hub/views/worker_screens/bottom_nav_worker.dart';

import '../multi_select_dropdown.dart';
class WorkerSignUp extends StatelessWidget {
   WorkerSignUp({Key? key}) : super(key: key);
  final ButtonRefact buttonRefact =ButtonRefact();
   FormFieldRefact formRefact = FormFieldRefact();
   final ValidationMethods _validate=ValidationMethods();
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
                    key: _signUpController.workerRegestrationFormKey,
                      child: Center(
                        child: SizedBox(
                          width: 85.w,
                          child: Column(
                            children: [
                              // divider3,
                              // formRefact.textFormField(
                              //     hintText: "First Name",
                              //     autovalidateMode: AutovalidateMode.onUserInteraction,
                              //     keyboardType: TextInputType.text,
                              //     controller: firstNameController,
                              //     validator: _validate.nameValidator,
                              //     icon:FaIcon(FontAwesomeIcons.user)
                              // ),
                              // divider3,
                              // formRefact.textFormField(
                              //     autovalidateMode: AutovalidateMode.onUserInteraction,
                              //     controller: lastNameController,
                              //     keyboardType: TextInputType.text,
                              //     validator: _validate.nameValidator,
                              //     hintText: "Last Name",
                              //     icon:FaIcon(FontAwesomeIcons.user)
                              // ),
                              divider3,
                              formRefact.textFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  controller: emailController,
                                  validator: _validate.emailValidator,
                                  hintText: "Email",
                                  icon:FaIcon(FontAwesomeIcons.envelope)
                              ),
                              // divider3,
                              // formRefact.textFormField(
                              //     autovalidateMode: AutovalidateMode.onUserInteraction,
                              //     keyboardType: TextInputType.number,
                              //     validator: _validate.contactNumberValidator,
                              //
                              //   hintText: "Contact Number",
                              //   icon:FaIcon(FontAwesomeIcons.phone)
                              // ),
                              // divider3,
                              // formRefact.textFormField(
                              //   autovalidateMode: AutovalidateMode.onUserInteraction,
                              //   controller: addressController,
                              //   keyboardType: TextInputType.text,
                              //   validator: _validate.addressValidator,
                              //   hintText: "Address",
                              //   icon: FaIcon(FontAwesomeIcons.addressCard),
                              // ),
                              divider3,
                              formRefact.textFormField(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                controller: operationalCityController,
                                keyboardType: TextInputType.text,
                                validator: _validate.nameValidator,
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
                                      onPressed: (){
                                          _signUpController.pickIdProof();
                                      },
                                      text: "Upload Idproof",
                                      color: primeColor,
                                    fontSize: 12.sp,fontWeight: FontWeight.bold

                                  )
                                ],
                              ),
                              divider3,
                              formRefact.textFormField(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                controller: descriptionController,
                                validator: _validate.requiredValidator,
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
                              // divider3,
                              // formRefact.textFormField(
                              //   hintText: "Password",
                              //   autovalidateMode: AutovalidateMode.onUserInteraction,
                              //   controller: passwordController,
                              //   validator: _validate.passwordValidator,
                              //   keyboardType: TextInputType.visiblePassword,
                              //   obscuretext: _signUpController.showPW? false:true,
                              //   icon:IconButton(
                              //     onPressed: (){
                              //       _signUpController.passwordShow();
                              //     },
                              //     icon: !_signUpController.showPW?
                              //     FaIcon(FontAwesomeIcons.eye):FaIcon(FontAwesomeIcons.eyeSlash),
                              //   ),
                              // ),
                              // divider3,
                              // formRefact.textFormField(
                              //   autovalidateMode: AutovalidateMode.onUserInteraction,
                              //   controller: confirmPasswordController,
                              //     validator: _validate.confirmPasswordValildate,
                              //   obscuretext: true,
                              //   hintText: "Confirm Passoword",
                              //   icon:FaIcon(FontAwesomeIcons.lock),
                              // ),
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

                      text:  "Register", onPressed:(){
                    _signUpController.regesterButtonOnPressed();
                  }


                  ),
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



