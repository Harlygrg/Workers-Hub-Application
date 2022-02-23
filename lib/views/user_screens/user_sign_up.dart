import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sizer/sizer.dart';
import 'package:workers_hub/controllers/User%20controllers/sign_up_and_profile_controller.dart';
import 'package:workers_hub/constants/constants.dart';
import 'package:workers_hub/controllers/text_editing_controllers.dart';
import 'package:workers_hub/views/refactoredWidgets/appbar_title.dart';
import 'package:workers_hub/views/refactoredWidgets/refactored_widgets.dart';
import '../../controllers/form_validation_validate_methods.dart';



class UserSignUp extends StatelessWidget {
   UserSignUp({Key? key}) : super(key: key);
   final ButtonRefact buttonRefact =ButtonRefact();
   final ValidationMethods _validate=ValidationMethods();
   WidgetRefact widget = WidgetRefact();

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
                              validator: _validate.nameValidator,
                              icon:const Icon(
                                Icons.person_outlined,
                              )
                          ),
                          widget.divider(height: 1.h),
                          formRefact.textFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: lastNameController,
                              keyboardType: TextInputType.text,
                              validator: _validate.nameValidator,
                              hintText: "Last Name",
                              icon:const Icon(
                                Icons.person_outlined,
                              )
                          ),
                          widget.divider(height: 1.h),
                          formRefact.textFormField(
                            keyboardType: TextInputType.emailAddress,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: emailController,
                            validator:  _validate.emailValidator,
                            hintText: "Email",
                              icon:const Icon(
                                Icons.email_outlined,
                              ),
                          ),
                          widget.divider(height: 1.5.h),
                          formRefact.textFormField(
                            hintText: "Contact Number",
                            controller: contactNumberController,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.number,
                            validator:  _validate.contactNumberValidator,

                            icon:const Icon(
                                Icons.phone_outlined,
                              ),
                          ),
                          widget.divider(height: 1.5.h),
                          widget.divider(height: 1.h),
                          formRefact.textFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: addressController,
                            keyboardType: TextInputType.text,
                            validator:  _validate.addressValidator,
                            hintText: "Address",
                            icon: Image.asset(addressIcon,width: 2.w,height: .5.h,),
                          ),
                          widget.divider(height: 1.5.h),
                          formRefact.textFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            validator:  _validate.passwordValidator,
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
                          widget.divider(height: 1.5.h),
                          formRefact.textFormField(
                            obscuretext: true,
                            validator:  _validate.confirmPasswordValildate,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: confirmPasswordController,
                              hintText: "Confirm Passoword",
                              icon:const Icon(
                                Icons.lock_outlined,
                              ),
                          ),
                          widget.divider(height: 2.h),
                        ],
                      ),
                    ),
                  ) ),
                  widget.divider(height: 1.6.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Checkbox(
                          value: controller.agreeTerms,
                          onChanged: controller.agreeTermsOnchangedFunction,
                      ),
                      Text("Accept terms and conditions",
                        style: TextStyle(
                        fontSize: 14.sp,color: black54,
                      ),),
                    ],
                  ),
                  widget.divider(height: 1.5.h),
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
