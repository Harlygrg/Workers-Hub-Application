import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:workers_hub/constants/constants.dart';
import 'package:workers_hub/views/refactoredWidgets/refactored_widgets.dart';
import 'package:workers_hub/views/user_screens/end_drawer_home_page.dart';
class WorkerNotificationDetails extends StatelessWidget {
   WorkerNotificationDetails({Key? key}) : super(key: key);
   WidgetRefact widget =WidgetRefact();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primeColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        widget.divider(height: 3.h),
            SizedBox(
              width: 30.w,
              height: 5.h,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FaIcon(FontAwesomeIcons.rupeeSign),
                  Spacer(),
                  refactText(
                      text: "850/Daily",fontSize: 13.sp,
                    fontWeight: FontWeight.bold
                  )
                ],
              ),
            ),
            divider1,
            SizedBox(
              width: 47.5.w,
              height: 5.5.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FaIcon(FontAwesomeIcons.mapSigns),
                  Spacer(),
                  refactText(
                      text: "South Beach\n"
                          "Kozhikode, Kerala",fontSize: 13.sp,
                      fontWeight: FontWeight.bold
                  )
                ],
              ),
            ),
          widget.divider(height: 5.h),
            refactText(text: "Work Schedule",fontWeight: FontWeight.bold,fontSize: 13.sp,color: white),
            widget.divider(height: 1.h),
            Padding(padding: EdgeInsets.only(left: 20),
              child:  refactText(text: "28/02/2022, flexible time",fontWeight: FontWeight.bold,fontSize: 12.sp,color: black),
            ),
            widget.divider(height: 8.h),
            Align(
              alignment: Alignment.center,
              child:button.submitButton(
                  text: "Ready to proceed",
                  onPressed: (){},
                  textColor: primeColor,
                  buttonColor: white
              ) ,
            )


          ],
        ),
      ),
    );
  }
}
