
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:sizer/sizer.dart';
import 'package:workers_hub/controllers/login_contoller.dart';
import 'package:workers_hub/constants.dart';
import 'package:workers_hub/views/refactoredWidgets/refactored_widgets.dart';


class ForgotPW extends StatelessWidget {
   ForgotPW({Key? key}) : super(key: key);
   final LoginController _loginController = Get.find();

  final ButtonRefact button = ButtonRefact();
  final WidgetRefact _widgetRefact=WidgetRefact();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
          width: rWidth(context),
        height: rHeight(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _widgetRefact.divider(height: rHeight(context)*.1),
              Center(child: Image.asset(forgotPW,width:rWidth(context)*.5,)),
            Text("Forgot your Pasword?",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
            divider1,
            Text("Confirm your email",style: TextStyle(fontSize: 12.sp,color: primeColor),),
            Form(child:       SizedBox(
              width: rWidth(context)*.8,
              child: TextFormField(
                decoration:const  InputDecoration(
                    hintText:"Email id" ,
                    suffix: Icon(
                      Icons.mail_outline_outlined,color: grey,
                    ) ,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: primeColor)
                    )
                ),
                validator: EmailValidator(errorText: "Enter a valid Email address"),
              ),
            ),
            ),
            divider3,
           divider1,
           SizedBox(
             width: 75.w,
             child:  button.submitButton(text: "Next", onPressed:()=> _loginController.confirmEmail(),
           ),
            )
          ],
        ),
      ),
    );
  }
}
