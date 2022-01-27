import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sizer/sizer.dart';
import 'package:workers_hub/controllers/User%20controllers/sign_up_controller.dart';
import 'package:workers_hub/constants.dart';
import 'package:workers_hub/controllers/text_editing_controllers.dart';
import 'package:workers_hub/views/refactoredWidgets/appbar_title.dart';
import 'package:workers_hub/views/refactoredWidgets/refactored_widgets.dart';
import '../../form_validation_validate_methods.dart';



class UserSignUp extends StatelessWidget {
   UserSignUp({Key? key}) : super(key: key);
   final ButtonRefact buttonRefact =ButtonRefact();

  FormFieldRefact formRefact = FormFieldRefact();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      init: SignUpController(),
      builder: (controller) {
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
                      key: controller.userSignUpFormKey,
                      child: Center(
                    child: SizedBox(
                      width: 85.w,
                      child: Column(
                        children: [
                          divider4,
                          formRefact.textFormField(
                              hintText: "First Name",
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.text,
                              controller: firstNameController,
                              validator: requiredValidator,
                              icon:const Icon(
                                Icons.person_outlined,
                              )
                          ),
                          formRefact.textFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: lastNameController,
                              keyboardType: TextInputType.text,
                              validator: requiredValidator,
                              hintText: "Last Name",
                              icon:const Icon(
                                Icons.person_outlined,
                              )
                          ),
                          divider4,
                          formRefact.textFormField(
                            keyboardType: TextInputType.emailAddress,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: emailController,
                            validator: emailValidator,
                            hintText: "Email",
                              icon:const Icon(
                                Icons.email_outlined,
                              ),
                          ),
                          divider4,
                          formRefact.textFormField(
                            hintText: "Contact Number",
                            controller: contactNumberController,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.number,
                            validator: contactNumberValidator,

                            icon:const Icon(
                                Icons.phone_outlined,
                              ),
                          ),
                          divider4,
                          formRefact.textFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: addressController,
                            keyboardType: TextInputType.text,
                            validator: requiredValidator,
                            hintText: "Address",
                            icon: Image.asset(addressIcon,width: 2.w,height: .5.h,),
                          ),
                          divider4,
                          formRefact.textFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            validator: passwordValidator,
                            hintText: "Password",
                            obscuretext: controller.showPW? false:true,
                            icon:IconButton(
                              onPressed: (){
                                controller.passwordShow();
                              },
                              icon: !controller.showPW? const Icon(
                                Icons.visibility_outlined,
                              ):const Icon(
                                Icons.visibility_off_outlined,
                              ),
                            ),
                          ),
                          divider4,
                          formRefact.textFormField(
                            obscuretext: true,
                            validator: confirmPasswordValildate,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: confirmPasswordController,
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
                      Checkbox(
                          value: controller.agreeTerms,
                          onChanged: (value){
                            controller.agreeTerms=value!;
                            controller.update();
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
                        controller.signUpOnPressed();
                  }
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
