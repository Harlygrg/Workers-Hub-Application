
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sizer/sizer.dart';
import 'package:workers_hub/controllers/login_contoller.dart';
import 'package:workers_hub/constants.dart';
import 'package:workers_hub/views/refactoredWidgets/refactored_widgets.dart';

class PWreset extends StatelessWidget {
   PWreset({Key? key}) : super(key: key);
   final LoginController _loginController = Get.find();
  final ButtonRefact button = ButtonRefact();
  final WidgetRefact _widgetRefact=WidgetRefact();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: rWidth(context),
          height: rHeight(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _widgetRefact.divider(height: rHeight(context)*.08),
              Center(child: Image.asset(resetPW,width:rWidth(context)*.5,)),
              Text("New Credentials",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
              divider1,
              Text("Enter OTP and reset password",style: TextStyle(fontSize: 12.sp,color: primeColor),),
              Form(child:       SizedBox(
                width: rWidth(context)*.75,
                child: Column(
                  children: [
                    TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintText:"OTP" ,
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: primeColor)
                          )
                      ),
                    ),
                    divider3,
                    GetBuilder<LoginController>(
                      builder: (controller) {
                        return TextFormField(
                          obscureText: _loginController.passwordShow? false:true,
                        decoration: InputDecoration(
                          hintText: "Enter New password",
                          suffixIcon: IconButton(
                              onPressed: _loginController.showPW,
                              icon: !_loginController.passwordShow? const Icon(
                                Icons.visibility_outlined,
                              ):const Icon(
                                Icons.visibility_off_outlined,
                              ),
                          ),

                        ),

                        );
                      }
                    ),
                    divider3,
                    TextFormField(
                      decoration:const InputDecoration(
                        hintText: "Confirm password",
                        suffixIcon: Icon(
                          Icons.lock_outlined,
                        ),
                      ),

                    ),
                  ],
                ),
              ),
              ),

              _widgetRefact.divider(height: 6.h),

          SizedBox(
            width: 76.w,
            child:  button.submitButton(text: "Reset", onPressed:()=>_loginController.resetPW(),
            ),
          ),

            ],
          ),
        ),
      ),
    );
  }
}
