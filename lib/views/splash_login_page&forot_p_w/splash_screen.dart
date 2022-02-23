import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sizer/sizer.dart';
import 'package:workers_hub/constants/constants.dart';
import 'package:workers_hub/controllers/login_contoller.dart';
import 'package:workers_hub/views/refactoredWidgets/refactored_widgets.dart';
import 'package:workers_hub/views/splash_login_page&forot_p_w/login_page.dart';
import 'package:workers_hub/views/user_screens/end_drawer_home_page.dart';
//  class SplashScreen extends StatefulWidget {
//    const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//
//   final WidgetRefact  widgets = WidgetRefact();
//   final FormFieldRefact  formRefact = FormFieldRefact();
//   final ButtonRefact button = ButtonRefact();
//    @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     navigateToLogin();
//   }
//    navigateToLogin(){
//      Future.delayed(Duration(seconds: 2)).then((value)  {
//        Navigator.pushAndRemoveUntil(
//            context,
//            MaterialPageRoute(builder: (context)=>LoginPage()) ,
//                (route) => false);
//      });
//    }
//    @override
//    Widget build(BuildContext context) {
//
//    }
// }
 class SplashScreen extends StatelessWidget {
   const SplashScreen({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
       final WidgetRefact  widgets = WidgetRefact();
  final FormFieldRefact  formRefact = FormFieldRefact();
  final ButtonRefact button = ButtonRefact();
     return SafeArea(
       child: GetBuilder<LoginController>(
           init: LoginController(),
           builder: (logController) {
             return Scaffold(
               body:Center(
                 child: SizedBox(
                   width: rWidth(context)*.80,
                   height: rHeight(context)*.75,
                   child: Column(
                     children: [
                       SizedBox(
                         width: rWidth(context)*.60,
                         height: rHeight(context)*.30,
                         child: Image.asset(logo),
                       ),
                       Container(
                         width: rWidth(context)*.78,
                         height: rHeight(context)*.20,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(5),
                           color: primeColor,
                         ),
                         child: Center(
                           child: RichText(text: TextSpan(
                               text: "WORKERS HUB\n",
                               style: TextStyle(fontSize: 20.sp,
                                   color: white,fontWeight: FontWeight.bold),
                               children: <TextSpan>[
                                 TextSpan(
                                     text: "Be a Hirer or being Hired",
                                     style: TextStyle(fontSize: 10.sp,color: black)

                                 ),

                               ]
                           ),

                           ),
                         ),
                       ),
                       // widgets.divider(height: 4.h),
                       // Row(
                       //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       //   children: [
                       //     button.loginButton(
                       //       buttonText: "    Worker    ",
                       //       textColor: logController.isWorker? white:primeColor,
                       //       backgroundColor:  logController.isWorker? primeColor :white,
                       //
                       //       onTap:  logController.workerButtonOnTap,
                       //     ),
                       //
                       //     button.loginButton(
                       //         buttonText: "  Employer  ",
                       //         textColor: !logController.isWorker? white:primeColor,
                       //         backgroundColor: !logController.isWorker? primeColor :white,
                       //         onTap: logController.emplrButtonOnTap
                       //     ),
                       //   ],
                       // ),
                       // widgets.divider(height: 3.h),
                       // button.submitButton(text: "Register", onPressed: (){
                       //   logController.regestrClick();
                       // }),
                       // widgets.divider(height:2.h),
                       // Expanded(
                       //   child: RichText(text: TextSpan(
                       //       text: "Already a user? ",
                       //       style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.bold,color: black),
                       //       children: <TextSpan>[
                       //         TextSpan(
                       //           text: " Log in",
                       //           style: TextStyle(
                       //             fontSize: 12.sp,fontWeight: FontWeight.bold,
                       //             color: primeColor,),
                       //           recognizer: TapGestureRecognizer()..onTap=(){
                       //             print("-------------go to user sign up");
                       //             Get.offAll(()=>LoginPage());
                       //           },
                       //         )
                       //       ]
                       //   )),
                       // )
                     ],
                   ),
                 ),
               ),
             );
           }
       ),
     );
   }
 }
