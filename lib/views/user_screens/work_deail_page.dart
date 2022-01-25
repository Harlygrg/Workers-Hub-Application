import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sizer/sizer.dart';
import 'package:workers_hub/controllers/User%20controllers/worker_details_page_controller.dart';
import 'package:workers_hub/models/constants.dart';
import 'package:workers_hub/views/refactoredWidgets/refactored_widgets.dart';
import 'end_drawer_home_page.dart';

class WorkDetailPage extends StatelessWidget {
   WorkDetailPage({Key? key}) : super(key: key);
  WidgetRefact widget =WidgetRefact();
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<WorkerDetailsPageController>(
      init: WorkerDetailsPageController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: primeColor,
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.divider(height: 3.h),
                SizedBox(
                  width: 50.w,
                  height: 5.h,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //FaIcon(FontAwesomeIcons.rupeeSign),
                      SizedBox(
                        width: 20.w,
                        height: 5.h,
                        child: CircleAvatar(
                          backgroundColor: white,
                        ),
                      ),
                      Spacer(),
                      refactText(
                          text: "Raj Kumar",fontSize: 13.sp,
                          fontWeight: FontWeight.bold
                      )
                    ],
                  ),
                ),
                divider1,
                SizedBox(
                  width: 60.5.w,
                  height: 5.5.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      widget.divider(width: 20.w),
                      FaIcon(FontAwesomeIcons.mapSigns),
                      Spacer(),
                      refactText(
                          text: "South Beach\n"
                              "Kozhikode, Kerala",fontSize: 11.sp,
                          fontWeight: FontWeight.w500
                      )
                    ],
                  ),
                ),

                divider1,
                Row(
                  children: [
                    widget.divider(width: 20.w),
                    SizedBox(
                      width: 70.w,
                      height: 9.5.h,
                      child:
                      refactText(text: "Proffessional painter with more than 5 years of experience. Worked abroad for 2 years."
                          "Good knowledge in modern painting technologies",color: white),
                    ),
                  ],
                ),
                divider1,
                Row(
                  children: [
                    widget.divider(width: 20.w),
                    SizedBox(
                      width: 40.w,
                      height: 3.5.h,
                      child:
                      ListView.builder(
                          itemCount:4,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context,int index){
                            return const Icon(
                              Icons.star_rate_rounded,color: Color(0xffFFD700),
                            );
                          }
                      ),
                    ),
                    button.textButton(onPressed:(){
                      controller.comments();
                    } , text: "Comments",fontWeight: FontWeight.w500,color: Color(0xff000066))
                  ],
                ),
                controller.showComments?
                SizedBox(
                  width: rWidth(context),
                  height: 30.h,
                  child: ListView.builder(
                      itemBuilder: (BuildContext context,int index){
                        return Card(
                          color: grey,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: SizedBox(
                            width: 90.w,
                            height: 10.h,

                            child: Padding(padding: EdgeInsets.only(left: 10,top: 5,right: 10,bottom: 5),
                            child: refactText(
                              text: "Good work, very proffessional and fast. Keep it up.",fontWeight: FontWeight.w500,

                            ),),
                          ),
                        );
                      }
                  ),
                ):divider3,

                widget.divider(height: 8.h),
                Align(
                  alignment: Alignment.center,
                  child:button.submitButton(
                      text: "Invite to work",
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
    );
  }
}
