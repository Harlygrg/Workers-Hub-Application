import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:workers_hub/models/constants.dart';
import 'package:workers_hub/views/refactoredWidgets/refactored_widgets.dart';
 class SplashScreen extends StatelessWidget {
   const SplashScreen({Key? key}) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return SafeArea(
       child: Scaffold(
         body:Center(
           child: SizedBox(
             width: rWidth(context)*.80,
             height: rHeight(context)*.75,
             child: Column(
               children: [
                 SizedBox(
                   width: rWidth(context)*.70,
                   height: rHeight(context)*.50,
                   child: Image.asset(logo),
                 ),
                 Container(
                   width: rWidth(context)*.50,
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

                         )
                       ]
                     ),

                     ),
                   ),
                 )
               ],
             ),
           ),
         ),
       ),
     );
   }
 }
 